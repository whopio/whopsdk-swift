import Foundation

public final class TopupsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Add funds to a company's platform balance by charging a stored payment method. Top-ups have no fees or taxes and do not count as revenue.
    ///
    /// Required permissions:
    ///  - `payment:charge`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.topups.create(request: .init(
    ///         amount: 6.9,
    ///         companyId: "biz_xxxxxxxxxxxxxx",
    ///         currency: .usd,
    ///         paymentMethodId: "pmt_xxxxxxxxxxxxxx"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateTopupsRequest, requestOptions: RequestOptions? = nil) async throws -> Topup {
        return try await httpClient.performRequest(
            method: .post,
            path: "/topups",
            body: request,
            requestOptions: requestOptions,
            responseType: Topup.self
        )
    }
}