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
    ///     let client = Whop(token: "<token>")
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
    /// - Parameter currency: Optional currency code filter, for example `usd`.
    /// - Parameter postedAfter: Only include rows posted after this ISO 8601 timestamp.
    /// - Parameter postedBefore: Only include rows posted before this ISO 8601 timestamp.
    /// - Parameter availableAfter: Only include rows whose funds became withdrawable on or after this `YYYY-MM-DD` settlement date (UTC), distinct from posted_at. Requires currency.
    /// - Parameter availableBefore: Only include rows whose funds became withdrawable on or before this `YYYY-MM-DD` settlement date (UTC). Set equal to available_after for a single day. Requires currency.
    /// - Parameter limit: Maximum number of rows to return.
    /// - Parameter cursor: Cursor returned by the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, userId: String? = nil, includeOwnedAccounts: Bool? = nil, includeResource: Bool? = nil, lineTypes: [ListFinancialActivityRequestLineTypesItem]? = nil, currency: String? = nil, postedAfter: Date? = nil, postedBefore: Date? = nil, availableAfter: CalendarDate? = nil, availableBefore: CalendarDate? = nil, limit: Int? = nil, cursor: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListFinancialActivityResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/financial-activity",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }, 
                "include_owned_accounts": includeOwnedAccounts.map { .bool($0) }, 
                "include_resource": includeResource.map { .bool($0) }, 
                "line_types": lineTypes.map { .unknown($0) }, 
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