import Foundation

public final class SetupIntentsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of setup intents for a company, with optional filtering by creation date. A setup intent securely collects and stores a member's payment method for future use without charging them immediately.
    ///
    /// Required permissions:
    ///  - `payment:setup_intent:read`
    ///  - `member:basic:read`
    ///  - `member:email:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.setupIntents.list(
    ///         first: 42,
    ///         last: 42,
    ///         companyId: "biz_xxxxxxxxxxxxxx",
    ///         createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
    ///         createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter after: Returns the elements in the list that come after the specified cursor.
    /// - Parameter before: Returns the elements in the list that come before the specified cursor.
    /// - Parameter first: Returns the first _n_ elements from the list.
    /// - Parameter last: Returns the last _n_ elements from the list.
    /// - Parameter companyId: The unique identifier of the company to list setup intents for.
    /// - Parameter createdBefore: Only return setup intents created before this timestamp.
    /// - Parameter createdAfter: Only return setup intents created after this timestamp.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, companyId: String, direction: Direction? = nil, createdBefore: Date? = nil, createdAfter: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> ListSetupIntentsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/setup_intents",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "company_id": .string(companyId), 
                "direction": direction.map { .string($0.rawValue) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "created_after": createdAfter.map { .date($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListSetupIntentsResponse.self
        )
    }

    /// Save a buyer's payment method for later without charging it. Provide a confirmation token for a method the buyer just supplied, or an existing payment method to re-verify. The buyer may still have a step to complete — 3D Secure, a hosted enrollment, linking a bank account — so poll the setup intent's status endpoint for what to do next.
    ///
    /// Required permissions:
    ///  - `payment:charge`
    ///  - `member:basic:read`
    ///  - `member:email:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.setupIntents.create(request: CreateSetupIntentsRequest.createSetupIntentsRequestConfirmationToken(
    ///         CreateSetupIntentsRequestConfirmationToken(
    ///             companyId: "biz_xxxxxxxxxxxxxx",
    ///             confirmationToken: "ctok_xxxxxxxxxxxxxx"
    ///         )
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter request: Parameters for CreateSetupIntent
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: CreateSetupIntentsRequest, requestOptions: RequestOptions? = nil) async throws -> CreateSetupIntentsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/setup_intents",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateSetupIntentsResponse.self
        )
    }

    /// Retrieves the details of an existing setup intent.
    ///
    /// Required permissions:
    ///  - `payment:setup_intent:read`
    ///  - `member:basic:read`
    ///  - `member:email:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.setupIntents.retrieve(id: "sint_xxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the setup intent.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> SetupIntent {
        return try await httpClient.performRequest(
            method: .get,
            path: "/setup_intents/\(id)",
            requestOptions: requestOptions,
            responseType: SetupIntent.self
        )
    }

    /// Changes where the buyer lands after completing an off-site step, up until they return. Accepts either a secret key or the setup's own `client_secret`, so the surface that knows the final destination can set it.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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

    /// Retrieves how far a setup has got and what the buyer must do next, if anything. Collection runs in the background, so poll this rather than reading the create response. Accepts either a secret key or the setup's own `client_secret`, so the surface collecting the payment method can poll it directly.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.setupIntents.retrieveStatus(setupIntentId: "setup_intent_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter setupIntentId: The unique identifier of the setup intent.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieveStatus(setupIntentId: String, requestOptions: RequestOptions? = nil) async throws -> SetupStatus {
        return try await httpClient.performRequest(
            method: .get,
            path: "/setup_intents/\(setupIntentId)/status",
            requestOptions: requestOptions,
            responseType: SetupStatus.self
        )
    }
}