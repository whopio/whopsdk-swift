import Foundation

public final class ForumsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of forums within a specific company, with optional filtering by product.
    ///
    /// Required permissions:
    ///  - `forum:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.forums.list(
    ///         first: 42,
    ///         last: 42,
    ///         companyId: "biz_xxxxxxxxxxxxxx",
    ///         productId: "prod_xxxxxxxxxxxxx"
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
    /// - Parameter companyId: The unique identifier of the company to list forums for.
    /// - Parameter productId: The unique identifier of a product to filter by. When set, only forums connected to this product are returned.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, companyId: String, productId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListForumsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/forums",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "company_id": .string(companyId), 
                "product_id": productId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListForumsResponse.self
        )
    }

    /// Retrieves the details of an existing forum.
    ///
    /// Required permissions:
    ///  - `forum:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.forums.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the forum or experience to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Forum {
        return try await httpClient.performRequest(
            method: .get,
            path: "/forums/\(id)",
            requestOptions: requestOptions,
            responseType: Forum.self
        )
    }

    /// Update moderation and notification settings for a forum, such as who can post, who can comment, and email notification preferences.
    ///
    /// Required permissions:
    ///  - `forum:moderate`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.forums.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the forum to update. Accepts either an experience ID (e.g. 'exp_xxxxx') or a forum ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateForumsRequest, requestOptions: RequestOptions? = nil) async throws -> Forum {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/forums/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Forum.self
        )
    }
}