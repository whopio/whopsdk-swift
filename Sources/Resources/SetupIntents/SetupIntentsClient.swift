import Foundation

public final class SetupIntentsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists setup intents newest first. An account API key lists its own account; a user token lists every account it can read, or one account with `account_id`.
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
    ///     _ = try await client.setupIntents.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Only setup intents for this account, prefixed `biz_`.
    /// - Parameter status: Only setup intents in this state.
    /// - Parameter createdBefore: Only setup intents created before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Only setup intents created after this ISO 8601 timestamp.
    /// - Parameter order: The field to sort by.
    /// - Parameter direction: The sort direction.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, status: ListSetupIntentsRequestStatus? = nil, createdBefore: Date? = nil, createdAfter: Date? = nil, order: ListSetupIntentsRequestOrder? = nil, direction: ListSetupIntentsRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListSetupIntentsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/setup_intents",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "created_after": createdAfter.map { .date($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListSetupIntentsResponse.self
        )
    }

    /// Saves a buyer's payment method for later without charging it — one the buyer just supplied through the payment elements in setup mode, or one already on file to re-verify. The setup completes in the background, so the response is the setup intent as created, not its outcome: hand `client_secret` to the elements' `handleNextAction`, or poll Retrieve setup status. A buyer's own token holding `member:payment_methods:use` may create a setup intent for itself from a confirmation token.
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
    ///     _ = try await client.setupIntents.create(request: .init(accountId: "biz_xxxxxxxxxxxxxx"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateSetupIntentsRequest, requestOptions: RequestOptions? = nil) async throws -> SetupIntent {
        return try await httpClient.performRequest(
            method: .post,
            path: "/setup_intents",
            body: request,
            requestOptions: requestOptions,
            responseType: SetupIntent.self
        )
    }

    /// Retrieves a setup intent. Once its `status` is `succeeded`, charge the saved method by its `payment_method_id`. The buyer's own token may retrieve a setup intent that belongs to it.
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
    ///     _ = try await client.setupIntents.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The setup intent to retrieve, prefixed `sint_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> SetupIntent {
        return try await httpClient.performRequest(
            method: .get,
            path: "/setup_intents/\(id)",
            requestOptions: requestOptions,
            responseType: SetupIntent.self
        )
    }

    /// Changes where the buyer lands after completing an off-site step, up until they return. Accepts either a secret key or the setup's own `client_secret` in the body, so the surface that knows the final destination can set it.
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
    ///     _ = try await client.setupIntents.updateReturnUrl(
    ///         setupIntentId: "setup_intent_id",
    ///         request: .init(returnUrl: "https://shinetime.example/checkout/thanks")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter setupIntentId: The unique identifier of the setup intent.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func updateReturnUrl(setupIntentId: String, request: Requests.UpdateReturnUrlSetupIntentsRequest, requestOptions: RequestOptions? = nil) async throws -> SetupStatus {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/setup_intents/\(setupIntentId)/return_url",
            body: request,
            requestOptions: requestOptions,
            responseType: SetupStatus.self
        )
    }

    /// Retrieves how far a setup has got and what the buyer must do next, if anything. Collection runs in the background, so poll this rather than reading the create response. Accepts either a secret key or the setup's own `client_secret` as a query parameter, so the surface collecting the payment method can poll it directly.
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
    ///     _ = try await client.setupIntents.retrieveStatus(setupIntentId: "setup_intent_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter setupIntentId: The unique identifier of the setup intent.
    /// - Parameter clientSecret: The setup's own `client_secret`, for a caller without a secret key.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieveStatus(setupIntentId: String, clientSecret: String? = nil, requestOptions: RequestOptions? = nil) async throws -> SetupStatus {
        return try await httpClient.performRequest(
            method: .get,
            path: "/setup_intents/\(setupIntentId)/status",
            queryParams: [
                "client_secret": clientSecret.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: SetupStatus.self
        )
    }
}