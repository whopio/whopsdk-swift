import Foundation

public final class CompaniesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of companies. When parent_company_id is provided, lists connected accounts under that platform. When omitted, lists companies the current user has access to.
    ///
    /// Required permissions:
    ///  - `company:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.companies.list(
    ///         first: 42,
    ///         last: 42,
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
    /// - Parameter parentCompanyId: The unique identifier of the parent platform company. When provided, lists connected accounts under that platform. Omit to list the current user's own companies.
    /// - Parameter createdBefore: Only return companies created before this timestamp.
    /// - Parameter createdAfter: Only return companies created after this timestamp.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, parentCompanyId: String? = nil, direction: Direction? = nil, createdBefore: Date? = nil, createdAfter: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> ListCompaniesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/companies",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "parent_company_id": parentCompanyId.map { .string($0) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "created_after": createdAfter.map { .date($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListCompaniesResponse.self
        )
    }

    /// Create a new company. Pass parent_company_id to create a connected account under a platform, or omit it to create a company for the current user.
    ///
    /// Required permissions:
    ///  - `company:create`
    ///  - `company:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.companies.create(request: .init(title: "title"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateCompaniesRequest, requestOptions: RequestOptions? = nil) async throws -> Company {
        return try await httpClient.performRequest(
            method: .post,
            path: "/companies",
            body: request,
            requestOptions: requestOptions,
            responseType: Company.self
        )
    }

    /// Retrieves the details of an existing company.
    ///
    /// Required permissions:
    ///  - `company:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.companies.retrieve(id: "biz_xxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier or route slug of the company.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Company {
        return try await httpClient.performRequest(
            method: .get,
            path: "/companies/\(id)",
            requestOptions: requestOptions,
            responseType: Company.self
        )
    }

    /// Update a company's title, description, logo, and other settings.
    ///
    /// Required permissions:
    ///  - `company:update`
    ///  - `company:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.companies.update(
    ///         id: "biz_xxxxxxxxxxxxxx",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the company to update.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateCompaniesRequest, requestOptions: RequestOptions? = nil) async throws -> Company {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/companies/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Company.self
        )
    }

    /// Create an API key for a connected account (child company) owned by a parent company.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.companies.createApiKey(
    ///         parentCompanyId: "parent_company_id",
    ///         request: .init(childCompanyId: "child_company_id")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter parentCompanyId: The unique identifier of the parent platform company (e.g. 'biz_xxx').
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func createApiKey(parentCompanyId: String, request: Requests.CreateApiKeyCompaniesRequest, requestOptions: RequestOptions? = nil) async throws -> CreateApiKeyCompaniesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/companies/\(parentCompanyId)/api_keys",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateApiKeyCompaniesResponse.self
        )
    }
}