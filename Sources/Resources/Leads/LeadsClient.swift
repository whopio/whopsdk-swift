import Foundation

public final class LeadsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of leads for a company, with optional filtering by product and creation date.
    ///
    /// Required permissions:
    ///  - `lead:basic:read`
    ///  - `member:email:read`
    ///  - `access_pass:basic:read`
    ///  - `member:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.leads.list(
    ///         first: 42,
    ///         last: 42,
    ///         companyId: "biz_xxxxxxxxxxxxxx",
    ///         createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
    ///         createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
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
    /// - Parameter companyId: The unique identifier of the company to list leads for.
    /// - Parameter createdAfter: Only return leads created after this timestamp.
    /// - Parameter createdBefore: Only return leads created before this timestamp.
    /// - Parameter productIds: Filter leads to only those associated with these specific product identifiers.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, companyId: String, createdAfter: Date? = nil, createdBefore: Date? = nil, productIds: [String]? = nil, requestOptions: RequestOptions? = nil) async throws -> ListLeadsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/leads",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "company_id": .string(companyId), 
                "created_after": createdAfter.map { .date($0) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "product_ids": productIds.map { .stringArray($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListLeadsResponse.self
        )
    }

    /// Record a new lead for a company, capturing a potential customer's interest in a specific product.
    ///
    /// Required permissions:
    ///  - `lead:manage`
    ///  - `member:email:read`
    ///  - `access_pass:basic:read`
    ///  - `member:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.leads.create(request: .init(companyId: "biz_xxxxxxxxxxxxxx"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateLeadsRequest, requestOptions: RequestOptions? = nil) async throws -> Lead {
        return try await httpClient.performRequest(
            method: .post,
            path: "/leads",
            body: request,
            requestOptions: requestOptions,
            responseType: Lead.self
        )
    }

    /// Retrieves the details of an existing lead.
    ///
    /// Required permissions:
    ///  - `lead:basic:read`
    ///  - `member:email:read`
    ///  - `access_pass:basic:read`
    ///  - `member:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.leads.retrieve(id: "lead_xxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the lead to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Lead {
        return try await httpClient.performRequest(
            method: .get,
            path: "/leads/\(id)",
            requestOptions: requestOptions,
            responseType: Lead.self
        )
    }

    /// Update the metadata or referrer information on an existing lead record.
    ///
    /// Required permissions:
    ///  - `lead:manage`
    ///  - `member:email:read`
    ///  - `access_pass:basic:read`
    ///  - `member:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.leads.update(
    ///         id: "lead_xxxxxxxxxxxxx",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the lead to update, starting with 'lead_'.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateLeadsRequest, requestOptions: RequestOptions? = nil) async throws -> Lead {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/leads/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Lead.self
        )
    }
}