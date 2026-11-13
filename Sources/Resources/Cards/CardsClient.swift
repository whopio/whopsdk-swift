import Foundation

public final class CardsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the Whop cards of an account or user, including ones still being set up. Team members only see the cards assigned to them.
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
    ///     _ = try await client.cards.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The owning account ID (a biz_ identifier). Provide this or user_id.
    /// - Parameter userId: The owning user ID (a user_ identifier). Provide this or account_id.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, userId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListCardsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/cards",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListCardsResponse.self
        )
    }

    /// Issues a virtual card, or applies for card issuing. An account with no application files one here and gets back a `202`; call again to issue the card once it is approved. An account whose application was denied or canceled applies again the same way, replacing that application.
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
    ///     _ = try await client.cards.create(request: .init())
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateCardsRequest, requestOptions: RequestOptions? = nil) async throws -> CreateCardsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/cards",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateCardsResponse.self
        )
    }

    /// Retrieves a single card, including its `secrets` (card number, CVC, and PIN), which List Cards does not return.
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
    ///     _ = try await client.cards.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Card ID to retrieve, prefixed `icrd_`.
    /// - Parameter accountId: The owning account ID (a biz_ identifier). Provide this or user_id.
    /// - Parameter userId: The owning user ID (a user_ identifier). Provide this or account_id.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, accountId: String? = nil, userId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> RetrieveCardsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/cards/\(id)",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: RetrieveCardsResponse.self
        )
    }

    /// Updates, freezes, or cancels a card. Updating the card's name, billing address, or limits requires both `payout:account:update` and `company:balance:read`; a card's assigned holder may update their own card's pin and frozen state with any user token.
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
    ///     _ = try await client.cards.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Card ID to retrieve, prefixed `icrd_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateCardsRequest, requestOptions: RequestOptions? = nil) async throws -> UpdateCardsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/cards/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateCardsResponse.self
        )
    }
}