import Foundation

public final class UsersFeesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Retrieves the fees charged when the user moves money with their personal balance: withdrawals, transfers, bank deposits, and funding cards from pending balance. Each fee has the same shape as in Retrieve Account Fees. You can only retrieve your own fees, and they are read-only.
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
    ///     _ = try await client.users.fees.retrieve(userId: "user_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter userId: `me`, or the authenticated user's own `user_` tag or username.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(userId: String, requestOptions: RequestOptions? = nil) async throws -> UserFees {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/\(userId)/fees",
            requestOptions: requestOptions,
            responseType: UserFees.self
        )
    }
}