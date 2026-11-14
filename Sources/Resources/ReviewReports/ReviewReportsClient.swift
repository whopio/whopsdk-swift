import Foundation

public final class ReviewReportsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the reports filed against customer reviews on the accounts you can moderate, newest first. Use it to check whether a review was reported and where the report stands. Omit `account_id` to cover every account you can moderate.
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
    ///     _ = try await client.reviewReports.list(
    ///         accountId: "biz_xxxxxxxxxxxxxx",
    ///         reviewId: "rev_xxxxxxxxxxxxxx"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Only reports on this account's reviews.
    /// - Parameter reviewId: Only reports filed against this review.
    /// - Parameter status: Only reports in this status.
    /// - Parameter createdBefore: Only reports filed before this timestamp.
    /// - Parameter createdAfter: Only reports filed after this timestamp.
    /// - Parameter order: The field to sort reports by.
    /// - Parameter direction: The sort direction.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, reviewId: String? = nil, status: ListReviewReportsRequestStatus? = nil, createdBefore: Date? = nil, createdAfter: Date? = nil, order: ListReviewReportsRequestOrder? = nil, direction: ListReviewReportsRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListReviewReportsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/review_reports",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "review_id": reviewId.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "created_after": createdAfter.map { .date($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListReviewReportsResponse.self
        )
    }
}