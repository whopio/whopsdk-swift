import Foundation

public final class WaitlistEntriesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the waitlist signups you can see. `waitlist_entry:read` returns your own signups, and `plan:waitlist:read` returns signups to the seller accounts you are authorized on; with both, you get both sets. Signups submitted on behalf of an account are not in this list; pass `buyer_account_id` to list them instead, which needs `waitlist_entry:read` on that account. Account credentials see the signups submitted to their own account, and pass their own account as `buyer_account_id` to see the ones it submitted.
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
    ///     _ = try await client.waitlistEntries.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter variantId: Only return signups for this variant, prefixed `plan_`.
    /// - Parameter accountId: Only return signups submitted to this seller account, prefixed `biz_`.
    /// - Parameter productId: Only return signups for variants on this product, prefixed `prod_`.
    /// - Parameter buyerAccountId: List the signups submitted on behalf of this account, prefixed `biz_`, instead of your own and seller signups. Requires `waitlist_entry:read` on the account. The other filters still apply.
    /// - Parameter status: Only return signups in this state. Canceled signups are returned only when `status` is `canceled`.
    /// - Parameter query: Search signups by the user's name or username, or the name of the account they were submitted on behalf of. An account ID, prefixed `biz_`, matches signups submitted on behalf of that account, and a user ID, prefixed `user_`, or an exact email address matches that user's signups.
    /// - Parameter createdBefore: Only return signups submitted at or before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Only return signups submitted at or after this ISO 8601 timestamp.
    /// - Parameter order: The field to sort results by. Defaults to `created_at`.
    /// - Parameter direction: The sort direction for results. Defaults to descending.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, variantId: String? = nil, accountId: String? = nil, productId: String? = nil, buyerAccountId: String? = nil, status: ListWaitlistEntriesRequestStatus? = nil, query: String? = nil, createdBefore: String? = nil, createdAfter: String? = nil, order: ListWaitlistEntriesRequestOrder? = nil, direction: ListWaitlistEntriesRequestDirection? = nil, requestOptions: RequestOptions? = nil) async throws -> ListWaitlistEntriesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/waitlist_entries",
            queryParams: [
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "variant_id": variantId.map { .string($0) }, 
                "account_id": accountId.map { .string($0) }, 
                "product_id": productId.map { .string($0) }, 
                "buyer_account_id": buyerAccountId.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "query": query.map { .string($0) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListWaitlistEntriesResponse.self
        )
    }

    /// Joins a free waitlist variant as the authenticated user, or on behalf of an account with `buyer_account_id`. Requires `waitlist_entry:create`, on that account when one is given. Joining again returns the existing pending signup, or the approved one while its membership is valid. Paid variants are rejected; joining collects no payment method and grants no membership.
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
    ///     _ = try await client.waitlistEntries.create(request: .init(variantId: "plan_xxxxxxxxxxxxxx"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateWaitlistEntriesRequest, requestOptions: RequestOptions? = nil) async throws -> WaitlistEntry {
        return try await httpClient.performRequest(
            method: .post,
            path: "/waitlist_entries",
            body: request,
            requestOptions: requestOptions,
            responseType: WaitlistEntry.self
        )
    }

    /// Queues approval of every pending signup for an account, optionally narrowed to a variant. Requires `plan:waitlist:manage`. Paid signups may charge saved payment methods. Approval runs asynchronously: list signups with `status` set to `pending` to follow progress, and retrieve a signup to read its outcome. Signups created after this request are excluded.
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
    ///     _ = try await client.waitlistEntries.approveAll(request: .init(accountId: "biz_xxxxxxxxxxxxxx"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func approveAll(request: Requests.ApproveAllWaitlistEntriesRequest, requestOptions: RequestOptions? = nil) async throws -> ApproveAllWaitlistEntriesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/waitlist_entries/approve_all",
            body: request,
            requestOptions: requestOptions,
            responseType: ApproveAllWaitlistEntriesResponse.self
        )
    }

    /// Retrieves your own signup or one submitted on behalf of an account you hold `waitlist_entry:read` on, or one submitted to an account you can read, with `plan:waitlist:read`.
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
    ///     _ = try await client.waitlistEntries.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Waitlist signup ID, prefixed `entry_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> WaitlistEntry {
        return try await httpClient.performRequest(
            method: .get,
            path: "/waitlist_entries/\(id)",
            requestOptions: requestOptions,
            responseType: WaitlistEntry.self
        )
    }

    /// Queues approval of a pending signup. Requires `plan:waitlist:manage` on its seller account. Paid signups may charge their saved payment method. Returns the signup's current state; retrieve it to read `status` and `approval_failure_reason` after processing.
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
    ///     _ = try await client.waitlistEntries.approve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Waitlist signup ID, prefixed `entry_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func approve(id: String, requestOptions: RequestOptions? = nil) async throws -> WaitlistEntry {
        return try await httpClient.performRequest(
            method: .post,
            path: "/waitlist_entries/\(id)/approve",
            requestOptions: requestOptions,
            responseType: WaitlistEntry.self
        )
    }

    /// Withdraws a pending signup: your own, or one submitted on behalf of an account you hold `waitlist_entry:cancel` on. Requires `waitlist_entry:cancel`, on that account for an account's signup. Does not cancel an approved membership.
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
    ///     _ = try await client.waitlistEntries.cancel(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Waitlist signup ID, prefixed `entry_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func cancel(id: String, requestOptions: RequestOptions? = nil) async throws -> WaitlistEntry {
        return try await httpClient.performRequest(
            method: .post,
            path: "/waitlist_entries/\(id)/cancel",
            requestOptions: requestOptions,
            responseType: WaitlistEntry.self
        )
    }

    /// Denies a pending signup. Requires `plan:waitlist:manage` on its seller account.
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
    ///     _ = try await client.waitlistEntries.deny(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Waitlist signup ID, prefixed `entry_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func deny(id: String, requestOptions: RequestOptions? = nil) async throws -> WaitlistEntry {
        return try await httpClient.performRequest(
            method: .post,
            path: "/waitlist_entries/\(id)/deny",
            requestOptions: requestOptions,
            responseType: WaitlistEntry.self
        )
    }
}