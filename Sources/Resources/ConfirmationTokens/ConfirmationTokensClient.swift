import Foundation

public final class ConfirmationTokensClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Retrieves a confirmation token's payment method and billing details, never the underlying payment credential, to display what the buyer chose or check that the token is still usable. Requires no authentication and is rate-limited.
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
    ///     _ = try await client.confirmationTokens.retrieve(
    ///         id: "id",
    ///         accountId: "account_id"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Confirmation token ID, prefixed `ctok_`.
    /// - Parameter accountId: The account the token was minted for, prefixed `biz_`. It must match the token's account.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, accountId: String, requestOptions: RequestOptions? = nil) async throws -> ConfirmationToken {
        return try await httpClient.performRequest(
            method: .get,
            path: "/confirmation_tokens/\(id)",
            queryParams: [
                "account_id": .string(accountId)
            ],
            requestOptions: requestOptions,
            responseType: ConfirmationToken.self
        )
    }
}