import Foundation

public final class LedgerAccountsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Retrieves the details of an existing ledger account.
    ///
    /// Required permissions:
    ///  - `company:balance:read`
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
    ///     _ = try await client.ledgerAccounts.retrieve(id: "ldgr_xxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The identifier to look up the ledger account. Accepts a user ID ('user_xxx'), company ID ('biz_xxx'), or ledger account ID ('ldgr_xxx').
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> LedgerAccount {
        return try await httpClient.performRequest(
            method: .get,
            path: "/ledger_accounts/\(id)",
            requestOptions: requestOptions,
            responseType: LedgerAccount.self
        )
    }
}