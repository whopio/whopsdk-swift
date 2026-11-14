import Foundation

public final class ProductsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists an account's products, or searches the public marketplace when you omit `account_id`. Without the `access_pass:basic:read` permission on the account, including when signed out, the list holds only the products its store page lists.
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
    ///     _ = try await client.products.list(
    ///         visibilities: [
    ///             "visible"
    ///         ],
    ///         accessPassTypes: [
    ///             "regular"
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Account to list products for, prefixed `biz_`. Without the `access_pass:basic:read` permission on it, only the products its store page lists are returned. Omit to search the public marketplace.
    /// - Parameter query: Filters products by text. The public marketplace list searches product title, account name, headline and description, ranking products that match every word first and the closest partial matches after them; an account's own list is a plain substring match over title, headline and description. Omit to browse by recency.
    /// - Parameter marketplaceCategoryRoute: Only return marketplace products assigned to this category route, such as `trading`.
    /// - Parameter billingTypes: Filter to products with a buyable variant of these billing models, such as `one_time` or `renewal`. On an account list, needs the `access_pass:basic:read` permission.
    /// - Parameter priceMinimum: Only return products whose advertised buyable variant has a displayed price of at least this amount. Recurring variants use renewal price. On an account list, needs the `access_pass:basic:read` permission.
    /// - Parameter priceMaximum: Only return products whose advertised buyable variant has a displayed price of at most this amount. Recurring variants use renewal price. On an account list, needs the `access_pass:basic:read` permission.
    /// - Parameter visibilities: Filter to only products matching these visibility states. Ignored on the public marketplace list, which only returns visible products. Without the `access_pass:basic:read` permission on the account, only `visible` matches anything.
    /// - Parameter accessPassTypes: Filter to only products matching these types.
    /// - Parameter labels: Filter to only products carrying all of these labels. Labels are matched lowercased.
    /// - Parameter direction: The sort direction for results. Defaults to descending.
    /// - Parameter order: Field to sort results by. Account lists default to `created_at`, and `position` with `direction` `asc` matches the order the store page shows. Without the `access_pass:basic:read` permission, an account list sorts only by `created_at` or `position`. Marketplace lists default to `discoverable_at`, accept only `created_at` or `discoverable_at`, and can't be combined with `query`.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter includeTotalCount: Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    /// - Parameter createdAfter: Only return products created after this ISO 8601 timestamp.
    /// - Parameter createdBefore: Only return products created before this ISO 8601 timestamp.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, query: String? = nil, marketplaceCategoryRoute: String? = nil, billingTypes: [ListProductsRequestBillingTypesItem]? = nil, priceMinimum: Double? = nil, priceMaximum: Double? = nil, visibilities: [String]? = nil, accessPassTypes: [String]? = nil, labels: [String]? = nil, direction: ListProductsRequestDirection? = nil, order: ListProductsRequestOrder? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, includeTotalCount: Bool? = nil, createdAfter: String? = nil, createdBefore: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListProductsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/products",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "query": query.map { .string($0) }, 
                "marketplace_category_route": marketplaceCategoryRoute.map { .string($0) }, 
                "billing_types": billingTypes.map { .unknown($0) }, 
                "price_minimum": priceMinimum.map { .double($0) }, 
                "price_maximum": priceMaximum.map { .double($0) }, 
                "visibilities": visibilities.map { .stringArray($0) }, 
                "access_pass_types": accessPassTypes.map { .stringArray($0) }, 
                "labels": labels.map { .stringArray($0) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "order": order.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "include_total_count": includeTotalCount.map { .bool($0) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "created_before": createdBefore.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListProductsResponse.self
        )
    }

    /// Creates a new product for an account.
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
    ///     _ = try await client.products.create(request: .init(title: "Interior Deep Clean"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateProductsRequest, requestOptions: RequestOptions? = nil) async throws -> Product {
        return try await httpClient.performRequest(
            method: .post,
            path: "/products",
            body: request,
            requestOptions: requestOptions,
            responseType: Product.self
        )
    }

    /// Retrieves a product. Requires no authentication.
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
    ///     _ = try await client.products.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the product.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Product {
        return try await httpClient.performRequest(
            method: .get,
            path: "/products/\(id)",
            requestOptions: requestOptions,
            responseType: Product.self
        )
    }

    /// Deletes a product. Only products with no memberships, entries, reviews, or invoices can be deleted.
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
    ///     _ = try await client.products.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the product.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeleteProductsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/products/\(id)",
            requestOptions: requestOptions,
            responseType: DeleteProductsResponse.self
        )
    }

    /// Updates an existing product.
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
    ///     _ = try await client.products.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the product.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateProductsRequest, requestOptions: RequestOptions? = nil) async throws -> Product {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/products/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Product.self
        )
    }

    /// Submits an App Store app's product for review. The product moves to `pending_review`; a Whop reviewer approves it before it goes live. Other products can no longer be listed on the whop.com marketplace, so the request fails with `discover_listing_discontinued`.
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
    ///     _ = try await client.products.publish(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the product, prefixed `prod_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func publish(id: String, requestOptions: RequestOptions? = nil) async throws -> Product {
        return try await httpClient.performRequest(
            method: .post,
            path: "/products/\(id)/publish",
            requestOptions: requestOptions,
            responseType: Product.self
        )
    }

    /// Removes a product from the whop.com marketplace. The product moves to `not_available`.
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
    ///     _ = try await client.products.unpublish(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the product, prefixed `prod_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func unpublish(id: String, requestOptions: RequestOptions? = nil) async throws -> Product {
        return try await httpClient.performRequest(
            method: .post,
            path: "/products/\(id)/unpublish",
            requestOptions: requestOptions,
            responseType: Product.self
        )
    }
}