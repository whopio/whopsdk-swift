import Foundation

public final class PaymentQuotesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Prices a purchase the way a payment for it will be charged. The body is the `PaymentInput` a payment takes plus where the buyer is, which a seller that collects no tax on the purchase can leave out. The purchase is priced from exactly what you send: no buyer is looked up, so no stored registration or purchase history applies. Pass the quote's `id` as `quote_id` when you create the payment to charge exactly the purchase, promo code, and tax shown here. A quote is priced once and may be consumed by one payment before `expires_at`. Cart entries must name existing variants with `variant_id`.
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
    ///     _ = try await client.paymentQuotes.create(request: .init(accountId: "biz_xxxxxxxxxxxxxx"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreatePaymentQuotesRequest, requestOptions: RequestOptions? = nil) async throws -> PaymentQuote {
        return try await httpClient.performRequest(
            method: .post,
            path: "/payment_quotes",
            body: request,
            requestOptions: requestOptions,
            responseType: PaymentQuote.self
        )
    }

    /// Retrieves a payment quote. Use it to check which payment holds the quote, through `payment_id`, and when it expires.
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
    ///     _ = try await client.paymentQuotes.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The payment quote ID, prefixed `pq_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> PaymentQuote {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payment_quotes/\(id)",
            requestOptions: requestOptions,
            responseType: PaymentQuote.self
        )
    }
}