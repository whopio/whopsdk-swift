import Foundation

public final class AutomationsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists automations, newest first.
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
    ///     _ = try await client.automations.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Only this account's automations, prefixed `biz_`. Defaults to the credential's account, or every account a user can read.
    /// - Parameter status: Only automations with this status.
    /// - Parameter triggerEvent: Only automations this webhook event enrolls into.
    /// - Parameter order: Field to sort by.
    /// - Parameter direction: Sort direction.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, status: ListAutomationsRequestStatus? = nil, triggerEvent: ListAutomationsRequestTriggerEvent? = nil, order: ListAutomationsRequestOrder? = nil, direction: ListAutomationsRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListAutomationsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/automations",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "trigger_event": triggerEvent.map { .string($0.rawValue) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListAutomationsResponse.self
        )
    }

    /// Creates an automation, `stopped`, with an empty draft version. Add steps with `POST /automation_steps`, then publish it with `POST /automations/{id}/publish`, which makes it `active`.
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
    ///     _ = try await client.automations.create(request: .init(name: "Welcome"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateAutomationsRequest, requestOptions: RequestOptions? = nil) async throws -> Automation {
        return try await httpClient.performRequest(
            method: .post,
            path: "/automations",
            body: request,
            requestOptions: requestOptions,
            responseType: Automation.self
        )
    }

    /// Retrieves an automation, with how many members are in it now and how many times members have enrolled in it.
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
    ///     _ = try await client.automations.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Automation ID, prefixed `ato_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Automation {
        return try await httpClient.performRequest(
            method: .get,
            path: "/automations/\(id)",
            requestOptions: requestOptions,
            responseType: Automation.self
        )
    }

    /// Deletes an automation. It stops enrolling members, and every member in it stops.
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
    ///     _ = try await client.automations.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Automation ID, prefixed `ato_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Automation {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/automations/\(id)",
            requestOptions: requestOptions,
            responseType: Automation.self
        )
    }

    /// Renames an automation, changes its trigger event before its first publish, sets its secrets, or changes its status. Changing `secrets` or `status` also needs `automation:manage`. Use `POST /automations/{id}/publish` to publish the draft, and the steps endpoints to change what it does.
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
    ///     _ = try await client.automations.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Automation ID, prefixed `ato_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateAutomationsRequest, requestOptions: RequestOptions? = nil) async throws -> Automation {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/automations/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Automation.self
        )
    }

    /// Publishes the draft version: new members start on it, and the automation becomes `active`. Members already in the automation move onto it. A member stays on the same step when it's still there. When the draft removed that step, the member moves to the step that now follows the nearest earlier step the draft kept. The draft is then copied into the next draft version, whose steps get new IDs and keep their `key`. Every draft step's `issues` must be empty. When the draft has no edits since the last publish, no new version is made. Publishing then only makes a `closed` or `stopped` automation `active` again. The account must have Economic Intelligence turned on.
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
    ///     _ = try await client.automations.publish(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Automation ID, prefixed `ato_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func publish(id: String, requestOptions: RequestOptions? = nil) async throws -> Automation {
        return try await httpClient.performRequest(
            method: .post,
            path: "/automations/\(id)/publish",
            requestOptions: requestOptions,
            responseType: Automation.self
        )
    }

    /// Enrolls members into an active automation at the first step of its published version: the members you name, or every member `GET /members` lists with the filters you pass, as they match now. Members already in the automation are skipped. Enrolling runs in the background, so this returns the automation right away and `active_enrollments_count` grows as members enroll.
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
    ///     _ = try await client.automations.trigger(
    ///         id: "id",
    ///         request: .init(members: TriggerAutomationsRequestMembers.stringArray(
    ///             [
    ///                 "mber_xxxxxxxxxxxxxx"
    ///             ]
    ///         ))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Automation ID, prefixed `ato_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func trigger(id: String, request: Requests.TriggerAutomationsRequest, requestOptions: RequestOptions? = nil) async throws -> Automation {
        return try await httpClient.performRequest(
            method: .post,
            path: "/automations/\(id)/trigger",
            body: request,
            requestOptions: requestOptions,
            responseType: Automation.self
        )
    }
}