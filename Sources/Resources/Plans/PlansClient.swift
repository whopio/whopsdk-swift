import Foundation

public final class PlansClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Deprecated compatibility endpoint. List variants with `GET /variants` instead.
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
    ///     _ = try await client.plans.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, direction: ListPlansRequestDirection? = nil, order: ListPlansRequestOrder? = nil, releaseMethods: [String]? = nil, visibilities: [String]? = nil, billingTypes: [String]? = nil, productIds: [String]? = nil, createdBefore: String? = nil, createdAfter: String? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListPlansResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/plans",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "order": order.map { .string($0.rawValue) }, 
                "release_methods": releaseMethods.map { .stringArray($0) }, 
                "visibilities": visibilities.map { .stringArray($0) }, 
                "billing_types": billingTypes.map { .stringArray($0) }, 
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

    /// Deprecated compatibility endpoint. Create variants with `POST /variants` instead.
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

    /// Deprecated compatibility endpoint. Retrieve variants with `GET /variants/{id}` instead.
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
    ///     _ = try await client.plans.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Variant ID, prefixed `plan_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Plan {
        return try await httpClient.performRequest(
            method: .get,
            path: "/plans/\(id)",
            requestOptions: requestOptions,
            responseType: Plan.self
        )
    }

    /// Deprecated compatibility endpoint. Delete variants with `DELETE /variants/{id}` instead.
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
    ///     _ = try await client.plans.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Variant ID, prefixed `plan_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeletePlansResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/plans/\(id)",
            requestOptions: requestOptions,
            responseType: DeletePlansResponse.self
        )
    }

    /// Deprecated compatibility endpoint. Update variants with `PATCH /variants/{id}` instead.
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
    ///     _ = try await client.plans.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Variant ID, prefixed `plan_`.
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

    /// Deprecated compatibility endpoint. Quote tax with `POST /payment_quotes` instead.
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
    ///     _ = try await client.plans.calculateTax(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Variant ID, prefixed `plan_`.
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