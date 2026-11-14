import Foundation

public final class AppInstallationsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists app installations, newest first. An app's API key lists the accounts that installed it. An account lists the apps installed on it; a user passes that account's `account_id`. The developer of an app lists every installation of it by passing `app_id`. Uninstalled apps, deleted apps and deleted accounts are left out.
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
    ///     _ = try await client.appInstallations.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Only return installations on this account, prefixed `biz_`.
    /// - Parameter appId: Only return installations of this app, prefixed `app_`. Pass your own app's ID to list the accounts that installed it.
    /// - Parameter viewType: Only return installations of apps that have this view, such as `dashboard` for apps shown in a business's dashboard.
    /// - Parameter externalId: Only return the installation with this `external_id`, the installed app's own identifier for it. Only the app and its developer can filter by it.
    /// - Parameter createdBefore: Only return installations created before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Only return installations created after this ISO 8601 timestamp.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter order: Field to sort installations by. `name` sorts by app name, and only when listing the apps installed on one account.
    /// - Parameter direction: Sort direction.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, appId: String? = nil, viewType: ListAppInstallationsRequestViewType? = nil, externalId: String? = nil, createdBefore: String? = nil, createdAfter: String? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, order: ListAppInstallationsRequestOrder? = nil, direction: ListAppInstallationsRequestDirection? = nil, requestOptions: RequestOptions? = nil) async throws -> ListAppInstallationsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/app_installations",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "app_id": appId.map { .string($0) }, 
                "view_type": viewType.map { .string($0.rawValue) }, 
                "external_id": externalId.map { .string($0) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListAppInstallationsResponse.self
        )
    }

    /// Retrieves an app installation, with the metadata the app stores on it. The app, its developer and the account it's installed on can retrieve it.
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
    ///     _ = try await client.appInstallations.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: App installation ID, prefixed `aag_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> AppInstallation {
        return try await httpClient.performRequest(
            method: .get,
            path: "/app_installations/\(id)",
            requestOptions: requestOptions,
            responseType: AppInstallation.self
        )
    }

    /// Updates the `metadata` and `external_id` your app keeps on an installation. Only the metadata keys you send change, so separate jobs can each keep their own keys.
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
    ///     _ = try await client.appInstallations.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: App installation ID, prefixed `aag_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateAppInstallationsRequest, requestOptions: RequestOptions? = nil) async throws -> AppInstallation {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/app_installations/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: AppInstallation.self
        )
    }
}