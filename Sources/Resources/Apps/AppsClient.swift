import Foundation

public final class AppsClient: Sendable {
    public let categories: CategoriesClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.categories = CategoriesClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists published apps approved for the app store without authentication. With `account_id` and developer access, also includes unpublished apps that the account owns. Public website discovery includes built official blueprints and built, live community blueprints that Whop recommends.
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
    ///     _ = try await client.apps.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Only return apps created by this account (`biz_` tag). With developer access to the account this includes its unlisted and hidden apps.
    /// - Parameter appType: Filter apps by the type of end-user they are built for. Apps of type `website` are left out unless you ask for them by name.
    /// - Parameter viewType: Only return apps supporting this view type, such as `dashboard` or `hub`.
    /// - Parameter verified: Only return apps whose Whop verification status matches this value. Omit this filter to include every verification status the caller can see.
    /// - Parameter verifiedAppsOnly: Legacy compatibility filter. Use `verified` for field equality. `true` returns verified apps; clients pinned before `2026-08-25-2` retain the earlier public website discovery behavior.
    /// - Parameter recommended: Only return apps Whop recommends (or, with `false`, only those it does not), independently of verification status.
    /// - Parameter query: A search string matched against app names.
    /// - Parameter productCategory: Only return apps whose `product_category` is this product category, such as `pressure_washing`. An unknown product category is rejected.
    /// - Parameter businessType: Only return apps whose `product_category` sits under this business type in Whop's business taxonomy, such as `services`. An unknown business type is rejected.
    /// - Parameter industryType: Only return apps whose `product_category` sits under this industry type of `business_type`, such as `exterior_cleaning`. Requires `business_type`. An industry type outside it is rejected.
    /// - Parameter marketplaceCategoryRoute: Only return apps in this app store category. Use a `route` from `GET /apps/categories`, such as `business-productivity`. An unknown route is rejected.
    /// - Parameter order: The field to sort apps by. Defaults to discoverable_at, showing the most recently published apps first. `template_usage` ranks Whop-verified apps first, then by how many businesses created apps from each app as a template. `template_recent_sales` ranks them by how many of those businesses processed a payment in the last 24 hours, recounted hourly, breaking ties by `template_usage`.
    /// - Parameter direction: Sort direction.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter includeTotalCount: Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, appType: ListAppsRequestAppType? = nil, viewType: ListAppsRequestViewType? = nil, verified: Bool? = nil, verifiedAppsOnly: Bool? = nil, recommended: Bool? = nil, query: String? = nil, productCategory: String? = nil, businessType: String? = nil, industryType: String? = nil, marketplaceCategoryRoute: String? = nil, order: ListAppsRequestOrder? = nil, direction: ListAppsRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, includeTotalCount: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> ListAppsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/apps",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "app_type": appType.map { .string($0.rawValue) }, 
                "view_type": viewType.map { .string($0.rawValue) }, 
                "verified": verified.map { .bool($0) }, 
                "verified_apps_only": verifiedAppsOnly.map { .bool($0) }, 
                "recommended": recommended.map { .bool($0) }, 
                "query": query.map { .string($0) }, 
                "product_category": productCategory.map { .string($0) }, 
                "business_type": businessType.map { .string($0) }, 
                "industry_type": industryType.map { .string($0) }, 
                "marketplace_category_route": marketplaceCategoryRoute.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "include_total_count": includeTotalCount.map { .bool($0) }
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
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
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

    /// Retrieves an app by ID, claimed route, active verified custom hostname, or proxy domain id. Authentication is optional; credential fields stay `null` unless you have the matching developer permission on the owning account.
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
    ///     _ = try await client.apps.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: App ID (prefixed `app_`). Retrieval also accepts the app's claimed route, an active verified custom hostname, or its proxy domain id; a custom hostname returns `404` when its assignment is inactive, the owning account is suspended, or the app is deleted.
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
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.apps.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: App ID (prefixed `app_`). Retrieval also accepts the app's claimed route, an active verified custom hostname, or its proxy domain id; a custom hostname returns `404` when its assignment is inactive, the owning account is suspended, or the app is deleted.
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
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
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
    /// - Parameter id: App ID (prefixed `app_`). Retrieval also accepts the app's claimed route, an active verified custom hostname, or its proxy domain id; a custom hostname returns `404` when its assignment is inactive, the owning account is suspended, or the app is deleted.
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
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
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

    /// Lists a hosted app's server runtime logs, most recent first: console output, uncaught exceptions, and failed-request summaries captured on whop.site hosting. Logs are retained for 7 days.
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
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
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
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
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