import Foundation
import Testing
@testable import WhopSDK

struct CancellationContractTests {
    @Test(arguments: [0, 2])
    func cancelledTransportIsWrappedWithoutRetrying(maxRetries: Int) async throws {
        let id = UUID().uuidString
        let client = makeClient(maxRetries: maxRetries)
        do {
            try await client.performRequest(method: .get, path: "/cancel/\(id)")
            Issue.record("Expected cancellation")
        } catch WhopSDKError.networkError(let underlying) {
            #expect((underlying as? URLError)?.code == .cancelled)
        } catch {
            Issue.record("Unexpected cancellation error: \(error)")
        }
        #expect(CancellationProtocol.requestCount(id: id) == 1)
    }

    @Test func cancellationDuringBackoffIsWrappedWithoutAnotherRequest() async throws {
        let id = UUID().uuidString
        let client = makeClient(maxRetries: 2)
        let task = Task {
            try await client.performRequest(method: .get, path: "/backoff/\(id)")
        }
        for _ in 0..<500 {
            if CancellationProtocol.requestCount(id: id) > 0 { break }
            try await Task.sleep(nanoseconds: 10_000_000)
        }
        task.cancel()
        #expect(CancellationProtocol.requestCount(id: id) == 1)
        do {
            try await task.value
            Issue.record("Expected backoff cancellation")
        } catch WhopSDKError.networkError(let underlying) {
            #expect(underlying is CancellationError || (underlying as? URLError)?.code == .cancelled)
        } catch {
            Issue.record("Unexpected cancellation error: \(error)")
        }
        #expect(CancellationProtocol.requestCount(id: id) == 1)
    }

    private func makeClient(maxRetries: Int) -> HTTPClient {
        let configuration = Networking.URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [CancellationProtocol.self]
        let session = Networking.URLSession(configuration: configuration)
        return HTTPClient(config: ClientConfig(baseURL: "https://cancel.audit.invalid", maxRetries: maxRetries, urlSession: session))
    }
}

private final class CancellationProtocol: Networking.URLProtocol {
    private static let lock = NSLock()
    private static var counts: [String: Int] = [:]

    static func requestCount(id: String) -> Int {
        lock.lock()
        defer { lock.unlock() }
        return counts[id, default: 0]
    }

    override class func canInit(with request: Networking.URLRequest) -> Bool {
        request.url?.host == "cancel.audit.invalid"
    }

    override class func canonicalRequest(for request: Networking.URLRequest) -> Networking.URLRequest {
        request
    }

    override func startLoading() {
        guard let url = request.url else { return }
        Self.lock.lock()
        Self.counts[url.lastPathComponent, default: 0] += 1
        Self.lock.unlock()
        if url.path.hasPrefix("/backoff/") {
            guard let response = Networking.HTTPURLResponse(url: url, statusCode: 503, httpVersion: nil, headerFields: ["Retry-After": "60"]) else { return }
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocolDidFinishLoading(self)
        } else {
            client?.urlProtocol(self, didFailWithError: URLError(.cancelled))
        }
    }

    override func stopLoading() {}
}
