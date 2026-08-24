import Foundation

public final class ExportsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the exports requested for an account, newest first. Only exports of resources the credential is allowed to export are returned.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.exports.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The account to list exports for, prefixed `biz_`. Defaults to the credential's account.
    /// - Parameter resource: Only return exports of this resource.
    /// - Parameter status: Only return exports in this status.
    /// - Parameter createdAfter: Only return exports created at or after this ISO 8601 timestamp.
    /// - Parameter createdBefore: Only return exports created at or before this ISO 8601 timestamp.
    /// - Parameter order: The field to sort by.
    /// - Parameter direction: The sort direction.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, resource: ListExportsRequestResource? = nil, status: ListExportsRequestStatus? = nil, createdAfter: String? = nil, createdBefore: String? = nil, order: ListExportsRequestOrder? = nil, direction: ListExportsRequestDirection? = nil, requestOptions: RequestOptions? = nil) async throws -> ListExportsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/exports",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "resource": resource.map { .string($0.rawValue) }, 
                "status": status.map { .string($0.rawValue) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListExportsResponse.self
        )
    }

    /// Starts an asynchronous CSV export of a resource for an account. Returns the export in `pending`; poll `GET /exports/{id}` until `download_url` is set.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.exports.create(request: .init(resource: .adCampaigns))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateExportsRequest, requestOptions: RequestOptions? = nil) async throws -> Export {
        return try await httpClient.performRequest(
            method: .post,
            path: "/exports",
            body: request,
            requestOptions: requestOptions,
            responseType: Export.self
        )
    }

    /// Fetches an export's status and, once complete, its download link.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.exports.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The export ID, prefixed `exprt_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Export {
        return try await httpClient.performRequest(
            method: .get,
            path: "/exports/\(id)",
            requestOptions: requestOptions,
            responseType: Export.self
        )
    }
}