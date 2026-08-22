import Foundation

public final class BusinessesClient: Sendable {
    public let earnings: EarningsClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.earnings = EarningsClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the businesses the authenticated user referred onto Whop, most recent first.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.partners.businesses.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter status: Filter by referral status.
    /// - Parameter hasEarnings: When true, only businesses with pending or completed earnings paid to the caller.
    /// - Parameter first: Number of partner businesses to return from the start of the window.
    /// - Parameter after: Cursor to fetch the page after (from page_info.end_cursor).
    /// - Parameter last: Number of partner businesses to return from the end of the window.
    /// - Parameter before: Cursor to fetch the page before (from page_info.start_cursor).
    /// - Parameter order: The field to sort partner businesses by.
    /// - Parameter direction: Sort direction.
    /// - Parameter createdBefore: Only return partner businesses created before this timestamp.
    /// - Parameter createdAfter: Only return partner businesses created after this timestamp.
    /// - Parameter referredUserId: Filter to referrals attributed to this user. For first-tier referrals, this is the referred account owner; for second-tier referrals, this is the partner you recruited.
    /// - Parameter referredUsername: Filter by the referred user's exact username. Ignored when `referred_user_id` is present.
    /// - Parameter tier: Filter to only first-tier referrals or only second-tier referrals.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(status: ListBusinessesRequestStatus? = nil, hasEarnings: Bool? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, order: ListBusinessesRequestOrder? = nil, direction: ListBusinessesRequestDirection? = nil, createdBefore: String? = nil, createdAfter: String? = nil, referredUserId: String? = nil, referredUsername: String? = nil, tier: ListBusinessesRequestTier? = nil, requestOptions: RequestOptions? = nil) async throws -> ListBusinessesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/partners/businesses",
            queryParams: [
                "status": status.map { .string($0.rawValue) }, 
                "has_earnings": hasEarnings.map { .bool($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "referred_user_id": referredUserId.map { .string($0) }, 
                "referred_username": referredUsername.map { .string($0) }, 
                "tier": tier.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListBusinessesResponse.self
        )
    }

    /// Retrieves a single referred business and its referral terms.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.partners.businesses.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The partner business ID (a coma_ identifier).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> RetrieveBusinessesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/partners/businesses/\(id)",
            requestOptions: requestOptions,
            responseType: RetrieveBusinessesResponse.self
        )
    }
}