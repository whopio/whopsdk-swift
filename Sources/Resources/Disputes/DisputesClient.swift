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
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.disputes.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Only disputes filed against this account (`biz_` tag). Omit it to cover every account you can read.
    /// - Parameter first: The number of disputes to return (default 20, max 100).
    /// - Parameter after: A cursor; returns disputes after this position.
    /// - Parameter last: The number of disputes to return from the end of the range.
    /// - Parameter before: A cursor; returns disputes before this position.
    /// - Parameter order: The field to sort disputes by.
    /// - Parameter direction: Sort direction.
    /// - Parameter status: Only disputes in these statuses. Repeat the parameter to pass several — one paginated list covers all of them. Covers both chargebacks and inquiries at each stage. A `needs_response` dispute whose evidence deadline has passed reports and filters as `under_review` instead.
    /// - Parameter currency: Only disputes in this three-letter ISO currency.
    /// - Parameter createdBefore: Only disputes opened before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Only disputes opened after this ISO 8601 timestamp.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, order: ListDisputesRequestOrder? = nil, direction: ListDisputesRequestDirection? = nil, status: [ListDisputesRequestStatusItem]? = nil, currency: String? = nil, createdBefore: String? = nil, createdAfter: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListDisputesResponse {
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
                "created_after": createdAfter.map { .string($0) }
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
    ///     let client = Whop(token: "<token>")
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
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func summary(groups: [SummaryDisputesRequestGroupsItem]? = nil, accountId: String? = nil, status: [SummaryDisputesRequestStatusItem]? = nil, currency: String? = nil, createdBefore: String? = nil, createdAfter: String? = nil, requestOptions: RequestOptions? = nil) async throws -> SummaryDisputesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/disputes/summary",
            queryParams: [
                "groups": groups.map { .unknown($0) }, 
                "account_id": accountId.map { .string($0) }, 
                "status": status.map { .unknown($0) }, 
                "currency": currency.map { .string($0) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }
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
    ///     let client = Whop(token: "<token>")
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

    /// Edits a dispute's evidence, while it is still editable. Sending it is a separate call.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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

    /// Sends a dispute's evidence to the payment processor. This is final — it cannot be edited or sent again.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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

    /// Submit a payment dispute to the payment processor for review. Once submitted, no further edits can be made.
    ///
    /// Required permissions:
    ///  - `payment:dispute`
    ///  - `plan:basic:read`
    ///  - `access_pass:basic:read`
    ///  - `company:basic:read`
    ///  - `payment:basic:read`
    ///  - `member:email:read`
    ///  - `member:basic:read`
    ///  - `member:phone:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.disputes.submitEvidenceDispute(id: "dspt_xxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the dispute to submit to the payment processor for review.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func submitEvidenceDispute(id: String, requestOptions: RequestOptions? = nil) async throws -> Dispute {
        return try await httpClient.performRequest(
            method: .post,
            path: "/disputes/\(id)/submit_evidence",
            requestOptions: requestOptions,
            responseType: Dispute.self
        )
    }

    /// Update a dispute with evidence data to attempt to win the dispute.
    ///
    /// Required permissions:
    ///  - `payment:dispute`
    ///  - `plan:basic:read`
    ///  - `access_pass:basic:read`
    ///  - `company:basic:read`
    ///  - `payment:basic:read`
    ///  - `member:email:read`
    ///  - `member:basic:read`
    ///  - `member:phone:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.disputes.updateEvidenceDispute(
    ///         id: "dspt_xxxxxxxxxxxxx",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the dispute to update.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func updateEvidenceDispute(id: String, request: Requests.UpdateEvidenceDisputeRequest, requestOptions: RequestOptions? = nil) async throws -> Dispute {
        return try await httpClient.performRequest(
            method: .post,
            path: "/disputes/\(id)/update_evidence",
            body: request,
            requestOptions: requestOptions,
            responseType: Dispute.self
        )
    }

    /// Replaces the full set of uploaded evidence documents on a dispute, beyond the four fixed evidence slots. Send the files as multipart file parts to upload and attach in one call, or reference files already stored by `id`/`direct_upload_id`. Send every document the packet should carry — up to 10, 10MB each and 25MB in total; an empty list removes them all. Accepted content types: application/pdf, application/json, image/jpeg, image/png, image/webp — any other type is rejected.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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