import Foundation

public final class EntriesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of waitlist entries for a company, with optional filtering by product, plan, status, and creation date.
    ///
    /// Required permissions:
    ///  - `plan:waitlist:read`
    ///  - `member:email:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.entries.list(
    ///         first: 42,
    ///         last: 42,
    ///         companyId: "biz_xxxxxxxxxxxxxx",
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
    /// - Parameter companyId: The unique identifier of the company to list waitlist entries for.
    /// - Parameter productIds: Filter entries to only those for specific products.
    /// - Parameter planIds: Filter entries to only those for specific plans.
    /// - Parameter statuses: Filter entries by their current status.
    /// - Parameter createdBefore: Only return entries created before this timestamp.
    /// - Parameter createdAfter: Only return entries created after this timestamp.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, companyId: String, direction: Direction? = nil, order: EntriesSortableColumns? = nil, productIds: [String]? = nil, planIds: [String]? = nil, statuses: [EntryStatus]? = nil, createdBefore: Date? = nil, createdAfter: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> ListEntriesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/entries",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "company_id": .string(companyId), 
                "direction": direction.map { .string($0.rawValue) }, 
                "order": order.map { .string($0.rawValue) }, 
                "product_ids": productIds.map { .stringArray($0) }, 
                "plan_ids": planIds.map { .stringArray($0) }, 
                "statuses": statuses.map { .unknown($0) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "created_after": createdAfter.map { .date($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListEntriesResponse.self
        )
    }

    /// Retrieves the details of an existing waitlist entry.
    ///
    /// Required permissions:
    ///  - `plan:waitlist:read`
    ///  - `member:email:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.entries.retrieve(id: "entry_xxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the waitlist entry to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Entry {
        return try await httpClient.performRequest(
            method: .get,
            path: "/entries/\(id)",
            requestOptions: requestOptions,
            responseType: Entry.self
        )
    }

    /// Approve a pending waitlist entry, triggering the checkout process to grant the user access to the plan.
    ///
    /// Required permissions:
    ///  - `plan:waitlist:manage`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.entries.approve(id: "entry_xxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the waitlist entry to approve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func approve(id: String, requestOptions: RequestOptions? = nil) async throws -> ApproveEntriesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/entries/\(id)/approve",
            requestOptions: requestOptions,
            responseType: ApproveEntriesResponse.self
        )
    }

    /// Deny a pending waitlist entry, preventing the user from gaining access to the plan.
    ///
    /// Required permissions:
    ///  - `plan:waitlist:manage`
    ///  - `plan:basic:read`
    ///  - `member:email:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.entries.deny(id: "entry_xxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the waitlist entry to deny.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func deny(id: String, requestOptions: RequestOptions? = nil) async throws -> Entry {
        return try await httpClient.performRequest(
            method: .post,
            path: "/entries/\(id)/deny",
            requestOptions: requestOptions,
            responseType: Entry.self
        )
    }
}