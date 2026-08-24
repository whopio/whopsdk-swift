import Foundation

public final class AccountLinksClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Generate a URL that directs a sub-merchant to their account portal, such as the hosted payouts dashboard or the KYC onboarding flow.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.accountLinks.create(request: .init(
    ///         companyId: "biz_xxxxxxxxxxxxxx",
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