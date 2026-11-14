import Foundation

public final class PayoutAccountsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Retrieves the details of an existing payout account.
    ///
    /// Required permissions:
    ///  - `payout:account:read`
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
    ///     _ = try await client.payoutAccounts.retrieve(id: "poact_xxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the payout account to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> PayoutAccount {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payout_accounts/\(id)",
            requestOptions: requestOptions,
            responseType: PayoutAccount.self
        )
    }
}