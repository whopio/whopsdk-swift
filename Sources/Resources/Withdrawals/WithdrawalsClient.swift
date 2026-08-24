import Foundation

public final class WithdrawalsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of withdrawals for a company, with optional sorting and date filtering.
    ///
    /// Required permissions:
    ///  - `payout:withdrawal:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.withdrawals.list(
    ///         first: 42,
    ///         last: 42,
    ///         companyId: "biz_xxxxxxxxxxxxxx",
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
    /// - Parameter companyId: The unique identifier of the company to list withdrawals for.
    /// - Parameter createdBefore: Only return withdrawals created before this timestamp.
    /// - Parameter createdAfter: Only return withdrawals created after this timestamp.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, companyId: String, direction: Direction? = nil, createdBefore: Date? = nil, createdAfter: Date? = nil, requestOptions: RequestOptions? = nil) async throws -> ListWithdrawalsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/withdrawals",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "company_id": .string(companyId), 
                "direction": direction.map { .string($0.rawValue) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "created_after": createdAfter.map { .date($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListWithdrawalsResponse.self
        )
    }

    /// Creates a withdrawal request for a ledger account
    ///
    /// Required permissions:
    ///  - `payout:withdraw_funds`
    ///  - `payout:destination:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.withdrawals.create(request: .init(
    ///         amount: 6.9,
    ///         companyId: "biz_xxxxxxxxxxxxxx",
    ///         currency: .usd
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateWithdrawalsRequest, requestOptions: RequestOptions? = nil) async throws -> Withdrawal {
        return try await httpClient.performRequest(
            method: .post,
            path: "/withdrawals",
            body: request,
            requestOptions: requestOptions,
            responseType: Withdrawal.self
        )
    }

    /// Retrieves the details of an existing withdrawal.
    ///
    /// Required permissions:
    ///  - `payout:withdrawal:read`
    ///  - `payout:destination:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.withdrawals.retrieve(id: "wdrl_xxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the withdrawal to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Withdrawal {
        return try await httpClient.performRequest(
            method: .get,
            path: "/withdrawals/\(id)",
            requestOptions: requestOptions,
            responseType: Withdrawal.self
        )
    }

    /// Generates a withdrawal PDF invoice and returns a temporary download URL.
    ///
    /// Required permissions:
    ///  - `payout:withdrawal:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.withdrawals.generatePdf(id: "wdrl_xxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the withdrawal to generate a PDF for.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func generatePdf(id: String, requestOptions: RequestOptions? = nil) async throws -> GeneratePdfWithdrawalsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/withdrawals/\(id)/generate_pdf",
            requestOptions: requestOptions,
            responseType: GeneratePdfWithdrawalsResponse.self
        )
    }
}