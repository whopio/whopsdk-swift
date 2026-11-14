import Foundation

public final class LivestreamsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the livestreams in an experience, live and ended, newest first.
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
    ///     _ = try await client.livestreams.list(experienceId: "experience_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter experienceId: ID of a livestreams experience, prefixed `exp_`.
    /// - Parameter pinned: When `true`, only pinned livestreams, most recently pinned first. When `false`, only livestreams that are not pinned.
    /// - Parameter recorded: When `true`, only ended livestreams that were recorded, including recordings still processing. `false` or omitted lists every livestream.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(experienceId: String, pinned: Bool? = nil, recorded: Bool? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListLivestreamsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/livestreams",
            queryParams: [
                "experience_id": .string(experienceId), 
                "pinned": pinned.map { .bool($0) }, 
                "recorded": recorded.map { .bool($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListLivestreamsResponse.self
        )
    }

    /// Retrieves a livestream by ID.
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
    ///     _ = try await client.livestreams.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Livestream ID, prefixed `lfeed_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Livestream {
        return try await httpClient.performRequest(
            method: .get,
            path: "/livestreams/\(id)",
            requestOptions: requestOptions,
            responseType: Livestream.self
        )
    }

    /// Pins an ended livestream's recording so everyone in the experience sees it featured. Pinning it again keeps the original `pinned_at`.
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
    ///     _ = try await client.livestreams.pin(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Livestream ID, prefixed `lfeed_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pin(id: String, requestOptions: RequestOptions? = nil) async throws -> Livestream {
        return try await httpClient.performRequest(
            method: .post,
            path: "/livestreams/\(id)/pin",
            requestOptions: requestOptions,
            responseType: Livestream.self
        )
    }

    /// Unpins a livestream's recording so it is no longer featured in the experience.
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
    ///     _ = try await client.livestreams.unpin(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Livestream ID, prefixed `lfeed_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func unpin(id: String, requestOptions: RequestOptions? = nil) async throws -> Livestream {
        return try await httpClient.performRequest(
            method: .post,
            path: "/livestreams/\(id)/unpin",
            requestOptions: requestOptions,
            responseType: Livestream.self
        )
    }
}