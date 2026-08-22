import Foundation

public final class SwapsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Retrieve the account's completed or pending swaps — currently just the latest one.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.swaps.list(accountId: "account_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Business or user account ID (biz_* / user_*).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String, requestOptions: RequestOptions? = nil) async throws -> ListSwapsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/swaps",
            queryParams: [
                "account_id": .string(accountId)
            ],
            requestOptions: requestOptions,
            responseType: ListSwapsResponse.self
        )
    }

    /// Swaps one token for another from the account's wallet, or converts between fiat currencies in the account's ledger at the mid-market rate. Crypto swaps finish in the background — check the swap for its status.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.swaps.create(request: .init(
    ///         accountId: "biz_xxxxxxxxxxxxxx",
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

    /// Previews the price of a swap. Fiat pairs quote the in-ledger mid-market conversion — the same rate creating the swap fills at. No funds move and nothing is saved.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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

    /// Retrieves a single swap and its status.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
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