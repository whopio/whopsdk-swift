import Foundation

public final class CompanyTokenTransactionsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of token transactions for a user or company, depending on the authenticated actor, with optional filtering by user and transaction type.
    ///
    /// Required permissions:
    ///  - `company_token_transaction:read`
    ///  - `member:basic:read`
    ///  - `company:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.companyTokenTransactions.list(
    ///         first: 42,
    ///         last: 42,
    ///         companyId: "biz_xxxxxxxxxxxxxx",
    ///         userId: "user_xxxxxxxxxxxxx"
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
    /// - Parameter companyId: The unique identifier of the company to list token transactions for.
    /// - Parameter userId: Filter transactions to only those involving this specific user.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, companyId: String, userId: String? = nil, transactionType: CompanyTokenTransactionTypes? = nil, requestOptions: RequestOptions? = nil) async throws -> ListCompanyTokenTransactionsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/company_token_transactions",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "company_id": .string(companyId), 
                "user_id": userId.map { .string($0) }, 
                "transaction_type": transactionType.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListCompanyTokenTransactionsResponse.self
        )
    }

    /// Create a token transaction to add, subtract, or transfer tokens for a member within a company.
    ///
    /// Required permissions:
    ///  - `company_token_transaction:create`
    ///  - `member:basic:read`
    ///  - `company:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.companyTokenTransactions.create(request: CreateCompanyTokenTransactionsRequest.transfer(
    ///         CreateCompanyTokenTransactionsRequestTransfer(
    ///             amount: 6.9,
    ///             companyId: "biz_xxxxxxxxxxxxxx",
    ///             destinationUserId: "destination_user_id",
    ///             userId: "user_xxxxxxxxxxxxx"
    ///         )
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter request: Parameters for CreateCompanyTokenTransaction
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: CreateCompanyTokenTransactionsRequest, requestOptions: RequestOptions? = nil) async throws -> CompanyTokenTransaction {
        return try await httpClient.performRequest(
            method: .post,
            path: "/company_token_transactions",
            body: request,
            requestOptions: requestOptions,
            responseType: CompanyTokenTransaction.self
        )
    }

    /// Retrieves the details of an existing company token transaction.
    ///
    /// Required permissions:
    ///  - `company_token_transaction:read`
    ///  - `member:basic:read`
    ///  - `company:basic:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.companyTokenTransactions.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the token transaction to retrieve.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> CompanyTokenTransaction {
        return try await httpClient.performRequest(
            method: .get,
            path: "/company_token_transactions/\(id)",
            requestOptions: requestOptions,
            responseType: CompanyTokenTransaction.self
        )
    }
}