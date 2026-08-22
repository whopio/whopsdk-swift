import Foundation

public final class ReviewsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of customer reviews for a specific product, with optional filtering by star rating and creation date.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.reviews.list(
    ///         first: 42,
    ///         last: 42,
    ///         productId: "prod_xxxxxxxxxxxxx",
    ///         minStars: 42,
    ///         maxStars: 42,
    ///         createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
    ///         createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter after: Returns the elements in the list that come after the specified cursor.
    /// - Parameter before: Returns the elements in the list that come before the specified cursor.
    /// - Parameter first: Returns the first _n_ elements from the list.
    /// - Parameter last: Returns the last _n_ elements from the list.
    /// - Parameter productId: The unique identifier of the product to list reviews for.
    /// - Parameter minStars: The minimum star rating to include in results, from 1 to 5 inclusive.
    /// - Parameter maxStars: The maximum star rating to include in results, from 1 to 5 inclusive.
    /// - Parameter createdBefore: Only return reviews created before this timestamp.
    /// - Parameter createdAfter: Only return reviews created after this timestamp.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, productId: String, minStars: Int? = nil, maxStars: Int? = nil, createdBefore: Date? = nil, createdAfter: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> ListReviewsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/reviews",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "product_id": .string(productId), 
                "min_stars": minStars.map { .int($0) }, 
                "max_stars": maxStars.map { .int($0) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "created_after": createdAfter.map { .date($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListReviewsResponse.self
        )
    }

    /// Retrieves the details of an existing review.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.reviews.retrieve(id: "rev_xxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the review to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Review {
        return try await httpClient.performRequest(
            method: .get,
            path: "/reviews/\(id)",
            requestOptions: requestOptions,
            responseType: Review.self
        )
    }
}