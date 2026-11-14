import Foundation

public final class FinancingApplicationsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists payment-financing applications. Without `account_id`, an account credential lists its own account and its direct subaccounts, but not deeper descendants, and a user credential lists every account it can read applications for.
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
    ///     _ = try await client.financingApplications.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Only applications for this account, prefixed `biz_`.
    /// - Parameter status: Only applications in this review state.
    /// - Parameter createdBefore: Applications created at or before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Applications created at or after this ISO 8601 timestamp.
    /// - Parameter order: Field to sort by. Defaults to created_at.
    /// - Parameter direction: Sort direction. Defaults to desc.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, status: ListFinancingApplicationsRequestStatus? = nil, createdBefore: String? = nil, createdAfter: String? = nil, order: ListFinancingApplicationsRequestOrder? = nil, direction: ListFinancingApplicationsRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListFinancingApplicationsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/financing_applications",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListFinancingApplicationsResponse.self
        )
    }

    /// Starts an application for payment-financing approval, or returns the account's open one: an application in `awaiting_review` takes precedence over one in `requires_collection`, and the open application is reused across different `Idempotency-Key` values. Creating an application does not submit it for review. The account must have a Whop balance set up, and accounts in restricted industries cannot apply. Once an application closes, the account can apply again.
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
    ///     _ = try await client.financingApplications.create(request: .init())
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateFinancingApplicationsRequest, requestOptions: RequestOptions? = nil) async throws -> FinancingApplication {
        return try await httpClient.performRequest(
            method: .post,
            path: "/financing_applications",
            body: request,
            requestOptions: requestOptions,
            responseType: FinancingApplication.self
        )
    }

    /// Retrieves a payment-financing application with its review state, requirements, saved answers, documents, current terms, and review feedback. Requires read access to the account that owns it.
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
    ///     _ = try await client.financingApplications.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Financing application ID, prefixed `inrq_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> FinancingApplication {
        return try await httpClient.performRequest(
            method: .get,
            path: "/financing_applications/\(id)",
            requestOptions: requestOptions,
            responseType: FinancingApplication.self
        )
    }

    /// Saves merchant answers to an application in `requires_collection`. The batch is atomic: if any answer is rejected, none are saved. Omitted requirements and answer fields are left unchanged. Saving answers does not submit the application; call Submit Financing Application when it is complete.
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
    ///     _ = try await client.financingApplications.update(
    ///         id: "id",
    ///         request: .init(answers: [
    ///             UpdateFinancingApplicationsRequestAnswersItem(
    ///                 requirementId: "inrqi_xxxxxxxxxxxxxx"
    ///             )
    ///         ])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Financing application ID, prefixed `inrq_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateFinancingApplicationsRequest, requestOptions: RequestOptions? = nil) async throws -> FinancingApplication {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/financing_applications/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: FinancingApplication.self
        )
    }

    /// Submits a complete application for financing review, recording the merchant's acceptance, who submitted, and when, then moving it to `awaiting_review`. Before calling, present the application's `terms.content`, policies, and disclosure to the merchant and collect affirmative acceptance; every resubmission needs acceptance again. Only an application in `requires_collection` can be submitted, including after a reviewer requests more information. Retry with the same `Idempotency-Key`: submitting an application already in review without a replay returns an error. Approval does not by itself enable financing payment methods.
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
    ///     _ = try await client.financingApplications.submit(
    ///         id: "id",
    ///         request: .init(merchantAcceptance: SubmitFinancingApplicationsRequestMerchantAcceptance(
    ///             accepted: true,
    ///             termsVersion: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    ///         ))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Financing application ID, prefixed `inrq_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func submit(id: String, request: Requests.SubmitFinancingApplicationsRequest, requestOptions: RequestOptions? = nil) async throws -> FinancingApplication {
        return try await httpClient.performRequest(
            method: .post,
            path: "/financing_applications/\(id)/submit",
            body: request,
            requestOptions: requestOptions,
            responseType: FinancingApplication.self
        )
    }
}