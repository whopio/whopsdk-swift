import Foundation

public final class DepositsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns the deposit methods for an account or user, including crypto addresses, bank transfer instructions, and, for a business, a hosted deposit page. Bitcoin deposits are converted to USDT on Plasma in the destination's wallet. Business destinations require no authentication. Pass `payment_method_id` to also charge a business's saved payment method for `amount` in USD and add it to the business's balance; that requires authentication with the `payment:charge` scope. The charge has no fees or taxes and does not count as revenue.
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
    ///     _ = try await client.deposits.create(request: .init(destination: "biz_xxxxxxxxxxxxxx"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateDepositsRequest, requestOptions: RequestOptions? = nil) async throws -> CreateDepositsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/deposits",
            body: request,
            requestOptions: requestOptions,
            responseType: CreateDepositsResponse.self
        )
    }

    /// Sends a deposit back where it came from. If the available balance doesn't cover it, nothing is sent.
    ///
    /// - **Bank deposit:** pass its `vbt_` ID. The deposit fee is returned, so the balance only has to cover the rest. Returns a `topup_reversal` row.
    /// - **Card deposit:** pass its `pay_` ID. It's refunded to the card, and its fees aren't returned. Returns a `payment_refund` row.
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
    ///     _ = try await client.deposits.reverse(
    ///         id: "vbt_xxxxxxxxxxxxxx",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: A bank deposit ID, prefixed `vbt_`, or a card deposit's payment ID, prefixed `pay_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func reverse(id: String, request: Requests.ReverseDepositsRequest, requestOptions: RequestOptions? = nil) async throws -> LedgerActivity {
        return try await httpClient.performRequest(
            method: .post,
            path: "/deposits/\(id)/reverse",
            body: request,
            requestOptions: requestOptions,
            responseType: LedgerActivity.self
        )
    }
}