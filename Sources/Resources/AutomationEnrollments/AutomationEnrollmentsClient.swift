import Foundation

public final class AutomationEnrollmentsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists members' enrollments in automations, newest first.
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
    ///     _ = try await client.automationEnrollments.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Only this account's enrollments, prefixed `biz_`. Defaults to the credential's account, or every account a user can read.
    /// - Parameter automationId: Only this automation's enrollments, prefixed `ato_`.
    /// - Parameter memberId: Only this member's enrollments, prefixed `mber_`.
    /// - Parameter status: Only enrollments with this status.
    /// - Parameter version: Only members on this automation version.
    /// - Parameter order: Field to sort by.
    /// - Parameter direction: Sort direction.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, automationId: String? = nil, memberId: String? = nil, status: ListAutomationEnrollmentsRequestStatus? = nil, version: Int? = nil, order: ListAutomationEnrollmentsRequestOrder? = nil, direction: ListAutomationEnrollmentsRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListAutomationEnrollmentsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/automation_enrollments",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "automation_id": automationId.map { .string($0) }, 
                "member_id": memberId.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "version": version.map { .int($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListAutomationEnrollmentsResponse.self
        )
    }

    /// Retrieves a member's enrollment in an automation, with the step they're waiting on.
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
    ///     _ = try await client.automationEnrollments.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Automation enrollment ID, prefixed `atoe_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> AutomationEnrollment {
        return try await httpClient.performRequest(
            method: .get,
            path: "/automation_enrollments/\(id)",
            requestOptions: requestOptions,
            responseType: AutomationEnrollment.self
        )
    }

    /// Cancels an `active` enrollment: the member gets none of the automation's remaining steps, and their enrollment becomes `canceled`. The member can enroll in the automation again later.
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
    ///     _ = try await client.automationEnrollments.cancel(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Automation enrollment ID, prefixed `atoe_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func cancel(id: String, requestOptions: RequestOptions? = nil) async throws -> AutomationEnrollment {
        return try await httpClient.performRequest(
            method: .post,
            path: "/automation_enrollments/\(id)/cancel",
            requestOptions: requestOptions,
            responseType: AutomationEnrollment.self
        )
    }
}