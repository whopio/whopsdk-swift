import Foundation

public final class PreferencesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Retrieves the account's preferences: a singleton settings document keyed by preference name.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.accounts.preferences.retrieve(accountId: "account_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Account ID, prefixed `biz_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(accountId: String, requestOptions: RequestOptions? = nil) async throws -> RetrievePreferencesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/accounts/\(accountId)/preferences",
            requestOptions: requestOptions,
            responseType: RetrievePreferencesResponse.self
        )
    }

    /// Updates the account's preferences. Each top-level key present in the body is replaced as a whole; omitted keys are left untouched. `ads_triple_whale_integration` takes the Data-In API key to connect with, or `null` to disconnect. `ads_payment_methods` always requires a `primary` entry. `backup` is optional and any pairing is allowed — two cards, `card`+`platform_balance`, or a single method — so a card-only advertiser can fund ads without a platform balance. The `primary` and `backup` must be different sources. A `platform_balance` entry may omit `id` to use the account's default Whop balance. Configuring a `card` requires a user token; account API keys can set up platform-balance billing only.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.accounts.preferences.update(
    ///         accountId: "account_id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Account ID, prefixed `biz_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(accountId: String, request: Requests.UpdatePreferencesRequest, requestOptions: RequestOptions? = nil) async throws -> UpdatePreferencesResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/accounts/\(accountId)/preferences",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdatePreferencesResponse.self
        )
    }
}