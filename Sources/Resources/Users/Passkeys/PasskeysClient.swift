import Foundation

public final class PasskeysClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the authenticated user's own passkeys, newest first. You cannot read another user's passkeys. Requires a user session: an API key or an OAuth token is refused, because a passkey confirms the account holder before a sensitive action and no app may enumerate one.
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
    ///     _ = try await client.users.passkeys.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter order: The field to sort passkeys by.
    /// - Parameter direction: Sort direction.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, order: ListPasskeysRequestOrder? = nil, direction: ListPasskeysRequestDirection? = nil, requestOptions: RequestOptions? = nil) async throws -> ListPasskeysResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/me/passkeys",
            queryParams: [
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListPasskeysResponse.self
        )
    }

    /// Registers a passkey for the authenticated user from the attestation a browser produced for a `registration` challenge. Mint that challenge first with `POST /users/me/passkeys/challenge` and run the ceremony with its `creation_options`; it is single-use and expires 5 minutes after it is issued. Send back the `user_handle` the options carried; a registration without it is refused. Registering replaces the account's passkeys made before Whop issued options, which can only be deleted. Requires a user session that has completed step-up verification.
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
    ///     _ = try await client.users.passkeys.create(request: .init(
    ///         attestationObject: "YXR0ZXN0YXRpb24",
    ///         clientDataJson: "Y2xpZW50LWRhdGE",
    ///         credentialId: "bmV3LWNyZWRlbnRpYWw",
    ///         nickname: "Work laptop",
    ///         userHandle: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreatePasskeysRequest, requestOptions: RequestOptions? = nil) async throws -> Passkey {
        return try await httpClient.performRequest(
            method: .post,
            path: "/users/me/passkeys",
            body: request,
            requestOptions: requestOptions,
            responseType: Passkey.self
        )
    }

    /// Mints the challenge and WebAuthn options a browser needs to run a ceremony against the authenticated user's own passkeys. A `registration` challenge enrolls a new passkey; a `deletion` challenge is bound to the one passkey named by `passkey_id` and proves the user still holds it. The options are in wire snake_case: convert the keys to camelCase before passing them to the browser. Challenges are single-use and expire 5 minutes after they are issued, so send a fresh `Idempotency-Key` per ceremony — a replayed key returns the original challenge, which may already have expired. Requires a user session. A `registration` challenge also requires step-up verification, so the user completes it before the browser ceremony.
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
    ///     _ = try await client.users.passkeys.challenge(request: .init(challengeType: .registration))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func challenge(request: Requests.ChallengePasskeysRequest, requestOptions: RequestOptions? = nil) async throws -> PasskeyChallenge {
        return try await httpClient.performRequest(
            method: .post,
            path: "/users/me/passkeys/challenge",
            body: request,
            requestOptions: requestOptions,
            responseType: PasskeyChallenge.self
        )
    }

    /// Deletes one of the authenticated user's own passkeys. The request body carries a WebAuthn assertion from the passkey being deleted, so possession of the credential is proven before it is removed: mint a `deletion` challenge for it first, run the ceremony with that passkey, and send the result here. Deleting the user's last passkey is allowed — their other step-up factors remain. Requires a user session.
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
    ///     _ = try await client.users.passkeys.delete(
    ///         id: "id",
    ///         request: .init(
    ///             authenticatorData: "YXV0aGVudGljYXRvci1kYXRh",
    ///             clientDataJson: "Y2xpZW50LWRhdGE",
    ///             signature: "c2lnbmF0dXJl"
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Passkey ID, prefixed `wcred_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, request: Requests.DeletePasskeysRequest, requestOptions: RequestOptions? = nil) async throws -> DeletePasskeysResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/users/me/passkeys/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: DeletePasskeysResponse.self
        )
    }
}