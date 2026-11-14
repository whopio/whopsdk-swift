import Foundation

public final class ApiKeysClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the API keys of an account, app, or your own user, newest first. Responses never include the full secret — only its obfuscated form.
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
    ///     _ = try await client.apiKeys.list(
    ///         resourceId: "resource_id",
    ///         resourceType: .account
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter resourceId: The account (`biz_`), app (`app_`), or your own user (`user_`) tag to list API keys for.
    /// - Parameter resourceType: The type of resource that owns the API keys.
    /// - Parameter createdBefore: Only return API keys created before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Only return API keys created after this ISO 8601 timestamp.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter order: The field to sort API keys by.
    /// - Parameter direction: Sort direction.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(resourceId: String, resourceType: ListApiKeysRequestResourceType, createdBefore: ListApiKeysRequestCreatedBefore? = nil, createdAfter: ListApiKeysRequestCreatedAfter? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, order: ListApiKeysRequestOrder? = nil, direction: ListApiKeysRequestDirection? = nil, requestOptions: RequestOptions? = nil) async throws -> ListApiKeysResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/api_keys",
            queryParams: [
                "resource_id": .string(resourceId), 
                "resource_type": .string(resourceType.rawValue), 
                "created_before": createdBefore.map { .unknown($0) }, 
                "created_after": createdAfter.map { .unknown($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListApiKeysResponse.self
        )
    }

    /// Creates an API key for an account, an app, or your own user. A user API key acts as you and can only grant `ad_campaign:basic:read`, `ad_campaign:update`, `ad_pixel:manage`, `member:journey:read`. The response is the only place the full `secret_key` is returned — store it immediately. Requires a user session; API keys cannot manage API keys.
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
    ///     _ = try await client.apiKeys.create(request: .init(
    ///         name: "Shine Time Booking (production)",
    ///         permissions: CreateApiKeysRequestPermissions(
    ///
    ///         ),
    ///         resourceId: "biz_xxxxxxxxxxxxxx",
    ///         resourceType: .account
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateApiKeysRequest, requestOptions: RequestOptions? = nil) async throws -> ApiKey {
        return try await httpClient.performRequest(
            method: .post,
            path: "/api_keys",
            body: request,
            requestOptions: requestOptions,
            responseType: ApiKey.self
        )
    }

    /// Lists the catalog of permission actions that can be granted to users, apps, and API keys. Use it to choose the `permissions` for an API key or to build a permission picker. Small and returned in full on one page.
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
    ///     _ = try await client.apiKeys.listPermissions()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func listPermissions(requestOptions: RequestOptions? = nil) async throws -> ListPermissionsApiKeysResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/api_keys/permissions",
            requestOptions: requestOptions,
            responseType: ListPermissionsApiKeysResponse.self
        )
    }

    /// Retrieves an API key with its effective permission grants. The full secret is never returned — rotate the key if it was lost.
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
    ///     _ = try await client.apiKeys.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: API key ID, prefixed `apik_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> ApiKey {
        return try await httpClient.performRequest(
            method: .get,
            path: "/api_keys/\(id)",
            requestOptions: requestOptions,
            responseType: ApiKey.self
        )
    }

    /// Permanently revokes an API key; requests using its secret stop authenticating immediately. Default and agent-backend keys cannot be deleted.
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
    ///     _ = try await client.apiKeys.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: API key ID, prefixed `apik_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeleteApiKeysResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/api_keys/\(id)",
            requestOptions: requestOptions,
            responseType: DeleteApiKeysResponse.self
        )
    }

    /// Updates an API key's name, permissions, API version, expiration, or IP allowlist. Fields that are omitted keep their current value; default keys cannot be modified.
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
    ///     _ = try await client.apiKeys.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: API key ID, prefixed `apik_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateApiKeysRequest, requestOptions: RequestOptions? = nil) async throws -> ApiKey {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/api_keys/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: ApiKey.self
        )
    }

    /// Rotates the API key's secret, invalidating the previous secret immediately. The response is the only place the new `secret_key` is returned.
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
    ///     _ = try await client.apiKeys.rotate(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: API key ID, prefixed `apik_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func rotate(id: String, requestOptions: RequestOptions? = nil) async throws -> ApiKey {
        return try await httpClient.performRequest(
            method: .post,
            path: "/api_keys/\(id)/rotate",
            requestOptions: requestOptions,
            responseType: ApiKey.self
        )
    }
}