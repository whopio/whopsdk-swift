import Foundation

public final class NotesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists a member's notes, newest first. Notes are visible to the account's team.
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
    ///     _ = try await client.members.notes.list(memberId: "member_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter memberId: The member the notes are about, prefixed `mber_`.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter includeTotalCount: Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(memberId: String, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, includeTotalCount: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> ListNotesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/members/\(memberId)/notes",
            queryParams: [
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "include_total_count": includeTotalCount.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListNotesResponse.self
        )
    }

    /// Adds a note to a member. Notes are visible to the account's team.
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
    ///     _ = try await client.members.notes.create(
    ///         memberId: "member_id",
    ///         request: .init(content: "Wants a call next week.")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter memberId: The member the notes are about, prefixed `mber_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(memberId: String, request: Requests.CreateNotesRequest, requestOptions: RequestOptions? = nil) async throws -> MemberNote {
        return try await httpClient.performRequest(
            method: .post,
            path: "/members/\(memberId)/notes",
            body: request,
            requestOptions: requestOptions,
            responseType: MemberNote.self
        )
    }
}