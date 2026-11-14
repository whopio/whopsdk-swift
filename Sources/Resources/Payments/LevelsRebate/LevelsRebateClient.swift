import Foundation

public final class LevelsRebateClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns the part of its account's monthly Whop Levels rebate a card payment earned: the processing fee above its level's rate, once the month its fee posted in has closed. The rebate is paid to the account as one sum each month, so the payment's own amounts and fees never change.
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
    ///     _ = try await client.payments.levelsRebate.retrieve(paymentId: "payment_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter paymentId: The payment whose rebate to retrieve, prefixed `pay_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(paymentId: String, requestOptions: RequestOptions? = nil) async throws -> PaymentLevelsRebate {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payments/\(paymentId)/levels_rebate",
            requestOptions: requestOptions,
            responseType: PaymentLevelsRebate.self
        )
    }
}