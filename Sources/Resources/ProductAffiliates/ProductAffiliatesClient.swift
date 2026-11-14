import Foundation

public final class ProductAffiliatesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists affiliate enrollments for an account's products, newest first, including affiliates who have not made a referral. Requires `affiliate:basic:read` on the account. Email addresses and email search also require `member:email:read`.
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
    ///     _ = try await client.productAffiliates.list(
    ///         accountId: "account_id",
    ///         productIds: [
    ///             "prod_xxxxxxxxxxxxxx"
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Account whose product affiliates are listed (`biz_` tag).
    /// - Parameter query: Matches the start of the affiliate's username or of any word in their name, or their exact email (with `member:email:read`).
    /// - Parameter status: Only product affiliates with this status.
    /// - Parameter productIds: Only product affiliates of these products.
    /// - Parameter createdAfter: Only signups at or after this ISO 8601 timestamp.
    /// - Parameter createdBefore: Only signups before this ISO 8601 timestamp.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String, query: String? = nil, status: ListProductAffiliatesRequestStatus? = nil, productIds: [String]? = nil, createdAfter: Date? = nil, createdBefore: Date? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListProductAffiliatesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/product_affiliates",
            queryParams: [
                "account_id": .string(accountId), 
                "query": query.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "product_ids": productIds.map { .stringArray($0) }, 
                "created_after": createdAfter.map { .date($0) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListProductAffiliatesResponse.self
        )
    }
}