import Foundation

public final class PayoutMethodsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a list of active payout methods configured for a company, ordered by most recently created.
    ///
    /// Required permissions:
    ///  - `payout:destination:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.payoutMethods.listPayoutMethod(
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
    /// - Parameter companyId: The unique identifier of the company to list payout methods for.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func listPayoutMethod(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, companyId: String, requestOptions: RequestOptions? = nil) async throws -> ListPayoutMethodResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payout_methods",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "company_id": .string(companyId)
            ],
            requestOptions: requestOptions,
            responseType: ListPayoutMethodResponse.self
        )
    }

    /// Retrieves the details of an existing payout method.
    ///
    /// Required permissions:
    ///  - `payout:destination:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.payoutMethods.retrievePayoutMethod(id: "potk_xxxxxxxxxxxxx")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the payout method to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrievePayoutMethod(id: String, requestOptions: RequestOptions? = nil) async throws -> PayoutMethod {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payout_methods/\(id)",
            requestOptions: requestOptions,
            responseType: PayoutMethod.self
        )
    }
}