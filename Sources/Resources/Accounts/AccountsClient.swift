import Foundation

public final class AccountsClient: Sendable {
    public let customerTracking: CustomerTrackingClient
    public let fees: FeesClient
    public let financingProviders: FinancingProvidersClient
    public let preferences: PreferencesClient
    public let reserves: ReservesClient
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.customerTracking = CustomerTrackingClient(config: config)
        self.fees = FeesClient(config: config)
        self.financingProviders = FinancingProvidersClient(config: config)
        self.preferences = PreferencesClient(config: config)
        self.reserves = ReservesClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists accounts visible to the credential. User tokens return the user's business accounts; Account API keys return the requesting account and its subaccounts.
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
    ///     _ = try await client.accounts.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter order: The field to sort accounts by. `volume` requires `stats:read` on the parent account.
    /// - Parameter direction: Sort direction.
    /// - Parameter status: Return only accounts with this status: `active` (includes accounts that have not entered payments review) or `suspended`.
    /// - Parameter query: Free-text filter on account title or ID. `%` and `_` match literally.
    /// - Parameter createdAfter: Return only accounts created after this ISO 8601 timestamp.
    /// - Parameter createdBefore: Return only accounts created before this ISO 8601 timestamp.
    /// - Parameter externalId: Return only the subaccount with this `external_id`, matched exactly and case-sensitively. End it with `%` to return every subaccount whose `external_id` starts with the text before it, such as `shopline:%`. `%` is accepted only at the end, because anywhere else it would scan all your subaccounts. `_` always matches literally.
    /// - Parameter volumeMin: Return only accounts whose lifetime USD volume is at least this value. Requires `stats:read` on the parent account.
    /// - Parameter volumeMax: Return only accounts whose lifetime USD volume is at most this value. Requires `stats:read` on the parent account.
    /// - Parameter parentAccountId: For platforms: the parent account ID whose direct subaccounts to return. Requires `payout:account:read` on the parent account.
    /// - Parameter ownerId: Return only accounts owned by this user (`user_...`), the account's `owner`. Cannot be combined with `parent_account_id`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, order: ListAccountsRequestOrder? = nil, direction: ListAccountsRequestDirection? = nil, status: ListAccountsRequestStatus? = nil, query: String? = nil, createdAfter: Date? = nil, createdBefore: Date? = nil, externalId: String? = nil, volumeMin: Double? = nil, volumeMax: Double? = nil, parentAccountId: String? = nil, ownerId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListAccountsResponse {
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
                "external_id": externalId.map { .string($0) }, 
                "volume_min": volumeMin.map { .double($0) }, 
                "volume_max": volumeMax.map { .double($0) }, 
                "parent_account_id": parentAccountId.map { .string($0) }, 
                "owner_id": ownerId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListAccountsResponse.self
        )
    }

    /// Creates an account. User tokens create business accounts; Account API keys create subaccounts. Tax fields (`tax_remitted_by`, `tax_type`, `product_tax_code_id`, `business_address`, `tax_identifiers`) are configured with Update Account, not at creation.
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
    ///     let client = Whop(
    ///         baseURL: "https://api.whop.com/api/v1",
    ///         token: "<token>"
    ///     )
    ///
    ///     _ = try await client.accounts.me()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter includeTrading: Also return the trading account under `trading`: its address, a snapshot of its margin and open positions, and its Hyperliquid WebSocket subscriptions. Requires crypto_wallet:trade:read, crypto_wallet:trade, or crypto_wallet:manage permission and an Ethereum wallet. Otherwise `trading` is `null`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func me(includeTrading: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> Account {
        return try await httpClient.performRequest(
            method: .get,
            path: "/accounts/me",
            queryParams: [
                "include_trading": includeTrading.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: Account.self
        )
    }

    /// Finds accounts by name among the accounts the credential can list. Support searches cover every company and return only the 50 best matches.
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
    ///     _ = try await client.accounts.search(query: "query")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter query: The account name to search for.
    /// - Parameter order: Sort field. Without it, support searches return the best match first and other searches return the newest account first.
    /// - Parameter direction: Sort direction.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func search(first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, query: String, order: SearchAccountsRequestOrder? = nil, direction: SearchAccountsRequestDirection? = nil, requestOptions: RequestOptions? = nil) async throws -> SearchAccountsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/accounts/search",
            queryParams: [
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "query": .string(query), 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: SearchAccountsResponse.self
        )
    }

    /// Retrieves an account visible to the credential by ID or public route, including its crypto wallet.
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
    ///     _ = try await client.accounts.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Account ID, prefixed `biz_`, its public route, or `me` for the account associated with the current Account API key. User tokens have no single account, so they cannot use `me`.
    /// - Parameter includeTrading: Also return the trading account under `trading`: its address, a snapshot of its margin and open positions, and its Hyperliquid WebSocket subscriptions. Requires crypto_wallet:trade:read, crypto_wallet:trade, or crypto_wallet:manage permission and an Ethereum wallet. Otherwise `trading` is `null`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, includeTrading: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> Account {
        return try await httpClient.performRequest(
            method: .get,
            path: "/accounts/\(id)",
            queryParams: [
                "include_trading": includeTrading.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: Account.self
        )
    }

    /// Deletes a subaccount directly owned by the authenticated platform account. The account must have no settled, pending, or reserved balance in any currency and no active, trialing, or past-due memberships. The account stops resolving immediately, and its products, plans, and team access are removed in the background; payment history is retained. Deletion cannot be undone through the API. This cannot delete the platform account itself or an account owned by another platform.
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
    ///     _ = try await client.accounts.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Subaccount ID, prefixed `biz_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeleteAccountsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/accounts/\(id)",
            requestOptions: requestOptions,
            responseType: DeleteAccountsResponse.self
        )
    }

    /// Updates an account. User tokens can update business accounts; Account API keys can update subaccounts.
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
    ///     _ = try await client.accounts.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Account ID, prefixed `biz_`. The reserved id `me` resolves to the requesting account, which an Account API key cannot edit.
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

    /// Starts an LLC or C-Corp formation for a business account. The application is validated and the response returns a hosted checkout URL; once paid, the filing is submitted. Track progress through the account's [`company_formation`](/api-reference/accounts/retrieve-account) field on Retrieve Account.
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
    ///             businessWebsite: "https://shinetime.example",
    ///             entitySuffix: .llc,
    ///             entityType: .llc,
    ///             expediteEin: true,
    ///             formationState: .wy,
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

    /// Queues one background retry of the account's failed ads payments across its campaigns, using the account's configured ads payment methods. A queued response does not mean payment succeeded; read each campaign's `delivery_status` and `issues` for the outcome. Successful settlement clears the payment block without changing a configured `active` or `paused` status; a legacy `payment_failed` status becomes `paused`. Returns an error when the account has no failed ads payments, or while a previous retry for the account is queued or running.
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
    ///     _ = try await client.accounts.retryAdsPayment(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Account ID, prefixed `biz_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retryAdsPayment(id: String, requestOptions: RequestOptions? = nil) async throws -> RetryAdsPaymentAccountsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/accounts/\(id)/retry_ads_payment",
            requestOptions: requestOptions,
            responseType: RetryAdsPaymentAccountsResponse.self
        )
    }

    /// Suspends a subaccount directly owned by the authenticated platform account. This cannot suspend the platform account itself or an account owned by another platform.
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
    ///     _ = try await client.accounts.suspend(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Subaccount ID, prefixed `biz_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func suspend(id: String, requestOptions: RequestOptions? = nil) async throws -> Account {
        return try await httpClient.performRequest(
            method: .post,
            path: "/accounts/\(id)/suspend",
            requestOptions: requestOptions,
            responseType: Account.self
        )
    }

    /// Transfers ownership of the account to another user, identified by user ID or email address. If the recipient already holds the owner role, ownership moves immediately; otherwise they get an invite and ownership moves when they accept. The Whop CLI and MCP can hand off a business their user owns as a partner (`as_partner: true`) with the `partner:handoff` scope; other OAuth apps cannot transfer ownership.
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