import Foundation

public final class CheckoutConfigurationsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists checkout configurations for an account.
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
    ///     _ = try await client.checkoutConfigurations.list(accountId: "account_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Account ID, prefixed `biz_`.
    /// - Parameter variantId: Only return checkout configurations for this variant ID, prefixed `plan_`.
    /// - Parameter createdBefore: Only return checkout configurations created before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Only return checkout configurations created after this ISO 8601 timestamp.
    /// - Parameter order: Field used to sort checkout configurations.
    /// - Parameter direction: Sort direction. Defaults to `desc`.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String, variantId: String? = nil, createdBefore: String? = nil, createdAfter: String? = nil, order: ListCheckoutConfigurationsRequestOrder? = nil, direction: ListCheckoutConfigurationsRequestDirection? = nil, first: Int? = nil, after: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListCheckoutConfigurationsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/checkout_configurations",
            queryParams: [
                "account_id": .string(accountId), 
                "variant_id": variantId.map { .string($0) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListCheckoutConfigurationsResponse.self
        )
    }

    /// Creates a reusable checkout configuration for an existing or inline variant. Send customers to its `purchase_url` to check out.
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
    ///     _ = try await client.checkoutConfigurations.create(request: .init(
    ///         accountId: "biz_xxxxxxxxxxxxxx",
    ///         variantId: .value("plan_xxxxxxxxxxxxx")
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateCheckoutConfigurationsRequest, requestOptions: RequestOptions? = nil) async throws -> CreateCheckoutConfigurationsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/checkout_configurations",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateCheckoutConfigurationsResponse.self
        )
    }

    /// Retrieves a checkout configuration by ID. This endpoint is public so a checkout page can load from the configuration URL.
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
    ///     _ = try await client.checkoutConfigurations.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ID of the checkout configuration.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> RetrieveCheckoutConfigurationsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/checkout_configurations/\(id)",
            requestOptions: requestOptions,
            responseType: RetrieveCheckoutConfigurationsResponse.self
        )
    }

    /// Deletes a checkout configuration so its checkout URL can no longer be used.
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
    ///     _ = try await client.checkoutConfigurations.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ID of the checkout configuration.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeleteCheckoutConfigurationsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/checkout_configurations/\(id)",
            requestOptions: requestOptions,
            responseType: DeleteCheckoutConfigurationsResponse.self
        )
    }
}