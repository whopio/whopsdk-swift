import Foundation

public final class PermissionsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists permission actions and whether the calling credential is granted each one for a resource. Answers for whichever identity authenticated the request — a user session, an OAuth token, or an account or app API key — so it never describes who else can reach the resource.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.permissions.list(resourceId: "resource_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter resourceId: Tag of the resource to check against: an account (`biz_`), product (`prod_`), experience (`exp_`), or app (`app_`). A resource the credential cannot see is reported as granted nothing rather than as an error.
    /// - Parameter actions: Comma-separated permission actions to check, for example `stats:read,payment:basic:read`. Every action is returned when omitted.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(resourceId: String, actions: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListPermissionsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/permissions",
            queryParams: [
                "resource_id": .string(resourceId), 
                "actions": actions.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListPermissionsResponse.self
        )
    }
}