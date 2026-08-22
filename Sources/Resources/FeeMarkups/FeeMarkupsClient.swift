import Foundation

public final class FeeMarkupsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of fee markups configured for a company. If the company is a platform account, returns the platform default markups.
    ///
    /// Required permissions:
    ///  - `company:update_child_fees`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.feeMarkups.list(
    ///         first: 42,
    ///         last: 42,
    ///         companyId: "biz_xxxxxxxxxxxxxx"
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
    /// - Parameter companyId: The unique identifier of the company to list fee markups for. Pass a platform account identifier to retrieve platform default markups.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, companyId: String, requestOptions: RequestOptions? = nil) async throws -> ListFeeMarkupsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/fee_markups",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "company_id": .string(companyId)
            ],
            requestOptions: requestOptions,
            responseType: ListFeeMarkupsResponse.self
        )
    }

    /// Create or update a fee markup for a company. If a markup for the specified fee type already exists, it will be updated with the new values.
    ///
    /// Required permissions:
    ///  - `company:update_child_fees`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.feeMarkups.create(request: .init(
    ///         companyId: "biz_xxxxxxxxxxxxxx",
    ///         feeType: .cryptoWithdrawalMarkup
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateFeeMarkupsRequest, requestOptions: RequestOptions? = nil) async throws -> FeeMarkup {
        return try await httpClient.performRequest(
            method: .post,
            path: "/fee_markups",
            body: request,
            requestOptions: requestOptions,
            responseType: FeeMarkup.self
        )
    }

    /// Delete a fee markup configuration for a company. This removes the custom fee override and reverts to the parent company's default fees.
    ///
    /// Required permissions:
    ///  - `company:update_child_fees`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.feeMarkups.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the fee markup to delete.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/fee_markups/\(id)",
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }
}