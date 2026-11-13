import Foundation

public final class CompanyTokenTransactionsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists an account's token transactions, newest first.
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
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.companyTokenTransactions.list(
    ///         first: 42,
    ///         last: 42,
    ///         userId: "user_xxxxxxxxxxxxx",
    ///         accountId: "biz_xxxxxxxxxxxxxx"
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
    /// - Parameter userId: Filter transactions to only those involving this specific user.
    /// - Parameter accountId: The unique identifier of the company to list token transactions for.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, userId: String? = nil, transactionType: CompanyTokenTransactionTypes? = nil, accountId: String, requestOptions: RequestOptions? = nil) async throws -> ListCompanyTokenTransactionsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/company_token_transactions",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "user_id": userId.map { .string($0) }, 
                "transaction_type": transactionType.map { .string($0.rawValue) }, 
                "account_id": .string(accountId)
            ],
            requestOptions: requestOptions,
            responseType: ListCompanyTokenTransactionsResponse.self
        )
    }

    /// Creates a token transaction that adds, subtracts, or transfers tokens for a member of an account.
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
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.companyTokenTransactions.create(request: CreateCompanyTokenTransactionsRequest.transfer(
    ///         CreateCompanyTokenTransactionsRequestTransfer(
    ///             accountId: "biz_xxxxxxxxxxxxxx",
    ///             amount: 6.9,
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

    /// Retrieves a token transaction.
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
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
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