import Foundation

public final class ProductsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of products belonging to an account.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.products.list(
    ///         accountId: "account_id",
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
    /// - Parameter accountId: The unique identifier of the account to list products for.
    /// - Parameter visibilities: Filter to only products matching these visibility states.
    /// - Parameter accessPassTypes: Filter to only products matching these types.
    /// - Parameter labels: Filter to only products carrying all of these labels. Labels are matched lowercased.
    /// - Parameter direction: The sort direction for results. Defaults to descending.
    /// - Parameter order: The field to sort results by. Defaults to created_at.
    /// - Parameter first: The number of products to return (default and max 100).
    /// - Parameter after: A cursor; returns products after this position.
    /// - Parameter last: The number of products to return from the end of the range.
    /// - Parameter before: A cursor; returns products before this position.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String, visibilities: [String]? = nil, accessPassTypes: [String]? = nil, labels: [String]? = nil, direction: ListProductsRequestDirection? = nil, order: String? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListProductsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/products",
            queryParams: [
                "account_id": .string(accountId), 
                "visibilities": visibilities.map { .stringArray($0) }, 
                "access_pass_types": accessPassTypes.map { .stringArray($0) }, 
                "labels": labels.map { .stringArray($0) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "order": order.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
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
    ///     let client = Whop(token: "<token>")
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

    /// Retrieves the details of an existing product. This endpoint is publicly accessible.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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
    ///     let client = Whop(token: "<token>")
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
    ///     let client = Whop(token: "<token>")
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

    /// Submits a product to the whop.com marketplace for review. The product moves to `pending_review`; a Whop reviewer approves it before it goes live.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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
    ///     let client = Whop(token: "<token>")
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