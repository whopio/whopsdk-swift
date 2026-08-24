import Foundation

public final class TransfersClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists an account's transfers.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.transfers.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter originId: Filter to transfers sent from this account. Provide this or destination_id.
    /// - Parameter destinationId: Filter to transfers received by this account. Provide this or origin_id.
    /// - Parameter order: Sort column. Defaults to created_at.
    /// - Parameter direction: Sort direction. Defaults to desc.
    /// - Parameter createdBefore: Only transfers created strictly before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Only transfers created strictly after this ISO 8601 timestamp.
    /// - Parameter first: Number of transfers to return from the start of the window.
    /// - Parameter after: Cursor to fetch the page after (from page_info.end_cursor).
    /// - Parameter last: Number of transfers to return from the end of the window.
    /// - Parameter before: Cursor to fetch the page before (from page_info.start_cursor).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(originId: String? = nil, destinationId: String? = nil, order: ListTransfersRequestOrder? = nil, direction: ListTransfersRequestDirection? = nil, createdBefore: String? = nil, createdAfter: String? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListTransfersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/transfers",
            queryParams: [
                "origin_id": originId.map { .string($0) }, 
                "destination_id": destinationId.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListTransfersResponse.self
        )
    }

    /// Moves money between accounts, or into a claim link anyone with the URL can redeem.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.transfers.create(request: .init(
    ///         amount: 25,
    ///         originId: "biz_xxxxxxxxxxxxxx"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateTransfersRequest, requestOptions: RequestOptions? = nil) async throws -> CreateTransfersResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/transfers",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateTransfersResponse.self
        )
    }

    /// Lists the people and accounts you can send money to.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.transfers.listRecipients(originId: "origin_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter originId: The account sending the money: a company account ID (`biz_`), or a user ID (`user_`) for that user's own personal balance.
    /// - Parameter query: Search anyone on Whop by name or username, plus your own accounts by name or ID. Omit it to get the team around the balance, the people you follow, and your own accounts. The list is the same whether the balance belongs to a company or to you. Searching from a `biz_` origin additionally requires the member:basic:read scope. A credential scoped to a single company is the exception to the search itself: it only ever sees that company's own people. Complete email addresses return no matches.
    /// - Parameter first: Number of recipients per page. Search queries preserve the dashboard's 20-result maximum.
    /// - Parameter after: Cursor to fetch the page after (from page_info.end_cursor).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func listRecipients(originId: String, query: String? = nil, first: Int? = nil, after: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListRecipientsTransfersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/transfers/recipients",
            queryParams: [
                "origin_id": .string(originId), 
                "query": query.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListRecipientsTransfersResponse.self
        )
    }

    /// Retrieves a single transfer.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.transfers.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The transfer ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> RetrieveTransfersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/transfers/\(id)",
            requestOptions: requestOptions,
            responseType: RetrieveTransfersResponse.self
        )
    }
}