import Foundation

public final class DisputesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the disputes across the accounts you can read.
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
    ///     _ = try await client.disputes.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Only disputes filed against this account (`biz_` tag). Omit it to cover every account you can read.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter order: The field to sort disputes by.
    /// - Parameter direction: Sort direction.
    /// - Parameter status: Only disputes in these statuses. Repeat the parameter to pass several — one paginated list covers all of them. Inquiries match only the `warning_` statuses. A `needs_response` dispute whose evidence deadline has passed reports and filters as `under_review` instead.
    /// - Parameter currency: Only disputes in this three-letter ISO currency.
    /// - Parameter createdBefore: Only disputes opened before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Only disputes opened after this ISO 8601 timestamp.
    /// - Parameter query: Search disputes by dispute ID, payment ID, user ID, membership ID, user email, name, or username. Email filtering requires the member:email:read permission.
    /// - Parameter includeSubaccounts: Also cover the account's subaccounts. Requires `account_id`, and is a 400 without it. Without `query`, covers the disputes of the account and every subaccount, in any order. The listing is cut off after 10 seconds; add a `query` to narrow it. With `query`, matches on dispute, payment, user or membership ID, buyer email, or a card's first 6 or 8 digits and last 4 separated by a space or dash (`424242 4242`); free-text queries such as a name search only the named account. Subaccounts' disputes are returned only for subaccounts you can read disputes on.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, order: ListDisputesRequestOrder? = nil, direction: ListDisputesRequestDirection? = nil, status: [ListDisputesRequestStatusItem]? = nil, currency: String? = nil, createdBefore: String? = nil, createdAfter: String? = nil, query: String? = nil, includeSubaccounts: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> ListDisputesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/disputes",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "status": status.map { .unknown($0) }, 
                "currency": currency.map { .string($0) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "query": query.map { .string($0) }, 
                "include_subaccounts": includeSubaccounts.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListDisputesResponse.self
        )
    }

    /// Totals up the same disputes the list returns, so you can build status tabs and totals without paging through them.
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
    ///     _ = try await client.disputes.summary()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter groups: Which breakdowns to return, keyed by these names under `groups`. Repeat the parameter to ask for several; omit it for all of them.
    /// - Parameter accountId: Only disputes filed against this account (`biz_` tag). Omit it to cover every account you can read.
    /// - Parameter status: Only disputes in these statuses. Repeat the parameter to pass several. A `needs_response` dispute whose evidence deadline has passed reports and filters as `under_review` instead.
    /// - Parameter currency: Only disputes in this three-letter ISO currency.
    /// - Parameter createdBefore: Only disputes opened before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Only disputes opened after this ISO 8601 timestamp.
    /// - Parameter query: Search disputes by dispute ID, payment ID, user ID, membership ID, user email, name, or username. Email filtering requires the member:email:read permission.
    /// - Parameter includeSubaccounts: Also cover the account's subaccounts. Requires `account_id`, and is a 400 without it. Without `query`, covers the disputes of the account and every subaccount, in any order. The listing is cut off after 10 seconds; add a `query` to narrow it. With `query`, matches on dispute, payment, user or membership ID, buyer email, or a card's first 6 or 8 digits and last 4 separated by a space or dash (`424242 4242`); free-text queries such as a name search only the named account. Subaccounts' disputes are returned only for subaccounts you can read disputes on.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func summary(groups: [SummaryDisputesRequestGroupsItem]? = nil, accountId: String? = nil, status: [SummaryDisputesRequestStatusItem]? = nil, currency: String? = nil, createdBefore: String? = nil, createdAfter: String? = nil, query: String? = nil, includeSubaccounts: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> SummaryDisputesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/disputes/summary",
            queryParams: [
                "groups": groups.map { .unknown($0) }, 
                "account_id": accountId.map { .string($0) }, 
                "status": status.map { .unknown($0) }, 
                "currency": currency.map { .string($0) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "query": query.map { .string($0) }, 
                "include_subaccounts": includeSubaccounts.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: SummaryDisputesResponse.self
        )
    }

    /// Retrieves a single dispute.
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
    ///     _ = try await client.disputes.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The dispute ID (`dspt_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Dispute {
        return try await httpClient.performRequest(
            method: .get,
            path: "/disputes/\(id)",
            requestOptions: requestOptions,
            responseType: Dispute.self
        )
    }

    /// Edits a dispute's evidence while it is still editable. When the evidence is ready, send it to the payment processor with `POST /disputes/:id/submit`.
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
    ///     _ = try await client.disputes.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The dispute ID (`dspt_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateDisputesRequest, requestOptions: RequestOptions? = nil) async throws -> Dispute {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/disputes/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Dispute.self
        )
    }

    /// Accepts a chargeback, conceding it to the customer instead of contesting it. The payment processor closes the dispute as `lost`. This is final — the dispute cannot be contested afterwards. Only a dispute whose `acceptable` is true can be accepted.
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
    ///     _ = try await client.disputes.accept(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The dispute ID (`dspt_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func accept(id: String, requestOptions: RequestOptions? = nil) async throws -> Dispute {
        return try await httpClient.performRequest(
            method: .post,
            path: "/disputes/\(id)/accept",
            requestOptions: requestOptions,
            responseType: Dispute.self
        )
    }

    /// Sends a dispute's evidence to the payment processor. The packet is checked against the processor's limits first, so a file over a cap is refused here with the file and the limit named. Otherwise the dispute is returned as `generating_response` with its evidence locked and the filing completes in the background: the dispute moves to `under_review` with `evidence_submitted_at` set once the processor accepts it, or back to `needs_response` with `submission_failure_reason` set when the processor refuses it, so it can be fixed and sent again before `evidence_due_at`. Either move is sent as `dispute.updated`.
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
    ///     _ = try await client.disputes.submit(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The dispute ID (`dspt_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func submit(id: String, requestOptions: RequestOptions? = nil) async throws -> Dispute {
        return try await httpClient.performRequest(
            method: .post,
            path: "/disputes/\(id)/submit",
            requestOptions: requestOptions,
            responseType: Dispute.self
        )
    }

    /// Replaces the full set of uploaded evidence documents on a dispute, beyond the four fixed evidence slots. Prefer `PATCH /disputes/:id` with `evidence.documents`, which does the same replace alongside every other evidence field in one call.
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
    ///     _ = try await client.disputes.uploadEvidence(
    ///         id: "id",
    ///         request: .init(documents: [
    ///             UploadEvidenceDisputesRequestDocumentsItem(
    ///                 documentType: .returnPolicy
    ///             )
    ///         ])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The dispute ID (`dspt_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func uploadEvidence(id: String, request: Requests.UploadEvidenceDisputesRequest, requestOptions: RequestOptions? = nil) async throws -> Dispute {
        return try await httpClient.performRequest(
            method: .post,
            path: "/disputes/\(id)/upload_evidence",
            body: request,
            requestOptions: requestOptions,
            responseType: Dispute.self
        )
    }
}