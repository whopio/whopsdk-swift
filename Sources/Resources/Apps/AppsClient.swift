import Foundation

public final class AppsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists apps on the Whop platform: the app store's live apps, or — with `account_id` and developer access to that account — every app the account owns. Requires authentication, except for the publicly readable lists: `verified_apps_only=true`, and `app_type=website` with no `account_id`, which returns every live deployed website that Whop has not verified — verified templates are the curated `verified_apps_only=true` list instead.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.apps.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Only return apps created by this account (`biz_` tag). With developer access to the account this includes its unlisted and hidden apps.
    /// - Parameter appType: Filter apps by the type of end-user they are built for. Apps of type `website` are left out unless you ask for them by name.
    /// - Parameter viewType: Only return apps supporting this view type, such as `dashboard` or `hub`.
    /// - Parameter verifiedAppsOnly: Whether to only return apps verified by Whop. Verified website templates — websites with a published web build — are included, even though websites are otherwise left out of app lists.
    /// - Parameter query: A search string matched against app names.
    /// - Parameter order: The field to sort apps by. Defaults to discoverable_at, showing the most recently published apps first. `template_usage` ranks Whop-verified apps first, then apps with a banner image, then by how many apps were created from each app as a template.
    /// - Parameter direction: Sort direction.
    /// - Parameter first: The number of apps to return (default 20, max 100).
    /// - Parameter after: A cursor; returns apps after this position.
    /// - Parameter last: The number of apps to return from the end of the range.
    /// - Parameter before: A cursor; returns apps before this position.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, appType: ListAppsRequestAppType? = nil, viewType: ListAppsRequestViewType? = nil, verifiedAppsOnly: Bool? = nil, query: String? = nil, order: ListAppsRequestOrder? = nil, direction: ListAppsRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListAppsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/apps",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "app_type": appType.map { .string($0.rawValue) }, 
                "view_type": viewType.map { .string($0.rawValue) }, 
                "verified_apps_only": verifiedAppsOnly.map { .bool($0) }, 
                "query": query.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListAppsResponse.self
        )
    }

    /// Registers a new app on the Whop developer platform. Apps provide custom experiences that can be added to products.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.apps.create(request: .init(name: "Shine Time Booking"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateAppsRequest, requestOptions: RequestOptions? = nil) async throws -> App {
        return try await httpClient.performRequest(
            method: .post,
            path: "/apps",
            body: request,
            requestOptions: requestOptions,
            responseType: App.self
        )
    }

    /// Updates the permission requirements for an app
    ///
    /// Required permissions:
    ///  - `developer:update_app_authorization`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.apps.updatePermissionsApp(
    ///         appId: "app_id",
    ///         request: .init(requestedPermissions: [
    ///             UpdatePermissionsAppRequestRequestedPermissionsItem(
    ///                 action: "action",
    ///                 isRequired: true,
    ///                 justification: "justification"
    ///             )
    ///         ])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter appId: The ID of the app the permission requirements are being updated for
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func updatePermissionsApp(appId: String, request: Requests.UpdatePermissionsAppRequest, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/apps/\(appId)/permissions",
            body: request,
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }

    /// Retrieves an app by ID, claimed route, or proxy domain id. Credential fields (api_key, default_api_key, secrets) render `null` unless the caller has the corresponding developer permission on the owning account.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.apps.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: App ID (prefixed `app_`), the app's claimed route, or its proxy domain id.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> App {
        return try await httpClient.performRequest(
            method: .get,
            path: "/apps/\(id)",
            requestOptions: requestOptions,
            responseType: App.self
        )
    }

    /// Deletes an app. The app stops resolving within seconds — a website's site stops serving, and any claimed subdomain is reserved for a month before it can be claimed again.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.apps.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: App ID (prefixed `app_`), the app's claimed route, or its proxy domain id.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeleteAppsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/apps/\(id)",
            requestOptions: requestOptions,
            responseType: DeleteAppsResponse.self
        )
    }

    /// Updates the settings, metadata, or status of an app. Fields that are omitted keep their current value.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.apps.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: App ID (prefixed `app_`), the app's claimed route, or its proxy domain id.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateAppsRequest, requestOptions: RequestOptions? = nil) async throws -> App {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/apps/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: App.self
        )
    }

    /// Builds the app's current source and ships it. Returns the run it started, so the caller can render progress from this response and then follow it on the app's `deployment` field. Only one deployment runs per app at a time — calling this while one is in flight reports that run rather than starting a second, and calling it with nothing to publish reports that instead of starting one.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.apps.deploy(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The app to deploy, prefixed `app_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func deploy(id: String, request: Requests.DeployAppsRequest, requestOptions: RequestOptions? = nil) async throws -> AppDeployment {
        return try await httpClient.performRequest(
            method: .post,
            path: "/apps/\(id)/deploy",
            body: request,
            requestOptions: requestOptions,
            responseType: AppDeployment.self
        )
    }

    /// Lists a hosted app's server runtime logs, most recent first: console output, uncaught exceptions, and failed-request summaries captured on whop.app hosting. Logs are retained for 7 days.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.apps.logs(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ID of the app, which will look like app_*************.
    /// - Parameter appBuildId: Only return logs from this build.
    /// - Parameter level: Only return console lines of this level.
    /// - Parameter query: Only return logs whose message contains this text (case-insensitive).
    /// - Parameter createdAfter: Start of the time window as an ISO 8601 timestamp. Defaults to 7 days before created_before.
    /// - Parameter createdBefore: End of the time window as an ISO 8601 timestamp. Defaults to now.
    /// - Parameter first: The number of log lines to return (max 500).
    /// - Parameter after: A cursor for fetching logs after a previous page.
    /// - Parameter before: A cursor for fetching logs before a later page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func logs(id: String, appBuildId: String? = nil, level: LogsAppsRequestLevel? = nil, query: String? = nil, createdAfter: Date? = nil, createdBefore: Date? = nil, first: Int? = nil, after: String? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> LogsAppsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/apps/\(id)/logs",
            queryParams: [
                "app_build_id": appBuildId.map { .string($0) }, 
                "level": level.map { .string($0.rawValue) }, 
                "query": query.map { .string($0) }, 
                "created_after": createdAfter.map { .date($0) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: LogsAppsResponse.self
        )
    }

    /// Replaces the set of permissions the app requests from users when they install it. Requires a user session: the `developer:update_app_authorization` scope cannot be delegated to API keys. Sensitive permissions require step-up verification.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.apps.updatePermissions(
    ///         id: "id",
    ///         request: .init(requestedPermissions: [
    ///             UpdatePermissionsAppsRequestRequestedPermissionsItem(
    ///                 action: "company:basic:read",
    ///                 isRequired: true,
    ///                 justification: "Reads basic account info to render the dashboard home."
    ///             )
    ///         ])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: App ID, prefixed `app_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func updatePermissions(id: String, request: Requests.UpdatePermissionsAppsRequest, requestOptions: RequestOptions? = nil) async throws -> App {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/apps/\(id)/permissions",
            body: request,
            requestOptions: requestOptions,
            responseType: App.self
        )
    }
}