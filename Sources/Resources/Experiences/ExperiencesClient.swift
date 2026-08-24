import Foundation

public final class ExperiencesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of experiences belonging to a company, with optional filtering by product and app.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.experiences.list(
    ///         first: 42,
    ///         last: 42,
    ///         companyId: "biz_xxxxxxxxxxxxxx",
    ///         productId: "prod_xxxxxxxxxxxxx",
    ///         appId: "app_xxxxxxxxxxxxxx",
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
    /// - Parameter companyId: The unique identifier of the company to list experiences for.
    /// - Parameter productId: Filter to only experiences attached to this product identifier.
    /// - Parameter appId: Filter to only experiences powered by this app identifier.
    /// - Parameter createdBefore: Only return experiences created before this timestamp.
    /// - Parameter createdAfter: Only return experiences created after this timestamp.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, companyId: String, productId: String? = nil, appId: String? = nil, createdBefore: Date? = nil, createdAfter: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> ListExperiencesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/experiences",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "company_id": .string(companyId), 
                "product_id": productId.map { .string($0) }, 
                "app_id": appId.map { .string($0) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "created_after": createdAfter.map { .date($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListExperiencesResponse.self
        )
    }

    /// Required permissions:
    ///  - `experience:create`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.experiences.create(request: .init(
    ///         appId: "app_xxxxxxxxxxxxxx",
    ///         companyId: "biz_xxxxxxxxxxxxxx"
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
    ///     let client = Whop(token: "<token>")
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

    /// Required permissions:
    ///  - `experience:delete`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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

    /// Required permissions:
    ///  - `experience:update`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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

    /// Attach an experience to a product, making it accessible to the product's customers.
    ///
    /// Required permissions:
    ///  - `experience:attach`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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

    /// Detach an experience from a product, removing customer access to it through that product.
    ///
    /// Required permissions:
    ///  - `experience:detach`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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

    /// Duplicates an existing experience. The name will be copied, unless provided. The new experience will be attached to the same products as the original experience.
    /// If duplicating a Forum or Chat experience, the new experience will have the same settings as the original experience, e.g. who can post, who can comment, etc.
    /// No content, e.g. posts, messages, lessons from within the original experience will be copied.
    ///
    ///
    /// Required permissions:
    ///  - `experience:create`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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