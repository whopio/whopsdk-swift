import Foundation

public final class SearchClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Searches one account's records in one call. `account` rows are `account_id` itself and, when you send `include_subaccounts`, its subaccounts; every other row belongs to one of those accounts.
    ///
    /// Each `object` needs its own read permission on the record's account, and rows you can't read are left out without an error: `account` (`biz_`, `company:basic:read`), `member` (`mber_`, `member:basic:read`), `membership` (`mem_`, `member:basic:read`), `payment` (`pay_`, `payment:basic:read`), `affiliate` (`aff_`, `affiliate:basic:read`), `review` (`rev_`, `company:basic:read`), `resolution_center_case` (`reso_`, `payment:resolution_center_case:read`) and `promo_code` (`promo_`, `promo_code:basic:read`). A query containing `@` also needs `member:email:read`, and a phone match `member:phone:read`. An invoice's number finds the invoice as its `payment`.
    ///
    /// `query` is trimmed and has to be 2 to 250 characters; a full card number returns a `400`. `data` comes identifier matches first, such as a pasted ID, email address, card digits or invoice number, newest first within each kind of match. Every query of 3 or more characters is also ranked, and ranked rows follow, best match first. Each record appears once, and `match_reason` says why it matched. [Search](/api-reference/search/search) lists the query shapes and match reasons.
    ///
    /// `first` caps the rows, 20 by default and up to 100. There is no cursor yet, so the response is a single page. Search ranks; to filter one resource or page through every match, use its list endpoint, such as `GET /payments?query=`.
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
    ///     _ = try await client.search.list(
    ///         query: "query",
    ///         accountId: "account_id"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter query: Text to search for, 2 to 250 characters.
    /// - Parameter types: Kinds of records to search. Defaults to every kind. `account` rows are `account_id` itself and, with `include_subaccounts`, its subaccounts.
    /// - Parameter accountId: The account to search, prefixed `biz_`. Records other than accounts belong to it, or with `include_subaccounts` to its subaccounts. Your credential needs read access to at least one kind of record on it that search returns, or the account is a 404.
    /// - Parameter includeSubaccounts: `true` also searches the subaccounts of a platform `account_id`: an ID, an email, card digits or a phone number finds their records, and the subaccounts themselves are found as `account` rows by name, ID or store link, or by the email of their owner, a team member or a customer. Safe to send for any account: one without subaccounts is searched as if this were false.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(query: String, types: [ListSearchRequestTypesItem]? = nil, accountId: String, includeSubaccounts: Bool? = nil, first: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ListSearchResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/search",
            queryParams: [
                "query": .string(query), 
                "types": types.map { .unknown($0) }, 
                "account_id": .string(accountId), 
                "include_subaccounts": includeSubaccounts.map { .bool($0) }, 
                "first": first.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListSearchResponse.self
        )
    }
}