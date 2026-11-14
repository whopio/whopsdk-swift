import Foundation

public final class AutomationStepsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists automation steps. With `automation_id`, lists one version of that automation in the order its steps run: the draft version unless `version` names another. Without it, lists the steps of every version of every automation, newest first. Steps get new IDs at every publish, so list them again afterwards and match them up by `key`.
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
    ///     _ = try await client.automationSteps.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter automationId: Only this automation's steps, in run order, prefixed `ato_`. `order` doesn't apply.
    /// - Parameter version: With `automation_id`, the version to list, such as its `published_version`. Defaults to its `draft_version`.
    /// - Parameter accountId: Without `automation_id`, only this account's steps, prefixed `biz_`. Defaults to the credential's account, or every account a user can read.
    /// - Parameter order: Field to sort by.
    /// - Parameter direction: Sort direction.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(automationId: String? = nil, version: Int? = nil, accountId: String? = nil, order: ListAutomationStepsRequestOrder? = nil, direction: ListAutomationStepsRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListAutomationStepsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/automation_steps",
            queryParams: [
                "automation_id": automationId.map { .string($0) }, 
                "version": version.map { .int($0) }, 
                "account_id": accountId.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListAutomationStepsResponse.self
        )
    }

    /// Adds a step to an automation's draft version, directly after `previous_step_id`, or first when it's left out. The step that held that position now runs after the new one. Steps can't be moved, so add each one where it belongs. Setting `source_code` also needs every read permission listed for previewing a step, which the step's code reads the account with.
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
    ///     _ = try await client.automationSteps.create(request: .init(
    ///         actionType: .wait,
    ///         automationId: "ato_xxxxxxxxxxxxxx"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateAutomationStepsRequest, requestOptions: RequestOptions? = nil) async throws -> AutomationStep {
        return try await httpClient.performRequest(
            method: .post,
            path: "/automation_steps",
            body: request,
            requestOptions: requestOptions,
            responseType: AutomationStep.self
        )
    }

    /// Retrieves an automation step, with how many members are waiting for it.
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
    ///     _ = try await client.automationSteps.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Automation step ID, prefixed `atos_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> AutomationStep {
        return try await httpClient.performRequest(
            method: .get,
            path: "/automation_steps/\(id)",
            requestOptions: requestOptions,
            responseType: AutomationStep.self
        )
    }

    /// Deletes a step of the draft version. The step after it runs in its place. Members already in the automation aren't affected until the draft is published.
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
    ///     _ = try await client.automationSteps.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Automation step ID, prefixed `atos_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> AutomationStep {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/automation_steps/\(id)",
            requestOptions: requestOptions,
            responseType: AutomationStep.self
        )
    }

    /// Edits a step of the draft version. A published version's steps never change; edit the same `key` in the draft instead. `previous_step_id` can't change. Setting `source_code` also needs every read permission listed for previewing a step, which the step's code reads the account with.
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
    ///     _ = try await client.automationSteps.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Automation step ID, prefixed `atos_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateAutomationStepsRequest, requestOptions: RequestOptions? = nil) async throws -> AutomationStep {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/automation_steps/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: AutomationStep.self
        )
    }

    /// Runs an `email` or `message` step's code for one member, as if they had reached it, and returns what it would send. Nothing is sent. The step's code reads the account with every account-level `:read` permission that both the admin role and Whop AI hold except `payout:account:read`, so previewing, like setting `source_code`, needs `automation:write` and every one of those permissions. OAuth apps can't be granted all of them, so they can't preview or set step code.
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
    ///     _ = try await client.automationSteps.preview(
    ///         id: "id",
    ///         request: .init(memberId: "mber_xxxxxxxxxxxxxx")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Automation step ID, prefixed `atos_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func preview(id: String, request: Requests.PreviewAutomationStepsRequest, requestOptions: RequestOptions? = nil) async throws -> AutomationStepPreview {
        return try await httpClient.performRequest(
            method: .post,
            path: "/automation_steps/\(id)/preview",
            body: request,
            requestOptions: requestOptions,
            responseType: AutomationStepPreview.self
        )
    }
}