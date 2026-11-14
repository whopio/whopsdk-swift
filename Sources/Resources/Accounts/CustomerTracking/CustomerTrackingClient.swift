import Foundation

public final class CustomerTrackingClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Retrieves the branding and support contacts the account's hosted customer tracking page and tracking Element display. Public by design, so no authentication is required. Returns 404 unless the account has turned customer tracking on in its preferences. Responses are never cached.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.accounts.customerTracking.retrieve(accountId: "account_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Account ID, prefixed `biz_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(accountId: String, requestOptions: RequestOptions? = nil) async throws -> AccountCustomerTracking {
        return try await httpClient.performRequest(
            method: .get,
            path: "/accounts/\(accountId)/customer_tracking",
            requestOptions: requestOptions,
            responseType: AccountCustomerTracking.self
        )
    }
}