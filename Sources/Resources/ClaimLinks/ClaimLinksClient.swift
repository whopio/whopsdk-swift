import Foundation

public final class ClaimLinksClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Retrieves a funded claim link by ID or by its public claim code. By ID, the caller needs `airdrop_link:basic:read` on the funding account, or must own the funding personal account; `code` and `claim_url` are `null` without `airdrop_link:manage` on the funding account or `payout:withdraw_funds` on the personal account. A claim code previews the sender, amount, expiry, and claim availability without authentication. Treat codes as secrets: anyone holding one can claim after signing in.
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
    ///     _ = try await client.claimLinks.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: A claim-link ID (`airdrp_…`), or the public claim code from the `c` parameter in the claim URL.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> RetrieveClaimLinksResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/claim_links/\(id)",
            requestOptions: requestOptions,
            responseType: RetrieveClaimLinksResponse.self
        )
    }

    /// Claims a funded link into the authenticated user's personal balance and returns the updated link. Requires a signed-in user and the public claim code; account API keys cannot claim on a recipient's behalf. Each user can claim a link once. Reuse the same `Idempotency-Key` when retrying the same request. On-chain claims may take several minutes to complete.
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
    ///     _ = try await client.claimLinks.claim(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The public claim code from the `c` parameter in the claim URL. A claim-link ID does not authorize redemption.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func claim(id: String, requestOptions: RequestOptions? = nil) async throws -> ClaimClaimLinksResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/claim_links/\(id)/claim",
            requestOptions: requestOptions,
            responseType: ClaimClaimLinksResponse.self
        )
    }
}