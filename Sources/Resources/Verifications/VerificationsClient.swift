import Foundation

public final class VerificationsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns verifications for an account, including their status and any required actions.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.verifications.list(accountId: "account_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Account or user ID whose verifications you want to list. Use a `biz_` account ID, or the caller's `user_` ID for personal verifications.
    /// - Parameter order: Field used to sort returned verifications.
    /// - Parameter direction: Sort direction for returned verifications.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String, order: ListVerificationsRequestOrder? = nil, direction: ListVerificationsRequestDirection? = nil, requestOptions: RequestOptions? = nil) async throws -> ListVerificationsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/verifications",
            queryParams: [
                "account_id": .string(accountId), 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListVerificationsResponse.self
        )
    }

    /// Starts a hosted verification session for an account or user, or returns the active session when one already exists. Any fields you include in the request body are used to prefill the session. Send `documents` (with `document_type`) to instead verify the person from identity documents included in this request — no hosted session involved. Send `share_token` to reuse a verification another Sumsub account has already completed for this person, instead of verifying them again. If the account already has an `approved` verification the request is rejected; unlink it first to start a new one.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.verifications.create(
    ///         accountId: "account_id",
    ///         request: CreateVerificationsRequestBody.individual(
    ///             CreateVerificationsRequestBodyIndividual(
    ///
    ///             )
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Account or user ID whose identity you want to verify. Use a `biz_` account ID for account verifications, or the caller's `user_` ID for personal verification.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(accountId: String, request: CreateVerificationsRequestBody, requestOptions: RequestOptions? = nil) async throws -> CreateVerificationsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/verifications",
            queryParams: [
                "account_id": .string(accountId)
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: CreateVerificationsResponse.self
        )
    }

    /// Returns verifications for an account, including their status and any required actions.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.verifications.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Verification profile ID, prefixed `idpf_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> RetrieveVerificationsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/verifications/\(id)",
            requestOptions: requestOptions,
            responseType: RetrieveVerificationsResponse.self
        )
    }

    /// Updates editable profile details or submits answers for items returned in `requested_information`. Once a verification is `approved` its profile details are locked and can no longer be edited.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.verifications.update(
    ///         id: "id",
    ///         request: UpdateVerificationsRequestBody.updateVerificationsRequestBodyPersonalAddress(
    ///             UpdateVerificationsRequestBodyPersonalAddress(
    ///
    ///             )
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Verification profile ID, prefixed `idpf_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: UpdateVerificationsRequestBody, requestOptions: RequestOptions? = nil) async throws -> UpdateVerificationsResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/verifications/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateVerificationsResponse.self
        )
    }
}