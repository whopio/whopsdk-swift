import Foundation

public final class PaymentRulesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the payment rules on an account.
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
    ///     _ = try await client.paymentRules.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Only return rules belonging to this account. Defaults to the account the request is acting for.
    /// - Parameter status: Only return rules with this status.
    /// - Parameter action: Only return rules that take this action.
    /// - Parameter order: The field to sort by.
    /// - Parameter direction: The sort direction.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, status: ListPaymentRulesRequestStatus? = nil, action: ListPaymentRulesRequestAction? = nil, order: ListPaymentRulesRequestOrder? = nil, direction: ListPaymentRulesRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListPaymentRulesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payment_rules",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "action": action.map { .string($0.rawValue) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListPaymentRulesResponse.self
        )
    }

    /// Creates a payment rule. It is created `active` and applies its `action` to new payments that match all of its `conditions`.
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
    ///     _ = try await client.paymentRules.create(request: .init(
    ///         action: .allow,
    ///         conditions: CreatePaymentRulesRequestConditions(
    ///             all: [
    ///                 CreatePaymentRulesRequestConditionsAllItem(
    ///                     field: .riskScore,
    ///                     operator: .gte,
    ///                     value: PaymentRuleConditionValue.double(
    ///                         70
    ///                     )
    ///                 )
    ///             ]
    ///         ),
    ///         name: "Review risky cards"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreatePaymentRulesRequest, requestOptions: RequestOptions? = nil) async throws -> PaymentRule {
        return try await httpClient.performRequest(
            method: .post,
            path: "/payment_rules",
            body: request,
            requestOptions: requestOptions,
            responseType: PaymentRule.self
        )
    }

    /// Lists the payment attributes a rule condition can read, with the operators and values each one accepts. Small and returned in full on one page.
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
    ///     _ = try await client.paymentRules.listFields()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func listFields(requestOptions: RequestOptions? = nil) async throws -> ListFieldsPaymentRulesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payment_rules/fields",
            requestOptions: requestOptions,
            responseType: ListFieldsPaymentRulesResponse.self
        )
    }

    /// Retrieves a payment rule.
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
    ///     _ = try await client.paymentRules.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The payment rule ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> PaymentRule {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payment_rules/\(id)",
            requestOptions: requestOptions,
            responseType: PaymentRule.self
        )
    }

    /// Deletes a payment rule. It stops applying to new payments but is kept, so the payments it already decided still name it.
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
    ///     _ = try await client.paymentRules.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The payment rule ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/payment_rules/\(id)",
            requestOptions: requestOptions
        )
    }

    /// Updates a payment rule's name or metadata, keeping its ID and everything recorded against it. A rule's `action` and `conditions` are fixed once created, so the payments it decided keep naming the rule that decided them; use `POST /payment_rules/:id/replace` to change them.
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
    ///     _ = try await client.paymentRules.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The payment rule ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdatePaymentRulesRequest, requestOptions: RequestOptions? = nil) async throws -> PaymentRule {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/payment_rules/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: PaymentRule.self
        )
    }

    /// Activates an inactive payment rule so it applies to new payments again. A deleted rule cannot be activated.
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
    ///     _ = try await client.paymentRules.activate(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The payment rule ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func activate(id: String, requestOptions: RequestOptions? = nil) async throws -> PaymentRule {
        return try await httpClient.performRequest(
            method: .post,
            path: "/payment_rules/\(id)/activate",
            requestOptions: requestOptions,
            responseType: PaymentRule.self
        )
    }

    /// Deactivates a payment rule so it stops applying to new payments. It keeps its ID and can be activated again.
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
    ///     _ = try await client.paymentRules.deactivate(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The payment rule ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func deactivate(id: String, requestOptions: RequestOptions? = nil) async throws -> PaymentRule {
        return try await httpClient.performRequest(
            method: .post,
            path: "/payment_rules/\(id)/deactivate",
            requestOptions: requestOptions,
            responseType: PaymentRule.self
        )
    }

    /// Changes a payment rule's `action` and `conditions` by deleting it and creating its successor in one step. The successor has a new ID and keeps the replaced rule's name, metadata, and `active` or `inactive` status.
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
    ///     _ = try await client.paymentRules.replace(
    ///         id: "id",
    ///         request: .init(
    ///             action: .allow,
    ///             conditions: ReplacePaymentRulesRequestConditions(
    ///                 all: [
    ///                     ReplacePaymentRulesRequestConditionsAllItem(
    ///                         field: .riskScore,
    ///                         operator: .gte,
    ///                         value: PaymentRuleConditionValue.double(
    ///                             70
    ///                         )
    ///                     )
    ///                 ]
    ///             )
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The payment rule ID.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func replace(id: String, request: Requests.ReplacePaymentRulesRequest, requestOptions: RequestOptions? = nil) async throws -> PaymentRule {
        return try await httpClient.performRequest(
            method: .post,
            path: "/payment_rules/\(id)/replace",
            body: request,
            requestOptions: requestOptions,
            responseType: PaymentRule.self
        )
    }
}