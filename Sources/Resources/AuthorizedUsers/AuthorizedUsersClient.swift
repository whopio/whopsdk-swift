import Foundation

public final class AuthorizedUsersClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of authorized team members for a company, with optional filtering by user, role, and creation date.
    ///
    /// Required permissions:
    ///  - `company:authorized_user:read`
    ///  - `member:email:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.authorizedUsers.list(
    ///         first: 42,
    ///         last: 42,
    ///         companyId: "biz_xxxxxxxxxxxxxx",
    ///         userId: "user_xxxxxxxxxxxxx",
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
    /// - Parameter companyId: The unique identifier of the company to list authorized users for.
    /// - Parameter userId: Filter results to a specific user to check if they are an authorized team member.
    /// - Parameter createdBefore: Only return authorized users created before this timestamp.
    /// - Parameter createdAfter: Only return authorized users created after this timestamp.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, companyId: String? = nil, userId: String? = nil, role: AuthorizedUserRoles? = nil, createdBefore: Date? = nil, createdAfter: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> ListAuthorizedUsersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/authorized_users",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "company_id": companyId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }, 
                "role": role.map { .string($0.rawValue) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "created_after": createdAfter.map { .date($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListAuthorizedUsersResponse.self
        )
    }

    /// Add a new authorized user to a company.
    ///
    /// Required permissions:
    ///  - `authorized_user:create`
    ///  - `member:email:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.authorizedUsers.create(request: .init(
    ///         companyId: "biz_xxxxxxxxxxxxxx",
    ///         role: .owner,
    ///         userId: "user_xxxxxxxxxxxxx"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateAuthorizedUsersRequest, requestOptions: RequestOptions? = nil) async throws -> AuthorizedUser {
        return try await httpClient.performRequest(
            method: .post,
            path: "/authorized_users",
            body: request,
            requestOptions: requestOptions,
            responseType: AuthorizedUser.self
        )
    }

    /// Retrieves the details of an existing authorized user.
    ///
    /// Required permissions:
    ///  - `company:authorized_user:read`
    ///  - `member:email:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.authorizedUsers.retrieve(id: "ausr_xxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the authorized user to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> AuthorizedUser {
        return try await httpClient.performRequest(
            method: .get,
            path: "/authorized_users/\(id)",
            requestOptions: requestOptions,
            responseType: AuthorizedUser.self
        )
    }

    /// Remove an authorized user from a company.
    ///
    /// Required permissions:
    ///  - `authorized_user:delete`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.authorizedUsers.delete(
    ///         id: "ausr_xxxxxxxxxxxxx",
    ///         companyId: "biz_xxxxxxxxxxxxxx"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ID of the authorized user or user to remove.
    /// - Parameter companyId: The ID of the company the authorized user belongs to. Optional if the authorized user ID is provided.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, companyId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/authorized_users/\(id)",
            queryParams: [
                "company_id": companyId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }
}