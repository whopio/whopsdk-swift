import Foundation
import Testing
@testable import WhopSDK

@Suite(.serialized)
struct AuditWireContractTests {
    @Test func defaultPinAndBearerReachTheRequest() async throws {
        let stub = HTTPStub()
        stub.setResponse(statusCode: 204, body: Data())
        let client = Whop(baseURL: "https://sandbox.example/api/v1", token: "audit-token", urlSession: stub.urlSession)
        try await client.products.delete(id: "prod_audit")
        let request = try #require(stub.takeLastRequest())
        #expect(request.url?.absoluteString == "https://sandbox.example/api/v1/products/prod_audit")
        #expect(request.value(forHTTPHeaderField: "Authorization") == "Bearer audit-token")
        #expect(request.value(forHTTPHeaderField: "Api-Version-Date") == ApiKeyApiVersionDate.allCases.last?.rawValue)
    }

    @Test func requestOverridesKeepExplicitVersionAndToken() async throws {
        let stub = HTTPStub()
        stub.setResponse(statusCode: 204, body: Data())
        let client = Whop(baseURL: "https://sandbox.example/api/v1", token: "audit-token", apiVersionDate: "2026-11-10", urlSession: stub.urlSession)
        try await client.products.delete(id: "prod_audit", requestOptions: RequestOptions(token: "override-token", additionalHeaders: ["api-version-date": "2026-11-11"]))
        let request = try #require(stub.takeLastRequest())
        #expect(request.value(forHTTPHeaderField: "Authorization") == "Bearer override-token")
        #expect(request.value(forHTTPHeaderField: "Api-Version-Date") == "2026-11-11")
    }

    @Test func enumArrayFilterIsTransmitted() async throws {
        let stub = HTTPStub()
        stub.setResponse(body: Data(#"{"data":[],"page_info":{"end_cursor":null,"start_cursor":null,"has_next_page":false,"has_previous_page":false,"total_count":null,"total_count_capped":false}}"#.utf8))
        let client = Whop(baseURL: "https://sandbox.example/api/v1", token: "audit-token", urlSession: stub.urlSession)
        _ = try await client.products.list(billingTypes: [.renewal])
        let request = try #require(stub.takeLastRequest())
        let components = try #require(URLComponents(url: try #require(request.url), resolvingAgainstBaseURL: false))
        #expect(components.queryItems?.first(where: { $0.name == "billing_types" })?.value == "renewal")
    }

    @Test func scalarUnionFilterIsTransmitted() async throws {
        let stub = HTTPStub()
        stub.setResponse(body: Data())
        let client = HTTPClient(config: ClientConfig(baseURL: "https://sandbox.example/api/v1", urlSession: stub.urlSession))
        try await client.performRequest(method: .get, path: "/app_builds", queryParams: ["created_before": .unknown(ListAppBuildsRequestCreatedBefore.string("2026-11-01T00:00:00Z"))])
        let request = try #require(stub.takeLastRequest())
        let components = try #require(URLComponents(url: try #require(request.url), resolvingAgainstBaseURL: false))
        #expect(components.queryItems?.first(where: { $0.name == "created_before" })?.value == "2026-11-01T00:00:00Z")
    }

    @Test func absentNullablePaginationKeysDecodeAsNull() throws {
        let page = try JSONDecoder().decode(ListProductsResponsePageInfo.self, from: Data(#"{"has_next_page":false,"has_previous_page":false,"total_count_capped":false}"#.utf8))
        #expect(page.endCursor == .null)
        #expect(page.startCursor == .null)
        #expect(page.totalCount == .null)
    }

    @Test func bodyExtensionsKeepCanonicalIdempotencyBytes() async throws {
        let stub = HTTPStub()
        stub.setResponse(body: Data())
        let client = HTTPClient(config: ClientConfig(baseURL: "https://sandbox.example/api/v1", urlSession: stub.urlSession))
        try await client.performRequest(method: .post, path: "/audit", body: ["amount": 1], requestOptions: RequestOptions(additionalBodyProperties: ["zeta": 2]))
        let body = try #require(stub.takeLastRequest()?.httpBody)
        #expect(String(data: body, encoding: .utf8) == #"{"amount":1,"zeta":2}"#)
    }

    @Test func separatelyConstructedBodiesKeepTheSameIdempotencyBytes() async throws {
        var bodies = Set<Data>()
        for index in 0..<16 {
            let stub = HTTPStub()
            stub.setResponse(body: Data())
            let client = HTTPClient(config: ClientConfig(baseURL: "https://sandbox.example/api/v1", urlSession: stub.urlSession))
            var body: [String: JSONValue] = [:]
            let keys = index.isMultiple(of: 2) ? ["zeta", "alpha"] : ["alpha", "zeta"]
            for key in keys { body[key] = key == "alpha" ? 1 : 2 }
            try await client.performRequest(method: .post, path: "/audit", body: body, requestOptions: RequestOptions(additionalHeaders: ["Idempotency-Key": "audit-fixed-key"]))
            let request = try #require(stub.takeLastRequest())
            #expect(request.value(forHTTPHeaderField: "Idempotency-Key") == "audit-fixed-key")
            bodies.insert(try #require(request.httpBody))
        }
        #expect(bodies == Set([Data(#"{"alpha":1,"zeta":2}"#.utf8)]))
    }
}
