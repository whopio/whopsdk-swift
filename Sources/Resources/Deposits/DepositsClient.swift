import Foundation

public final class DepositsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Retrieve the deposit methods for an account, including crypto and bank transfer.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.deposits.create(request: .init(destination: CreateDepositsRequestDestination.string(
    ///         "destination"
    ///     )))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateDepositsRequest, requestOptions: RequestOptions? = nil) async throws -> CreateDepositsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/deposits",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateDepositsResponse.self
        )
    }
}