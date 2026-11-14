import Foundation

public final class FeesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Retrieves the account's fees as a single document keyed by fee, with any markups its platform adds. Subaccounts see the rates in effect for them. `adjustable` on each fee says what you may change with Update Account Fees.
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
    ///     _ = try await client.accounts.fees.retrieve(accountId: "account_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Account ID, prefixed `biz_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(accountId: String, requestOptions: RequestOptions? = nil) async throws -> AccountFees {
        return try await httpClient.performRequest(
            method: .get,
            path: "/accounts/\(accountId)/fees",
            requestOptions: requestOptions,
            responseType: AccountFees.self
        )
    }

    /// Updates the account's fees. Each key present in the body is replaced; omitted keys are left untouched. Only fees that Retrieve Account Fees reports as `adjustable` can be changed.
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
    ///     _ = try await client.accounts.fees.update(
    ///         accountId: "account_id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Account ID, prefixed `biz_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(accountId: String, request: Requests.UpdateFeesRequest, requestOptions: RequestOptions? = nil) async throws -> AccountFees {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/accounts/\(accountId)/fees",
            body: request,
            requestOptions: requestOptions,
            responseType: AccountFees.self
        )
    }
}