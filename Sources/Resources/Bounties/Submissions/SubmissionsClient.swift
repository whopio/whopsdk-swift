import Foundation

public final class SubmissionsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists a bounty's publicly visible work — submitted, approved, and denied submissions in the reduced public shape. Authentication is optional; a bounty that is not publicly visible returns `404`.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.bounties.submissions.list(bountyId: "bounty_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter bountyId: The bounty whose public submissions to list (`bnty_` tag).
    /// - Parameter status: Filter by lifecycle state.
    /// - Parameter createdAfter: Only submissions created after this ISO 8601 timestamp.
    /// - Parameter createdBefore: Only submissions created before this ISO 8601 timestamp.
    /// - Parameter order: Sort field.
    /// - Parameter direction: Sort direction.
    /// - Parameter first: Number of submissions to return from the start of the window.
    /// - Parameter after: Cursor to paginate forwards from.
    /// - Parameter last: Number of submissions to return from the end of the window.
    /// - Parameter before: Cursor to paginate backwards from.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(bountyId: String, status: ListSubmissionsRequestStatus? = nil, createdAfter: String? = nil, createdBefore: String? = nil, order: ListSubmissionsRequestOrder? = nil, direction: ListSubmissionsRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListSubmissionsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/bounties/\(bountyId)/submissions",
            queryParams: [
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
            responseType: ListSubmissionsResponse.self
        )
    }

    /// Retrieves one of a bounty's publicly visible submissions in the reduced public shape — the read behind a shared proof link, whose submission is usually outside the bounty page's capped preview. Authentication is optional; a bounty that is not publicly visible, and a submission that is not publicly visible work on it, both return `404`.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.bounties.submissions.retrieve(
    ///         bountyId: "bounty_id",
    ///         id: "id"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter bountyId: The bounty the submission belongs to (`bnty_` tag).
    /// - Parameter id: The submission to retrieve (`btys_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(bountyId: String, id: String, requestOptions: RequestOptions? = nil) async throws -> PublicBountySubmission {
        return try await httpClient.performRequest(
            method: .get,
            path: "/bounties/\(bountyId)/submissions/\(id)",
            requestOptions: requestOptions,
            responseType: PublicBountySubmission.self
        )
    }
}