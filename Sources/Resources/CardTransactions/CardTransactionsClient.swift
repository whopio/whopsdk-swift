import Foundation

public final class CardTransactionsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists an account's card transactions, newest first. Defaults to the account the credential belongs to. Covers every card the owner has ever had, including canceled cards and spend that predates a re-application, and team members only see transactions on the cards assigned to them. Pass `transaction_ids` to fetch specific transactions instead of paging for them.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.cardTransactions.list(
    ///         transactionIds: [
    ///             "citx_xxxxxxxxxxxxxx"
    ///         ],
    ///         cardId: [
    ///             "icrd_xxxxxxxxxxxxxx"
    ///         ],
    ///         cardholderId: [
    ///             "user_xxxxxxxxxxxxxx"
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The account whose card transactions to list, prefixed `biz_`. Defaults to the credential's account.
    /// - Parameter transactionIds: Return only these card transactions, each prefixed `citx_`. Repeat the parameter, or pass one comma-separated value.
    /// - Parameter cardId: Return only transactions charged to these cards, each prefixed `icrd_`.
    /// - Parameter cardholderId: Return only transactions on cards assigned to these users, each prefixed `user_`.
    /// - Parameter status: Return only transactions with this status.
    /// - Parameter createdAfter: Return only transactions authorized at or after this ISO 8601 timestamp.
    /// - Parameter createdBefore: Return only transactions authorized at or before this ISO 8601 timestamp.
    /// - Parameter order: The field to sort by. Defaults to `created_at`.
    /// - Parameter direction: The sort direction. Defaults to `desc`.
    /// - Parameter first: The number of card transactions to return.
    /// - Parameter after: A cursor; returns card transactions after this position.
    /// - Parameter last: The number of card transactions to return, counting back from the end.
    /// - Parameter before: A cursor; returns card transactions before this position.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, transactionIds: [String]? = nil, cardId: [String]? = nil, cardholderId: [String]? = nil, status: ListCardTransactionsRequestStatus? = nil, createdAfter: String? = nil, createdBefore: String? = nil, order: ListCardTransactionsRequestOrder? = nil, direction: ListCardTransactionsRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListCardTransactionsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/card_transactions",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "transaction_ids": transactionIds.map { .stringArray($0) }, 
                "card_id": cardId.map { .stringArray($0) }, 
                "cardholder_id": cardholderId.map { .stringArray($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListCardTransactionsResponse.self
        )
    }

    /// Fetches a single card transaction by its `citx_` identifier. The owner defaults to the account the credential belongs to.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.cardTransactions.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The card transaction ID, prefixed `citx_`.
    /// - Parameter accountId: The account that owns the transaction, prefixed `biz_`. Defaults to the credential's account.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, accountId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> CardTransaction {
        return try await httpClient.performRequest(
            method: .get,
            path: "/card_transactions/\(id)",
            queryParams: [
                "account_id": accountId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: CardTransaction.self
        )
    }
}