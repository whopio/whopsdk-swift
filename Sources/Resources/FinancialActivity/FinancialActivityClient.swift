import Foundation

public final class FinancialActivityClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns an account's or user's activity feed: every movement of money in or out.
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
    ///     _ = try await client.financialActivity.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The owning account ID (a biz_ identifier). Provide this or user_id.
    /// - Parameter userId: The owning user ID (a user_ identifier). Provide this or account_id.
    /// - Parameter includeOwnedAccounts: When true, aggregates the authenticated user's personal ledger with the businesses they own (owner role with balance read) into one feed. Requires user_id to be the authenticated user; cannot be combined with account_id or the settlement-date filters. Each returned row includes the owning `account`.
    /// - Parameter includeResource: Whether to include the `resource` field in the response or not. Consider passing `false` if you need a fast response without as many rich details.
    /// - Parameter lineTypes: Optional ledger line categories to include. Some categories (for example `onchain_deposit`, which covers inbound crypto deposits such as MoonPay onramps) are only returned when explicitly requested here.
    /// - Parameter direction: Optional direction filter. `money_in` returns positive activity and `money_out` returns negative activity.
    /// - Parameter resourceId: Optional prefixed resource ID. Returns activity associated with that resource.
    /// - Parameter paymentId: Filter activity by payment ID (pay_), including related refunds, disputes, and fees. Combines with resource_id and other filters within the selected accounts. Unknown payments return an empty list.
    /// - Parameter activityId: Optional ledger activity ID (for example `line_3`). Returns at most that one activity.
    /// - Parameter excludeInternalMovements: Whether to exclude balance reservations and balanced movements between the account's own balances.
    /// - Parameter balanceType: Which balance the activity changes. `total` includes available, pending, and reserved funds. `available` includes only movements into or out of available funds, including reservations, releases, and fees. Movements within the selected balance are omitted. Omit to preserve the existing activity feed. Requires account_id or user_id; cannot be combined with available_after or available_before.
    /// - Parameter withdrawalId: Withdrawal ID (wdrl_). With balance_type=available, selects the same period as its statement, after the previous withdrawal and through this withdrawal, excluding this withdrawal and its fee. Requires a single account. Overrides currency and posted-date filters.
    /// - Parameter currency: Optional currency code filter, for example `usd`.
    /// - Parameter postedAfter: Only include rows posted after this ISO 8601 timestamp.
    /// - Parameter postedBefore: Only include rows posted before this ISO 8601 timestamp.
    /// - Parameter availableAfter: Only include balance credits and debits available on or after this `YYYY-MM-DD` date (UTC), distinct from posted_at. Requires currency.
    /// - Parameter availableBefore: Only include balance credits and debits available on or before this `YYYY-MM-DD` date (UTC). Set equal to available_after for a single day. Requires currency.
    /// - Parameter limit: Maximum number of rows to return.
    /// - Parameter cursor: Cursor returned by the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, userId: String? = nil, includeOwnedAccounts: Bool? = nil, includeResource: Bool? = nil, lineTypes: [ListFinancialActivityRequestLineTypesItem]? = nil, direction: ListFinancialActivityRequestDirection? = nil, resourceId: String? = nil, paymentId: String? = nil, activityId: String? = nil, excludeInternalMovements: Bool? = nil, balanceType: ListFinancialActivityRequestBalanceType? = nil, withdrawalId: String? = nil, currency: String? = nil, postedAfter: Date? = nil, postedBefore: Date? = nil, availableAfter: CalendarDate? = nil, availableBefore: CalendarDate? = nil, limit: Int? = nil, cursor: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListFinancialActivityResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/financial_activity",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }, 
                "include_owned_accounts": includeOwnedAccounts.map { .bool($0) }, 
                "include_resource": includeResource.map { .bool($0) }, 
                "line_types": lineTypes.map { .unknown($0) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "resource_id": resourceId.map { .string($0) }, 
                "payment_id": paymentId.map { .string($0) }, 
                "activity_id": activityId.map { .string($0) }, 
                "exclude_internal_movements": excludeInternalMovements.map { .bool($0) }, 
                "balance_type": balanceType.map { .string($0.rawValue) }, 
                "withdrawal_id": withdrawalId.map { .string($0) }, 
                "currency": currency.map { .string($0) }, 
                "posted_after": postedAfter.map { .date($0) }, 
                "posted_before": postedBefore.map { .date($0) }, 
                "available_after": availableAfter.map { .calendarDate($0) }, 
                "available_before": availableBefore.map { .calendarDate($0) }, 
                "limit": limit.map { .int($0) }, 
                "cursor": cursor.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListFinancialActivityResponse.self
        )
    }
}