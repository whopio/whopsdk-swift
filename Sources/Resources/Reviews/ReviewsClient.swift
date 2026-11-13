import Foundation

public final class ReviewsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the published reviews for a product or account. Without `account_id` or `product_id`, a user lists the reviews they wrote, an account or app API key lists its account's reviews, and a request without credentials returns 400.
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
    ///     _ = try await client.reviews.list(
    ///         accountId: "biz_xxxxxxxxxxxxxx",
    ///         productId: "prod_xxxxxxxxxxxxx"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The unique identifier of the account to list reviews for.
    /// - Parameter productId: The unique identifier of the product to list reviews for.
    /// - Parameter minStars: The minimum star rating to include in results, from 1 to 5 inclusive.
    /// - Parameter maxStars: The maximum star rating to include in results, from 1 to 5 inclusive.
    /// - Parameter createdBefore: Only return reviews created before this timestamp.
    /// - Parameter createdAfter: Only return reviews created after this timestamp.
    /// - Parameter order: The field to sort reviews by.
    /// - Parameter direction: The sort direction.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter includeTotalCount: Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, productId: String? = nil, minStars: Int? = nil, maxStars: Int? = nil, createdBefore: Date? = nil, createdAfter: Date? = nil, order: ListReviewsRequestOrder? = nil, direction: ListReviewsRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, includeTotalCount: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> ListReviewsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/reviews",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "product_id": productId.map { .string($0) }, 
                "min_stars": minStars.map { .int($0) }, 
                "max_stars": maxStars.map { .int($0) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "created_after": createdAfter.map { .date($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "include_total_count": includeTotalCount.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListReviewsResponse.self
        )
    }

    /// Retrieves a published review. Reviews that are not published return 404.
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
    ///     _ = try await client.reviews.retrieve(id: "rev_xxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the review.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Review {
        return try await httpClient.performRequest(
            method: .get,
            path: "/reviews/\(id)",
            requestOptions: requestOptions,
            responseType: Review.self
        )
    }

    /// Deletes a review the signed-in user wrote. Requires the `review:delete` scope, and returns 404 for a review another user wrote.
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
    ///     _ = try await client.reviews.delete(id: "rev_xxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the review.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeleteReviewsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/reviews/\(id)",
            requestOptions: requestOptions,
            responseType: DeleteReviewsResponse.self
        )
    }
}