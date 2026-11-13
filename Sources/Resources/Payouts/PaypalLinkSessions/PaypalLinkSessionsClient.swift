import Foundation

public final class PaypalLinkSessionsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Starts a Log in with PayPal session so PayPal itself can confirm the account holder owns a verified PayPal account. Send the holder to `authorize_url`; after they log in, PayPal returns them to Whop, and Whop redirects the browser to your `return_url` with a `paypal_link_token` query parameter to pass to `POST /payouts/methods`. If the login fails or is canceled, `return_url` receives an `error` query parameter (`paypal_login_canceled` or `paypal_login_failed`) instead. The payout method saved this way pays the email on the PayPal account, and its holder name must match the name on the account's payout setup. PayPal login is rolling out per account: until it is enabled for the account this answers `403 forbidden`, and `supports_paypal_login` on `GET /payouts/supported_methods` is false.
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
    ///     _ = try await client.payouts.paypalLinkSessions.create(request: .init(
    ///         returnUrl: "https://example.com/settings/payouts",
    ///         supportedPayoutMethodId: "podst_xxxxxxxxxxxxxx"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreatePaypalLinkSessionsRequest, requestOptions: RequestOptions? = nil) async throws -> CreatePaypalLinkSessionsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/payouts/paypal_link_sessions",
            body: request,
            requestOptions: requestOptions,
            responseType: CreatePaypalLinkSessionsResponse.self
        )
    }
}