import Foundation

public final class BountySubmissionsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists bounty submissions visible to the credential — for a user token, the submissions they authored plus those on bounties they posted; for an account API key, the submissions on the account's bounties. For the anonymous view of one bounty's reviewed work, use the submissions list under the bounty instead.
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
    ///     _ = try await client.bountySubmissions.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Scope the list to submissions on this account's bounties (`biz_` tag). Requires read access to the account.
    /// - Parameter bountyId: Only submissions on this bounty (`bnty_` tag).
    /// - Parameter status: Filter by lifecycle state.
    /// - Parameter createdAfter: Only submissions created after this ISO 8601 timestamp.
    /// - Parameter createdBefore: Only submissions created before this ISO 8601 timestamp.
    /// - Parameter order: Sort field.
    /// - Parameter direction: Sort direction.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, bountyId: String? = nil, status: ListBountySubmissionsRequestStatus? = nil, createdAfter: String? = nil, createdBefore: String? = nil, order: ListBountySubmissionsRequestOrder? = nil, direction: ListBountySubmissionsRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListBountySubmissionsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/bounty_submissions",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "bounty_id": bountyId.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListBountySubmissionsResponse.self
        )
    }

    /// Creates a submission on a workforce bounty. Include a `deliverable` and the submission goes straight to review; create is the only step. For `data_capture` bounties, omit the deliverable: this starts a claimed attempt whose proof accumulates server-side, and `POST /bounty_submissions/:id/submit` sends it to review once complete. Requires a user credential — account API keys cannot author submissions.
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
    ///     _ = try await client.bountySubmissions.create(request: .init(bountyId: "bnty_xxxxxxxxxxxxxx"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateBountySubmissionsRequest, requestOptions: RequestOptions? = nil) async throws -> BountySubmission {
        return try await httpClient.performRequest(
            method: .post,
            path: "/bounty_submissions",
            body: request,
            requestOptions: requestOptions,
            responseType: BountySubmission.self
        )
    }

    /// Retrieves one bounty submission the credential can see — one the caller authored, or one on a bounty they posted or their account owns. Reading another member's work on an account's bounty takes `account_id`, the same way the list does.
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
    ///     _ = try await client.bountySubmissions.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The bounty submission to act on (`btys_` tag).
    /// - Parameter accountId: Read the submission as this account (`biz_` tag), scoping the lookup to its bounties rather than the caller's own work. Requires read access to the account. Without it the lookup covers only what the credential owns — the submissions the caller authored plus those on bounties they posted.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, accountId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> BountySubmission {
        return try await httpClient.performRequest(
            method: .get,
            path: "/bounty_submissions/\(id)",
            queryParams: [
                "account_id": accountId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: BountySubmission.self
        )
    }

    /// Cancels the caller's own active attempt on a bounty and discards any accumulated capture clips. Only the worker who started the attempt can cancel it — account API keys cannot.
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
    ///     _ = try await client.bountySubmissions.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The bounty submission to act on (`btys_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeleteBountySubmissionsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/bounty_submissions/\(id)",
            requestOptions: requestOptions,
            responseType: DeleteBountySubmissionsResponse.self
        )
    }

    /// Submits a claimed attempt for review. A livestream attempt needs an ended proof stream and can attach a `deliverable`; a data capture attempt instead needs enough validated clip time and takes no payload. Only the worker who started the attempt can submit it — account API keys cannot.
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
    ///     _ = try await client.bountySubmissions.submit(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The claimed attempt to submit for review (`btys_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func submit(id: String, request: Requests.SubmitBountySubmissionsRequest, requestOptions: RequestOptions? = nil) async throws -> BountySubmission {
        return try await httpClient.performRequest(
            method: .post,
            path: "/bounty_submissions/\(id)/submit",
            body: request,
            requestOptions: requestOptions,
            responseType: BountySubmission.self
        )
    }
}