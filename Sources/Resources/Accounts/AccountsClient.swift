import Foundation

public final class AccountsClient: Sendable {
    public let preferences: PreferencesClient
    public let reserves: ReservesClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.preferences = PreferencesClient(config: config)
        self.reserves = ReservesClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists accounts visible to the credential. User tokens return the user's business accounts; Account API keys return the requesting account and its connected accounts. Pass `parent_account_id` to return only that parent account's connected accounts.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.accounts.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter first: The number of accounts to return (default 10, max 50).
    /// - Parameter after: A cursor; returns accounts after this position.
    /// - Parameter last: The number of accounts to return from the end of the range.
    /// - Parameter before: A cursor; returns accounts before this position.
    /// - Parameter order: The field to sort accounts by. `volume` requires `stats:read` on the parent account.
    /// - Parameter direction: Sort direction.
    /// - Parameter status: Return only accounts with this status: `active` (includes accounts that have not entered payments review) or `suspended`.
    /// - Parameter query: Free-text filter on account title or ID. `%` and `_` match literally.
    /// - Parameter createdAfter: Return only accounts created after this ISO 8601 timestamp.
    /// - Parameter createdBefore: Return only accounts created before this ISO 8601 timestamp.
    /// - Parameter volumeMin: Return only accounts whose lifetime USD volume is at least this value. Requires `stats:read` on the parent account.
    /// - Parameter volumeMax: Return only accounts whose lifetime USD volume is at most this value. Requires `stats:read` on the parent account.
    /// - Parameter parentAccountId: For platforms: the parent account ID whose direct connected accounts to return. Requires `payout:account:read` on the parent account.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, order: ListAccountsRequestOrder? = nil, direction: ListAccountsRequestDirection? = nil, status: ListAccountsRequestStatus? = nil, query: String? = nil, createdAfter: Date? = nil, createdBefore: Date? = nil, volumeMin: Double? = nil, volumeMax: Double? = nil, parentAccountId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListAccountsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/accounts",
            queryParams: [
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "status": status.map { .string($0.rawValue) }, 
                "query": query.map { .string($0) }, 
                "created_after": createdAfter.map { .date($0) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "volume_min": volumeMin.map { .double($0) }, 
                "volume_max": volumeMax.map { .double($0) }, 
                "parent_account_id": parentAccountId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListAccountsResponse.self
        )
    }

    /// Creates an account. User tokens create business accounts; Account API keys create connected accounts. Tax fields (`tax_remitted_by`, `tax_type`, `product_tax_code_id`, `business_address`, `tax_identifiers`) are configured with Update Account, not at creation.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.accounts.create(request: .init())
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateAccountsRequest, requestOptions: RequestOptions? = nil) async throws -> Account {
        return try await httpClient.performRequest(
            method: .post,
            path: "/accounts",
            body: request,
            requestOptions: requestOptions,
            responseType: Account.self
        )
    }

    /// Retrieves the account associated with the current Account API key.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.accounts.me()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func me(requestOptions: RequestOptions? = nil) async throws -> Account {
        return try await httpClient.performRequest(
            method: .get,
            path: "/accounts/me",
            requestOptions: requestOptions,
            responseType: Account.self
        )
    }

    /// Retrieves a single account by ID or public route when it is visible to the credential, including its crypto wallet. The reserved id `me` retrieves the account associated with the current Account API key; user tokens have no single account, so they must address one by ID or route.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.accounts.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Account ID, prefixed `biz_`, its public route, or `me` for the account associated with the current API key.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Account {
        return try await httpClient.performRequest(
            method: .get,
            path: "/accounts/\(id)",
            requestOptions: requestOptions,
            responseType: Account.self
        )
    }

    /// Updates an account. User tokens can update business accounts; Account API keys can update connected accounts. The reserved id `me` — accepted on Retrieve Account — resolves to the requesting account, which an Account API key cannot edit, so updates must name the connected account by its `biz_` id.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.accounts.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Account ID, prefixed `biz_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateAccountsRequest, requestOptions: RequestOptions? = nil) async throws -> Account {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/accounts/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Account.self
        )
    }

    /// Starts an LLC or C-Corp formation for a business account. Defaults to an LLC; set `entity_type` to `c_corp` to form a C-Corp, which additionally requires `share_structure` and officer `roles` on every founder. On submission, the application is validated and the response returns a hosted checkout URL. Once paid, the filing is submitted. Track progress through the account's [`company_formation`](/api-reference/beta/accounts/retrieve-account) field on Retrieve Account.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.accounts.formCompany(
    ///         id: "id",
    ///         request: .init(
    ///             businessAddress: FormCompanyAccountsRequestBusinessAddress(
    ///                 city: "Austin",
    ///                 country: "US",
    ///                 line1: "4180 Burnet Rd",
    ///                 line2: "Suite 2",
    ///                 postalCode: "78756",
    ///                 state: "TX"
    ///             ),
    ///             businessName: "Shine Time Auto Detailing",
    ///             businessPhone: "+15125550142",
    ///             businessType: "brick_and_mortar",
    ///             businessWebsite: "https://shinetime.example",
    ///             entitySuffix: .llc,
    ///             entityType: .llc,
    ///             expediteEin: true,
    ///             formationState: .tx,
    ///             founders: [
    ///                 FormCompanyAccountsRequestFoundersItem(
    ///                     address: FormCompanyAccountsRequestFoundersItemAddress(
    ///                         city: "Austin",
    ///                         country: "US",
    ///                         line1: "907 Ridgemont Dr",
    ///                         line2: "Apt 4",
    ///                         postalCode: "78704",
    ///                         state: "TX"
    ///                     ),
    ///                     dateOfBirth: "1988-03-14",
    ///                     email: "marcus@shinetime.example",
    ///                     firstName: "Marcus",
    ///                     isPrimary: true,
    ///                     lastName: "Webb",
    ///                     ownershipPercentage: 100,
    ///                     phone: "+15125550142",
    ///                     roles: [
    ///                         .president
    ///                     ],
    ///                     ssn: "123-45-6789"
    ///                 )
    ///             ],
    ///             industryGroup: "automotive",
    ///             industryType: "car_wash",
    ///             shareStructure: FormCompanyAccountsRequestShareStructure(
    ///                 numberOfShares: 123,
    ///                 value: 123
    ///             ),
    ///             useRegisteredAgent: true
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Account ID, prefixed `biz_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func formCompany(id: String, request: Requests.FormCompanyAccountsRequest, requestOptions: RequestOptions? = nil) async throws -> FormCompanyAccountsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/accounts/\(id)/form_company",
            body: request,
            requestOptions: requestOptions,
            responseType: FormCompanyAccountsResponse.self
        )
    }

    /// Transfers ownership of the account to another user, identified by user ID or email address. If the recipient already holds the owner role, ownership moves immediately; otherwise they get an invite and ownership moves when they accept.
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.accounts.transferOwnership(
    ///         id: "id",
    ///         request: .init(identifier: "marcus@shinetime.example")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Account ID, prefixed `biz_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func transferOwnership(id: String, request: Requests.TransferOwnershipAccountsRequest, requestOptions: RequestOptions? = nil) async throws -> TransferOwnershipAccountsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/accounts/\(id)/transfer_ownership",
            body: request,
            requestOptions: requestOptions,
            responseType: TransferOwnershipAccountsResponse.self
        )
    }
}