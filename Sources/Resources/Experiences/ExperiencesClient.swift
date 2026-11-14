import Foundation

public final class ExperiencesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the experiences in an account, optionally filtered to those attached to one product or powered by one app.
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
    ///     _ = try await client.experiences.list(
    ///         first: 42,
    ///         last: 42,
    ///         productId: "prod_xxxxxxxxxxxxx",
    ///         appId: "app_xxxxxxxxxxxxxx",
    ///         createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
    ///         createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
    ///         accountId: "biz_xxxxxxxxxxxxxx"
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
    /// - Parameter productId: Filter to only experiences attached to this product identifier.
    /// - Parameter appId: Filter to only experiences powered by this app identifier.
    /// - Parameter createdBefore: Only return experiences created before this timestamp.
    /// - Parameter createdAfter: Only return experiences created after this timestamp.
    /// - Parameter accountId: The unique identifier of the company to list experiences for.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, productId: String? = nil, appId: String? = nil, createdBefore: Date? = nil, createdAfter: Date? = nil, accountId: String, requestOptions: RequestOptions? = nil) async throws -> ListExperiencesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/experiences",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "product_id": productId.map { .string($0) }, 
                "app_id": appId.map { .string($0) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "created_after": createdAfter.map { .date($0) }, 
                "account_id": .string(accountId)
            ],
            requestOptions: requestOptions,
            responseType: ListExperiencesResponse.self
        )
    }

    /// Creates an experience for an account, powered by an app such as courses, forums, or chat. Attach it to a product with `POST /experiences/:id/attach` to give that product's customers access.
    ///
    /// Required permissions:
    ///  - `experience:create`
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
    ///     _ = try await client.experiences.create(request: .init(
    ///         accountId: "biz_xxxxxxxxxxxxxx",
    ///         appId: "app_xxxxxxxxxxxxxx"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateExperiencesRequest, requestOptions: RequestOptions? = nil) async throws -> Experience {
        return try await httpClient.performRequest(
            method: .post,
            path: "/experiences",
            body: request,
            requestOptions: requestOptions,
            responseType: Experience.self
        )
    }

    /// Retrieves the details of an existing experience.
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
    ///     _ = try await client.experiences.retrieve(id: "exp_xxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the experience.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Experience {
        return try await httpClient.performRequest(
            method: .get,
            path: "/experiences/\(id)",
            requestOptions: requestOptions,
            responseType: Experience.self
        )
    }

    /// Deletes an experience and detaches it from every product, removing customer access to it. Returns `true` on success.
    ///
    /// Required permissions:
    ///  - `experience:delete`
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
    ///     _ = try await client.experiences.delete(id: "exp_xxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the experience to delete.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/experiences/\(id)",
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }

    /// Updates an experience's name, logo, visibility, or notification setting, or moves it to another section or position.
    ///
    /// Required permissions:
    ///  - `experience:update`
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
    ///     _ = try await client.experiences.update(
    ///         id: "exp_xxxxxxxxxxxxxx",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the experience to update.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateExperiencesRequest, requestOptions: RequestOptions? = nil) async throws -> Experience {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/experiences/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Experience.self
        )
    }

    /// Attaches an experience to a product, giving the product's customers access to it.
    ///
    /// Required permissions:
    ///  - `experience:attach`
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
    ///     _ = try await client.experiences.attach(
    ///         id: "exp_xxxxxxxxxxxxxx",
    ///         request: .init(productId: "prod_xxxxxxxxxxxxx")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the experience to attach.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func attach(id: String, request: Requests.AttachExperiencesRequest, requestOptions: RequestOptions? = nil) async throws -> Experience {
        return try await httpClient.performRequest(
            method: .post,
            path: "/experiences/\(id)/attach",
            body: request,
            requestOptions: requestOptions,
            responseType: Experience.self
        )
    }

    /// Detaches an experience from a product, removing customer access to it through that product.
    ///
    /// Required permissions:
    ///  - `experience:detach`
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
    ///     _ = try await client.experiences.detach(
    ///         id: "exp_xxxxxxxxxxxxxx",
    ///         request: .init(productId: "prod_xxxxxxxxxxxxx")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the experience to detach.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func detach(id: String, request: Requests.DetachExperiencesRequest, requestOptions: RequestOptions? = nil) async throws -> Experience {
        return try await httpClient.performRequest(
            method: .post,
            path: "/experiences/\(id)/detach",
            body: request,
            requestOptions: requestOptions,
            responseType: Experience.self
        )
    }

    /// Duplicates an experience and attaches the copy to the same products as the original. Forum and chat copies keep the original's settings, such as who can post or comment. No content, such as posts, messages, or lessons, is copied.
    ///
    /// Required permissions:
    ///  - `experience:create`
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
    ///     _ = try await client.experiences.duplicate(
    ///         id: "exp_xxxxxxxxxxxxxx",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the experience to duplicate.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func duplicate(id: String, request: Requests.DuplicateExperiencesRequest, requestOptions: RequestOptions? = nil) async throws -> Experience {
        return try await httpClient.performRequest(
            method: .post,
            path: "/experiences/\(id)/duplicate",
            body: request,
            requestOptions: requestOptions,
            responseType: Experience.self
        )
    }
}