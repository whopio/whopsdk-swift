import Foundation

public final class MethodsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the bank accounts, wallets, and crypto addresses an account or user can pay out to, newest first.
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
    ///     _ = try await client.payouts.methods.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The owning account ID (a biz_ identifier). Provide this or user_id.
    /// - Parameter userId: The owning user ID (a user_ identifier). Provide this or account_id.
    /// - Parameter status: Optional status filter. `created` means saved but unused, `active` means a payout through it succeeded, `broken` means the last payout failed and the method needs fixing.
    /// - Parameter amount: Optional payout amount in whole currency units, for example `250.00`. When provided, each method includes a quote with the estimated fee, amount received, and delivery date for that amount.
    /// - Parameter currency: Currency code of the amount, for example `usd`. Only meaningful with amount or include_limits.
    /// - Parameter includeRecipients: When true, also includes bill-pay recipient methods tied to this funding account. Defaults to false, returning only the account's own payout methods.
    /// - Parameter includeLimits: When true, the response also carries limits — the live per-speed payout caps the account's payout requests are validated against, in the requested currency. Requires the payout:withdrawal:read scope.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, userId: String? = nil, status: ListMethodsRequestStatus? = nil, amount: Double? = nil, currency: String? = nil, includeRecipients: Bool? = nil, includeLimits: Bool? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListMethodsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payouts/methods",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "amount": amount.map { .double($0) }, 
                "currency": currency.map { .string($0) }, 
                "include_recipients": includeRecipients.map { .bool($0) }, 
                "include_limits": includeLimits.map { .bool($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListMethodsResponse.self
        )
    }

    /// Saves a bank account, wallet, or crypto address an account or user can pay out to, from a method listed by `GET /payouts/supported_methods`. Sensitive details are vaulted in transit and never stored raw.
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
    ///     _ = try await client.payouts.methods.create(request: .init(supportedPayoutMethodId: "podst_xxxxxxxxxxxxxx"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateMethodsRequest, requestOptions: RequestOptions? = nil) async throws -> CreateMethodsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/payouts/methods",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateMethodsResponse.self
        )
    }

    /// Deletes a saved payout method so it can no longer receive payouts.
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
    ///     _ = try await client.payouts.methods.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Payout method ID, prefixed `potk_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeleteMethodsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/payouts/methods/\(id)",
            requestOptions: requestOptions,
            responseType: DeleteMethodsResponse.self
        )
    }

    /// Changes the label used to identify a saved payout method, makes it the account's default payout method, or updates the payout address on file for it. Send `address` on its own: it cannot be combined with `nickname` or `is_default`. Address updates require the `payout:account:update` scope as well, on the same account, and are supported only for bank and wallet payout methods, not recipient payout methods.
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
    ///     _ = try await client.payouts.methods.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Payout method ID, prefixed `potk_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateMethodsRequest, requestOptions: RequestOptions? = nil) async throws -> UpdateMethodsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/payouts/methods/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateMethodsResponse.self
        )
    }
}