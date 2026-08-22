import Foundation

public final class BountiesClient: Sendable {
    public let submissions: SubmissionsClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.submissions = SubmissionsClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists bounties visible to the credential — for an account API key, the account's bounties including scheduled drafts; for a user token, the bounties the user can see and work.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.bounties.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Scope the list to this account (`biz_` tag). Requires read access to the account; account API keys may pass their own account or a connected account.
    /// - Parameter userId: List the bounties this user participated in (`user_` tag). Must be the authenticated user.
    /// - Parameter status: Filter by lifecycle state.
    /// - Parameter businessGoalType: Filter by the poster's declared goal. Bounties created before the goal taxonomy carry no goal and never match this filter.
    /// - Parameter country: Only bounties workable from this country, as an ISO 3166-1 alpha-2 code. Bounties with no country targeting are workable worldwide and always match.
    /// - Parameter experienceId: Only bounties posted to this forum experience, prefixed `exp_`. An unknown experience, or one outside the caller's scope, matches nothing.
    /// - Parameter query: Substring match on the bounty title or ID.
    /// - Parameter createdAfter: Only bounties created after this ISO 8601 timestamp.
    /// - Parameter createdBefore: Only bounties created before this ISO 8601 timestamp.
    /// - Parameter order: Sort field.
    /// - Parameter direction: Sort direction.
    /// - Parameter first: Number of bounties to return from the start of the window.
    /// - Parameter after: Cursor to paginate forwards from.
    /// - Parameter last: Number of bounties to return from the end of the window.
    /// - Parameter before: Cursor to paginate backwards from.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, userId: String? = nil, status: ListBountiesRequestStatus? = nil, businessGoalType: ListBountiesRequestBusinessGoalType? = nil, country: String? = nil, experienceId: String? = nil, query: String? = nil, createdAfter: String? = nil, createdBefore: String? = nil, order: ListBountiesRequestOrder? = nil, direction: ListBountiesRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListBountiesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/bounties",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "business_goal_type": businessGoalType.map { .string($0.rawValue) }, 
                "country": country.map { .string($0) }, 
                "experience_id": experienceId.map { .string($0) }, 
                "query": query.map { .string($0) }, 
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
            responseType: ListBountiesResponse.self
        )
    }

    /// Creates a bounty and escrows its reward pool. Publishes immediately, or as a scheduled draft when you set `publish_at`.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.bounties.create(request: .init(
    ///         description: "Record one continuous pass of a full interior detail, dash to trunk, on a customer vehicle.",
    ///         grossRewardAmount: 40,
    ///         title: "Record interior detailing passes"
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateBountiesRequest, requestOptions: RequestOptions? = nil) async throws -> Bounty {
        return try await httpClient.performRequest(
            method: .post,
            path: "/bounties",
            body: request,
            requestOptions: requestOptions,
            responseType: Bounty.self
        )
    }

    /// Retrieves a bounty by ID. Authentication is optional: a request with no credential reads the bounty when it is publicly visible — published or completed, and not restricted to a private experience's members. Bounties outside the caller's scope, and bounties not publicly visible to an anonymous caller, return `404`.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.bounties.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Bounty ID (`bnty_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Bounty {
        return try await httpClient.performRequest(
            method: .get,
            path: "/bounties/\(id)",
            requestOptions: requestOptions,
            responseType: Bounty.self
        )
    }

    /// Updates a bounty. A published bounty accepts title, description, and country targeting while it is still open with nothing under review. A scheduled (not-yet-published) draft additionally accepts the reward, winner slots, and schedule.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.bounties.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Bounty ID (`bnty_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateBountiesRequest, requestOptions: RequestOptions? = nil) async throws -> Bounty {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/bounties/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Bounty.self
        )
    }

    /// Cancels a bounty. With no in-flight work, it cancels immediately and refunds the funder. Otherwise it stops new submissions and cancels once the in-flight work resolves and pays out. Repeating the request is a no-op. A bounty that already paid out every slot returns `400`.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.bounties.cancel(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Bounty ID (`bnty_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func cancel(id: String, requestOptions: RequestOptions? = nil) async throws -> Bounty {
        return try await httpClient.performRequest(
            method: .post,
            path: "/bounties/\(id)/cancel",
            requestOptions: requestOptions,
            responseType: Bounty.self
        )
    }
}