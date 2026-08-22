import Foundation

public final class AppBuildsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of build artifacts for an app, newest first, with optional platform, status, and creation-date filters.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.appBuilds.list(appId: "app_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter appId: The app to list builds for, prefixed `app_`.
    /// - Parameter platform: Filter builds by target platform.
    /// - Parameter status: Filter builds by review status.
    /// - Parameter createdBefore: Only return builds created before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Only return builds created after this ISO 8601 timestamp.
    /// - Parameter first: The number of builds to return (default 20, max 100).
    /// - Parameter after: A cursor; returns builds after this position.
    /// - Parameter last: The number of builds to return from the end of the range.
    /// - Parameter before: A cursor; returns builds before this position.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(appId: String, platform: ListAppBuildsRequestPlatform? = nil, status: ListAppBuildsRequestStatus? = nil, createdBefore: ListAppBuildsRequestCreatedBefore? = nil, createdAfter: ListAppBuildsRequestCreatedAfter? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListAppBuildsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/app_builds",
            queryParams: [
                "app_id": .string(appId), 
                "platform": platform.map { .string($0.rawValue) }, 
                "status": status.map { .string($0.rawValue) }, 
                "created_before": createdBefore.map { .unknown($0) }, 
                "created_after": createdAfter.map { .unknown($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListAppBuildsResponse.self
        )
    }

    /// Uploads a new build artifact for an app. Upload the file first (POST /files or a direct upload), then reference it here; iOS and Android take a .zip bundle, web takes a JavaScript file or a .zip archive of the hosted site.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.appBuilds.create(request: .init(
    ///         attachment: CreateAppBuildsRequestAttachment(
    ///
    ///         ),
    ///         checksum: "xxxxxxxxxxxxxxx",
    ///         platform: .ios
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateAppBuildsRequest, requestOptions: RequestOptions? = nil) async throws -> AppBuild {
        return try await httpClient.performRequest(
            method: .post,
            path: "/app_builds",
            body: request,
            requestOptions: requestOptions,
            responseType: AppBuild.self
        )
    }

    /// Retrieves the details of an existing app build.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.appBuilds.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: App build ID, prefixed `abld_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> AppBuild {
        return try await httpClient.performRequest(
            method: .get,
            path: "/app_builds/\(id)",
            requestOptions: requestOptions,
            responseType: AppBuild.self
        )
    }

    /// Promotes a draft or approved app build to production so it becomes the active version served to users. Draft builds enter review first.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.appBuilds.promote(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: App build ID, prefixed `abld_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func promote(id: String, requestOptions: RequestOptions? = nil) async throws -> AppBuild {
        return try await httpClient.performRequest(
            method: .post,
            path: "/app_builds/\(id)/promote",
            requestOptions: requestOptions,
            responseType: AppBuild.self
        )
    }
}