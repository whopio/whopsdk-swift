import Foundation

public final class ReservesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists what the account's held balance is made of, one entry per currency: the total held, why each part is held, and the days it unlocks.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.accounts.reserves.list(accountId: "account_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Account ID, prefixed `biz_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String, requestOptions: RequestOptions? = nil) async throws -> ListReservesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/accounts/\(accountId)/reserves",
            requestOptions: requestOptions,
            responseType: ListReservesResponse.self
        )
    }
}