import Foundation

public final class PlansClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of plans belonging to an account, with optional filtering by visibility, type, release method, and product.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.plans.list(
    ///         accountId: "account_id",
    ///         releaseMethods: [
    ///             "buy_now"
    ///         ],
    ///         visibilities: [
    ///             "visible"
    ///         ],
    ///         planTypes: [
    ///             "renewal"
    ///         ],
    ///         productIds: [
    ///             "prod_xxxxxxxxxxxxxx"
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The unique identifier of the account to list plans for.
    /// - Parameter direction: The sort direction for results. Defaults to descending.
    /// - Parameter order: The field to sort results by. Defaults to created_at.
    /// - Parameter releaseMethods: Filter to only plans matching these release methods.
    /// - Parameter visibilities: Filter to only plans matching these visibility states.
    /// - Parameter planTypes: Filter to only plans matching these billing types.
    /// - Parameter productIds: Filter to only plans belonging to these product identifiers.
    /// - Parameter createdBefore: Only return plans created before this timestamp.
    /// - Parameter createdAfter: Only return plans created after this timestamp.
    /// - Parameter first: The number of plans to return (default and max 100).
    /// - Parameter after: A cursor; returns plans after this position.
    /// - Parameter last: The number of plans to return from the end of the range.
    /// - Parameter before: A cursor; returns plans before this position.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String, direction: ListPlansRequestDirection? = nil, order: ListPlansRequestOrder? = nil, releaseMethods: [String]? = nil, visibilities: [String]? = nil, planTypes: [String]? = nil, productIds: [String]? = nil, createdBefore: String? = nil, createdAfter: String? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListPlansResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/plans",
            queryParams: [
                "account_id": .string(accountId), 
                "direction": direction.map { .string($0.rawValue) }, 
                "order": order.map { .string($0.rawValue) }, 
                "release_methods": releaseMethods.map { .stringArray($0) }, 
                "visibilities": visibilities.map { .stringArray($0) }, 
                "plan_types": planTypes.map { .stringArray($0) }, 
                "product_ids": productIds.map { .stringArray($0) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListPlansResponse.self
        )
    }

    /// Create a new pricing plan for a product. The plan defines the billing interval, price, and availability for customers.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.plans.create(request: .init())
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreatePlansRequest, requestOptions: RequestOptions? = nil) async throws -> Plan {
        return try await httpClient.performRequest(
            method: .post,
            path: "/plans",
            body: request,
            requestOptions: requestOptions,
            responseType: Plan.self
        )
    }

    /// Retrieves the details of an existing plan.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.plans.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Plan ID, prefixed `plan_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Plan {
        return try await httpClient.performRequest(
            method: .get,
            path: "/plans/\(id)",
            requestOptions: requestOptions,
            responseType: Plan.self
        )
    }

    /// Permanently delete a plan from a product. Existing memberships on this plan will not be affected.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.plans.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Plan ID, prefixed `plan_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeletePlansResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/plans/\(id)",
            requestOptions: requestOptions,
            responseType: DeletePlansResponse.self
        )
    }

    /// Update a plan's pricing, billing interval, visibility, stock, and other settings.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.plans.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Plan ID, prefixed `plan_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdatePlansRequest, requestOptions: RequestOptions? = nil) async throws -> Plan {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/plans/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Plan.self
        )
    }

    /// Previews tax for a plan before checkout, based on the buyer's location.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.plans.calculateTax(
    ///         id: "id",
    ///         request: .init(address: .value(CalculateTaxPlansRequestAddress(
    ///             country: "DE",
    ///             postalCode: .value("10115")
    ///         )))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Plan ID, prefixed `plan_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func calculateTax(id: String, request: Requests.CalculateTaxPlansRequest, requestOptions: RequestOptions? = nil) async throws -> CalculateTaxPlansResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/plans/\(id)/calculate_tax",
            body: request,
            requestOptions: requestOptions,
            responseType: CalculateTaxPlansResponse.self
        )
    }
}