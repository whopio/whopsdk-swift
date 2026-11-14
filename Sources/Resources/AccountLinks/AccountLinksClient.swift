import Foundation

public final class AccountLinksClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Generates a URL that sends a sub-merchant to a hosted Whop page, such as the payouts dashboard or the KYC onboarding flow. Requires an API key.
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
    ///     _ = try await client.accountLinks.create(request: .init(
    ///         accountId: "biz_xxxxxxxxxxxxxx",
    ///         refreshUrl: "refresh_url",
    ///         returnUrl: "return_url",
    ///         useCase: .accountOnboarding
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateAccountLinksRequest, requestOptions: RequestOptions? = nil) async throws -> AccountLink {
        return try await httpClient.performRequest(
            method: .post,
            path: "/account_links",
            body: request,
            requestOptions: requestOptions,
            responseType: AccountLink.self
        )
    }
}