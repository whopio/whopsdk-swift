import Foundation

public final class AffiliatesClient: Sendable {
    public let overrides: OverridesClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.overrides = OverridesClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the affiliates of an account.
    ///
    /// Required permissions:
    ///  - `affiliate:basic:read`
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
    ///     _ = try await client.affiliates.list(
    ///         first: 42,
    ///         last: 42,
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
    /// - Parameter query: Search affiliates by username.
    /// - Parameter accountId: The unique identifier of the company to list affiliates for.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, direction: Direction? = nil, order: AffiliatesSortableColumns? = nil, query: String? = nil, status: Status? = nil, accountId: String, requestOptions: RequestOptions? = nil) async throws -> ListAffiliatesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/affiliates",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "order": order.map { .string($0.rawValue) }, 
                "query": query.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "account_id": .string(accountId)
            ],
            requestOptions: requestOptions,
            responseType: ListAffiliatesResponse.self
        )
    }

    /// Creates an affiliate for a user on an account. If the user is already an affiliate of the account, returns that affiliate, reactivating it if it was archived.
    ///
    /// Required permissions:
    ///  - `affiliate:create`
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
    ///     _ = try await client.affiliates.create(request: .init(
    ///         accountId: "biz_xxxxxxxxxxxxxx",
    ///         userIdentifier: "user_identifier"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateAffiliatesRequest, requestOptions: RequestOptions? = nil) async throws -> Affiliate {
        return try await httpClient.performRequest(
            method: .post,
            path: "/affiliates",
            body: request,
            requestOptions: requestOptions,
            responseType: Affiliate.self
        )
    }

    /// Retrieves the details of an existing affiliate.
    ///
    /// Required permissions:
    ///  - `affiliate:basic:read`
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
    ///     _ = try await client.affiliates.retrieve(id: "aff_xxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the affiliate.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Affiliate {
        return try await httpClient.performRequest(
            method: .get,
            path: "/affiliates/\(id)",
            requestOptions: requestOptions,
            responseType: Affiliate.self
        )
    }

    /// Archives an affiliate. The affiliate that handles Whop marketplace referrals cannot be archived.
    ///
    /// Required permissions:
    ///  - `affiliate:update`
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
    ///     _ = try await client.affiliates.archive(id: "aff_xxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The internal ID of the affiliate to archive.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func archive(id: String, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .post,
            path: "/affiliates/\(id)/archive",
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }

    /// Unarchives an archived affiliate.
    ///
    /// Required permissions:
    ///  - `affiliate:update`
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
    ///     _ = try await client.affiliates.unarchive(id: "aff_xxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The internal ID of the affiliate to archive.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func unarchive(id: String, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .post,
            path: "/affiliates/\(id)/unarchive",
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }
}