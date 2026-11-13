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
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
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

    /// Updates the account's preferences. Each top-level key in the body replaces its stored value as a whole. Keys left out keep their current values.
    ///
    /// The required scope depends on which preferences you update.
    ///
    /// - `ad_campaign:create`: `ads_payment_methods`, `ads_reporting_currency`, `ads_scheduling_timezone`, `ads_triple_whale_integration`.
    /// - `payout:account:update`: `cards_auto_top_up`, `cards_notifications`, `covers_subaccount_negative_balances`.
    /// - `payment:dispute`: `dispute_fighter_enabled`.
    /// - `company:update`: `economic_intelligence_duration_key`, `economic_intelligence_auto_renew`, `review_request_emails`, `cancellation_emails`, `renewal_reminder_emails`, `failed_payment_emails`, `subaccount_notifications`, `subaccount_team_view_only`.
    /// - `company:manage_checkout`: `feedback_options`, `customer_tracking`.
    ///
    /// To update keys under more than one scope, the API key needs all of those scopes.
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