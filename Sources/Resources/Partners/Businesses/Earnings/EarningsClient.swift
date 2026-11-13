import Foundation

public final class EarningsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the earnings Whop pays out for one referred business's activity, most recent first. The original referrer or a caller with company:basic:read on the business credited for the referral can read them.
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
    ///     _ = try await client.partners.businesses.earnings.list(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The partner business ID (a coma_ identifier).
    /// - Parameter status: Filter by earning status.
    /// - Parameter incomeSource: Filter to earnings from these income sources. Repeat the parameter for each one (income_source=sales&income_source=ad_spend).
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter order: The field to sort earnings by.
    /// - Parameter direction: Sort direction.
    /// - Parameter createdBefore: Only return earnings created before this timestamp.
    /// - Parameter createdAfter: Only return earnings created after this timestamp.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(id: String, status: ListEarningsRequestStatus? = nil, incomeSource: [ListEarningsRequestIncomeSourceItem]? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, order: ListEarningsRequestOrder? = nil, direction: ListEarningsRequestDirection? = nil, createdBefore: String? = nil, createdAfter: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListEarningsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/partners/businesses/\(id)/earnings",
            queryParams: [
                "status": status.map { .string($0.rawValue) }, 
                "income_source": incomeSource.map { .unknown($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListEarningsResponse.self
        )
    }
}