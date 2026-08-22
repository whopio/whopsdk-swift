import Foundation

public final class PartnersClient: Sendable {
    public let businesses: BusinessesClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.businesses = BusinessesClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Enrolls the calling user in the Whop partner program, making their partner businesses eligible for earnings. Idempotent — enrolling again keeps the original enrollment time.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.partners.create()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(requestOptions: RequestOptions? = nil) async throws -> CreatePartnersResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/partners",
            requestOptions: requestOptions,
            responseType: CreatePartnersResponse.self
        )
    }

    /// Ranks referrers by partner business earnings — all-time by default, or over the current day, month, year, or trailing 30 days. Authentication is optional: authenticated callers also get their own standing, anonymous callers get the rankings alone.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.partners.leaderboard()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter period: Time window for the rankings. `day`, `month`, and `year` count earnings since the start of the current calendar day, month, or year; `last_30_days` counts earnings over the trailing 30 days; `all_time` ranks lifetime earnings.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func leaderboard(period: LeaderboardPartnersRequestPeriod? = nil, requestOptions: RequestOptions? = nil) async throws -> LeaderboardPartnersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/partners/leaderboard",
            queryParams: [
                "period": period.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: LeaderboardPartnersResponse.self
        )
    }

    /// Lists the users the caller referred onto Whop (newest first), each with the second-tier earnings the caller has made from that user's businesses.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.partners.referredUsers()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter hasBusinesses: When true, only referred users who brought at least one business onto Whop.
    /// - Parameter hasEarningBusinesses: When true, only referred users with at least one business that has generated earnings.
    /// - Parameter first: Number of referred users to return from the start of the window.
    /// - Parameter after: Cursor to fetch the page after (from page_info.end_cursor).
    /// - Parameter last: Number of referred users to return from the end of the window.
    /// - Parameter before: Cursor to fetch the page before (from page_info.start_cursor).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func referredUsers(hasBusinesses: Bool? = nil, hasEarningBusinesses: Bool? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ReferredUsersPartnersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/partners/referred_users",
            queryParams: [
                "has_businesses": hasBusinesses.map { .bool($0) }, 
                "has_earning_businesses": hasEarningBusinesses.map { .bool($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ReferredUsersPartnersResponse.self
        )
    }
}