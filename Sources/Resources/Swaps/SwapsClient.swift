import Foundation

public final class SwapsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the completed or pending swaps for an account or user — currently only the most recent one.
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
    ///     _ = try await client.swaps.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Business account whose swaps to list, prefixed `biz_`. Provide this or `user_id`.
    /// - Parameter userId: The caller's own user ID, prefixed `user_`, to list swaps in their personal account. Provide this or `account_id`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, userId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListSwapsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/swaps",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListSwapsResponse.self
        )
    }

    /// Swaps one token for another in an account or user's wallet, or converts between their fiat balances. Crypto swaps finish in the background — retrieve the swap to follow its status.
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
    ///     _ = try await client.swaps.create(request: .init(
    ///         fromToken: "usd",
    ///         toToken: "cad"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateSwapsRequest, requestOptions: RequestOptions? = nil) async throws -> CreateSwapsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/swaps",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateSwapsResponse.self
        )
    }

    /// Previews the price of a swap before you create it. A fiat pair quotes the same rate creating the swap fills at; name the account with `account_id` or `user_id` to quote the rate for that account. No funds move, nothing is saved, and no authentication is required unless you name an account.
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
    ///     _ = try await client.swaps.createQuote(request: .init(
    ///         amount: "100",
    ///         fromToken: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    ///         toToken: "0x1b64b9025eebb9a6239575df9ea4b9ac46d4d193"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func createQuote(request: Requests.CreateQuoteSwapsRequest, requestOptions: RequestOptions? = nil) async throws -> CreateQuoteSwapsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/swaps/quote",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateQuoteSwapsResponse.self
        )
    }

    /// Retrieves a swap and its status. Poll it after creating a crypto swap, which finishes in the background.
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
    ///     _ = try await client.swaps.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Swap ID returned from POST /swaps.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> RetrieveSwapsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/swaps/\(id)",
            requestOptions: requestOptions,
            responseType: RetrieveSwapsResponse.self
        )
    }
}