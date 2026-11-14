import Foundation

public final class VerificationsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the verifications for an account or user, including their status and any required actions. Platforms list their own and every subaccount's verifications at once with `include_subaccounts`; each one's `account_ids` names its account, and a verification shared by several accounts appears once for each.
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
    ///     _ = try await client.verifications.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Business account whose verifications you want to list, prefixed `biz_`. Provide this or `user_id`.
    /// - Parameter userId: The caller's own user ID, prefixed `user_`, to list personal verifications. Provide this or `account_id`.
    /// - Parameter includeSubaccounts: Also cover the account's subaccounts. Requires `account_id`, and is a 400 without it. Lists the verifications of the account and every subaccount in account order, oldest account first, paging forward; `status`, `order`, `direction`, `last` and `before` are a 400. Leaves out removed subaccounts and ones you can't read verifications on. A page can hold fewer than `first` verifications while `has_next_page` is `true`; keep following `end_cursor`. On a subaccount, lists only that account's verifications.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter order: Field used to sort returned verifications.
    /// - Parameter direction: Sort direction for returned verifications.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, userId: String? = nil, includeSubaccounts: Bool? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, order: ListVerificationsRequestOrder? = nil, direction: ListVerificationsRequestDirection? = nil, requestOptions: RequestOptions? = nil) async throws -> ListVerificationsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/verifications",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }, 
                "include_subaccounts": includeSubaccounts.map { .bool($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListVerificationsResponse.self
        )
    }

    /// Starts a hosted verification session for an account or user, or returns the active session when one already exists; any fields you send prefill it. To skip the hosted session, send `documents` to verify the person from files in this request, `share_token` to reuse a verification another Sumsub account completed, or `verification_id` to reuse one the signed-in user completed on Whop. For a business, `documents` and `owners` add company formation documents and owners to the verification, and once everything is in this call sends the business for review — call it again after Update Verification to send it. Until then it stays `pending` and the hosted session collects anything left out. Once the account has an `approved` verification, every mode except `verification_id` is rejected — unlink it first to start a new one.
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
    ///     _ = try await client.verifications.create(request: CreateVerificationsRequestBody.individual(
    ///         CreateVerificationsRequestBodyIndividual(
    ///
    ///         )
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Business account whose identity you want to verify, prefixed `biz_`. Provide this or `user_id`.
    /// - Parameter userId: The caller's own user ID, prefixed `user_`, for a personal verification. Provide this or `account_id`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(accountId: String? = nil, userId: String? = nil, request: CreateVerificationsRequestBody, requestOptions: RequestOptions? = nil) async throws -> CreateVerificationsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/verifications",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: CreateVerificationsResponse.self
        )
    }

    /// Retrieves a verification by ID, including its status and any information or documents still required.
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

    /// Updates editable profile details or submits answers for items returned in `requested_information`. On a business verification still collecting details, company details, `documents`, and `owners` also go to the verification provider; call Create Verification again to send the business for review once everything is in. Under review, `registration_number`, `incorporation_date`, `place_of_incorporation`, and `documents` are refused. While the review waits on owners, owners can still be added, changed, or removed with `remove`; otherwise only an owner's missing documents can still be sent. Once a verification is `approved` its profile details are locked and can no longer be edited.
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