import Foundation

public final class RefundsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of refunds, with optional filtering by payment, company, user, and creation date.
    ///
    /// Required permissions:
    ///  - `payment:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.refunds.list(
    ///         first: 42,
    ///         last: 42,
    ///         paymentId: "pay_xxxxxxxxxxxxxx",
    ///         companyId: "biz_xxxxxxxxxxxxxx",
    ///         userId: "user_xxxxxxxxxxxxx",
    ///         createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
    ///         createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter after: Returns the elements in the list that come after the specified cursor.
    /// - Parameter before: Returns the elements in the list that come before the specified cursor.
    /// - Parameter first: Returns the first _n_ elements from the list.
    /// - Parameter last: Returns the last _n_ elements from the list.
    /// - Parameter paymentId: Filter refunds to only those associated with this specific payment.
    /// - Parameter companyId: Filter refunds to only those belonging to this company.
    /// - Parameter userId: Filter refunds to only those associated with this specific user.
    /// - Parameter createdBefore: Only return refunds created before this timestamp.
    /// - Parameter createdAfter: Only return refunds created after this timestamp.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, paymentId: String? = nil, companyId: String? = nil, userId: String? = nil, direction: Direction? = nil, createdBefore: Date? = nil, createdAfter: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> ListRefundsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/refunds",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "payment_id": paymentId.map { .string($0) }, 
                "company_id": companyId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "created_after": createdAfter.map { .date($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListRefundsResponse.self
        )
    }

    /// Retrieves the details of an existing refund.
    ///
    /// Required permissions:
    ///  - `payment:basic:read`
    ///  - `plan:basic:read`
    ///  - `access_pass:basic:read`
    ///  - `member:email:read`
    ///  - `member:basic:read`
    ///  - `member:phone:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.refunds.retrieve(id: "rf_xxxxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the refund.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Refund {
        return try await httpClient.performRequest(
            method: .get,
            path: "/refunds/\(id)",
            requestOptions: requestOptions,
            responseType: Refund.self
        )
    }
}