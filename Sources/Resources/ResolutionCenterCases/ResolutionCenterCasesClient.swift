import Foundation

public final class ResolutionCenterCasesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists resolution center cases. Without `account_id` you get every case you can read — the ones you opened as a buyer and every account you are a team member of; the filters narrow that list.
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
    ///     _ = try await client.resolutionCenterCases.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Only cases filed against this account (`biz_` tag). With read access to the account this lists its whole queue; without, only the cases you opened against it.
    /// - Parameter userId: Only cases opened by this customer — a `user_` tag, or `me` for the calling user. It narrows what you can already read, so `me` lists the cases you opened without the ones on accounts you are a team member of.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter order: The field to sort cases by.
    /// - Parameter direction: Sort direction.
    /// - Parameter status: Only cases in these statuses. Repeat the parameter to pass several — one paginated list covers all of them.
    /// - Parameter reason: Only cases opened for these reasons. Repeat the parameter to pass several.
    /// - Parameter outcome: Only closed cases that ended these ways. Repeat the parameter to pass several.
    /// - Parameter createdBefore: Only cases created before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Only cases created after this ISO 8601 timestamp.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, userId: String? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, order: ListResolutionCenterCasesRequestOrder? = nil, direction: ListResolutionCenterCasesRequestDirection? = nil, status: [ListResolutionCenterCasesRequestStatusItem]? = nil, reason: [ListResolutionCenterCasesRequestReasonItem]? = nil, outcome: [ListResolutionCenterCasesRequestOutcomeItem]? = nil, createdBefore: String? = nil, createdAfter: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListResolutionCenterCasesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/resolution_center_cases",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "status": status.map { .unknown($0) }, 
                "reason": reason.map { .unknown($0) }, 
                "outcome": outcome.map { .unknown($0) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListResolutionCenterCasesResponse.self
        )
    }

    /// Opens a case, as the customer, against one of your own payments. Provide the payment (`receipt_id`), the `reason`, and a `message`.
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
    ///     _ = try await client.resolutionCenterCases.create(request: .init(
    ///         message: "The mobile detailer never showed up for the Ceramic Coating appointment.",
    ///         reason: .fraudulent,
    ///         receiptId: "pay_xxxxxxxxxxxxxx"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateResolutionCenterCasesRequest, requestOptions: RequestOptions? = nil) async throws -> ResolutionCenterCase {
        return try await httpClient.performRequest(
            method: .post,
            path: "/resolution_center_cases",
            body: request,
            requestOptions: requestOptions,
            responseType: ResolutionCenterCase.self
        )
    }

    /// Aggregates the same cases `GET /resolution_center_cases` lists, using the same filters. Use it to build status tabs and issue filters without paging the whole list.
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
    ///     _ = try await client.resolutionCenterCases.summary()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter groups: Which breakdowns to return, keyed by these names under `groups`. Repeat the parameter to ask for several; omit it for all of them.
    /// - Parameter accountId: The account to summarize cases for (`biz_` tag).
    /// - Parameter userId: Only cases opened by this customer — a `user_` tag, or `me` for the calling user.
    /// - Parameter status: Only cases in these statuses.
    /// - Parameter reason: Only cases opened for these reasons.
    /// - Parameter outcome: Only closed cases that ended these ways.
    /// - Parameter createdBefore: Only count cases created before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Only count cases created after this ISO 8601 timestamp.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func summary(groups: [SummaryResolutionCenterCasesRequestGroupsItem]? = nil, accountId: String? = nil, userId: String? = nil, status: [SummaryResolutionCenterCasesRequestStatusItem]? = nil, reason: [SummaryResolutionCenterCasesRequestReasonItem]? = nil, outcome: [SummaryResolutionCenterCasesRequestOutcomeItem]? = nil, createdBefore: String? = nil, createdAfter: String? = nil, requestOptions: RequestOptions? = nil) async throws -> SummaryResolutionCenterCasesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/resolution_center_cases/summary",
            queryParams: [
                "groups": groups.map { .unknown($0) }, 
                "account_id": accountId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }, 
                "status": status.map { .unknown($0) }, 
                "reason": reason.map { .unknown($0) }, 
                "outcome": outcome.map { .unknown($0) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: SummaryResolutionCenterCasesResponse.self
        )
    }

    /// Retrieves a single resolution center case with its full event timeline.
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
    ///     _ = try await client.resolutionCenterCases.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The resolution center case ID (`reso_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> ResolutionCenterCase {
        return try await httpClient.performRequest(
            method: .get,
            path: "/resolution_center_cases/\(id)",
            requestOptions: requestOptions,
            responseType: ResolutionCenterCase.self
        )
    }

    /// Accepts the case in the customer's favor, as the merchant: refunds the payment in full and closes the case.
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
    ///     _ = try await client.resolutionCenterCases.accept(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The resolution center case ID (`reso_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func accept(id: String, request: Requests.AcceptResolutionCenterCasesRequest, requestOptions: RequestOptions? = nil) async throws -> ResolutionCenterCase {
        return try await httpClient.performRequest(
            method: .post,
            path: "/resolution_center_cases/\(id)/accept",
            body: request,
            requestOptions: requestOptions,
            responseType: ResolutionCenterCase.self
        )
    }

    /// Appeals a decision, as the customer, on a case that closed in the merchant's favor. Escalates the case to Whop for platform review. A case can be appealed once, within 7 days of the decision.
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
    ///     _ = try await client.resolutionCenterCases.appeal(
    ///         id: "id",
    ///         request: .init(message: "The coating is already flaking on the hood two weeks later.")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The resolution center case ID (`reso_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func appeal(id: String, request: Requests.AppealResolutionCenterCasesRequest, requestOptions: RequestOptions? = nil) async throws -> ResolutionCenterCase {
        return try await httpClient.performRequest(
            method: .post,
            path: "/resolution_center_cases/\(id)/appeal",
            body: request,
            requestOptions: requestOptions,
            responseType: ResolutionCenterCase.self
        )
    }

    /// Denies the case, as the merchant: rejects the claim and closes the case with no refund.
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
    ///     _ = try await client.resolutionCenterCases.deny(
    ///         id: "id",
    ///         request: .init(message: "The ceramic coating was applied and the vehicle was collected on 2026-01-05.")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The resolution center case ID (`reso_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func deny(id: String, request: Requests.DenyResolutionCenterCasesRequest, requestOptions: RequestOptions? = nil) async throws -> ResolutionCenterCase {
        return try await httpClient.performRequest(
            method: .post,
            path: "/resolution_center_cases/\(id)/deny",
            body: request,
            requestOptions: requestOptions,
            responseType: ResolutionCenterCase.self
        )
    }

    /// Lists the case timeline, newest first. Events the viewer is not allowed to see are omitted — a customer reads the customer-visible timeline, the merchant reads the full one.
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
    ///     _ = try await client.resolutionCenterCases.events(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The resolution center case ID (`reso_` tag).
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func events(id: String, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> EventsResolutionCenterCasesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/resolution_center_cases/\(id)/events",
            queryParams: [
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: EventsResolutionCenterCasesResponse.self
        )
    }

    /// Replies to an open request for information on the case. As the merchant this answers Whop's request (valid while the case awaits your information); as the customer it provides the information requested from you. The actor is resolved from the credential.
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
    ///     _ = try await client.resolutionCenterCases.reply(
    ///         id: "id",
    ///         request: .init(message: "Here are the before and after photos from the Burnet Rd bay.")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The resolution center case ID (`reso_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func reply(id: String, request: Requests.ReplyResolutionCenterCasesRequest, requestOptions: RequestOptions? = nil) async throws -> ResolutionCenterCase {
        return try await httpClient.performRequest(
            method: .post,
            path: "/resolution_center_cases/\(id)/reply",
            body: request,
            requestOptions: requestOptions,
            responseType: ResolutionCenterCase.self
        )
    }

    /// Asks the customer for more information, as the merchant. Allowed up to 3 times per case before you must accept or deny it.
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
    ///     _ = try await client.resolutionCenterCases.requestInfo(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The resolution center case ID (`reso_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func requestInfo(id: String, request: Requests.RequestInfoResolutionCenterCasesRequest, requestOptions: RequestOptions? = nil) async throws -> ResolutionCenterCase {
        return try await httpClient.performRequest(
            method: .post,
            path: "/resolution_center_cases/\(id)/request_info",
            body: request,
            requestOptions: requestOptions,
            responseType: ResolutionCenterCase.self
        )
    }

    /// Withdraws (cancels) a case you opened, as the customer. Only possible while the case is still open.
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
    ///     _ = try await client.resolutionCenterCases.withdraw(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The resolution center case ID (`reso_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func withdraw(id: String, requestOptions: RequestOptions? = nil) async throws -> ResolutionCenterCase {
        return try await httpClient.performRequest(
            method: .post,
            path: "/resolution_center_cases/\(id)/withdraw",
            requestOptions: requestOptions,
            responseType: ResolutionCenterCase.self
        )
    }
}