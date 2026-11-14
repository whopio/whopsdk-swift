# Reference
## AccessTokens
<details><summary><code>client.accessTokens.<a href="/Sources/Resources/AccessTokens/AccessTokensClient.swift">create</a>(request: Requests.CreateAccessTokensRequest, requestOptions: RequestOptions?) -> AccessToken</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a short-lived access token for Whop's web and mobile embedded components. With API key authentication, pass `account_id` or `user_id`; with OAuth, the token is issued for the OAuth user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.accessTokens.create(request: .init())
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateAccessTokensRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## AccountLinks
<details><summary><code>client.accountLinks.<a href="/Sources/Resources/AccountLinks/AccountLinksClient.swift">create</a>(request: Requests.CreateAccountLinksRequest, requestOptions: RequestOptions?) -> AccountLink</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Generates a URL that sends a sub-merchant to a hosted Whop page, such as the payouts dashboard or the KYC onboarding flow. Requires an API key.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.accountLinks.create(request: .init(
        accountId: "biz_xxxxxxxxxxxxxx",
        refreshUrl: "refresh_url",
        returnUrl: "return_url",
        useCase: .accountOnboarding
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateAccountLinksRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Accounts
<details><summary><code>client.accounts.<a href="/Sources/Resources/Accounts/AccountsClient.swift">list</a>(first: Int?, after: String?, last: Int?, before: String?, order: ListAccountsRequestOrder?, direction: ListAccountsRequestDirection?, status: ListAccountsRequestStatus?, query: String?, createdAfter: Date?, createdBefore: Date?, externalId: String?, volumeMin: Double?, volumeMax: Double?, parentAccountId: String?, ownerId: String?, requestOptions: RequestOptions?) -> ListAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists accounts visible to the credential. User tokens return the user's business accounts; Account API keys return the requesting account and its subaccounts.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.accounts.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListAccountsRequestOrder?` — The field to sort accounts by. `volume` requires `stats:read` on the parent account.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListAccountsRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListAccountsRequestStatus?` — Return only accounts with this status: `active` (includes accounts that have not entered payments review) or `suspended`.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Free-text filter on account title or ID. `%` and `_` match literally.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Return only accounts created after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Return only accounts created before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**externalId:** `String?` — Return only the subaccount with this `external_id`, matched exactly and case-sensitively. End it with `%` to return every subaccount whose `external_id` starts with the text before it, such as `shopline:%`. `%` is accepted only at the end, because anywhere else it would scan all your subaccounts. `_` always matches literally.
    
</dd>
</dl>

<dl>
<dd>

**volumeMin:** `Double?` — Return only accounts whose lifetime USD volume is at least this value. Requires `stats:read` on the parent account.
    
</dd>
</dl>

<dl>
<dd>

**volumeMax:** `Double?` — Return only accounts whose lifetime USD volume is at most this value. Requires `stats:read` on the parent account.
    
</dd>
</dl>

<dl>
<dd>

**parentAccountId:** `String?` — For platforms: the parent account ID whose direct subaccounts to return. Requires `payout:account:read` on the parent account.
    
</dd>
</dl>

<dl>
<dd>

**ownerId:** `String?` — Return only accounts owned by this user (`user_...`), the account's `owner`. Cannot be combined with `parent_account_id`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.accounts.<a href="/Sources/Resources/Accounts/AccountsClient.swift">create</a>(request: Requests.CreateAccountsRequest, requestOptions: RequestOptions?) -> Account</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates an account. User tokens create business accounts; Account API keys create subaccounts. Tax fields (`tax_remitted_by`, `tax_type`, `product_tax_code_id`, `business_address`, `tax_identifiers`) are configured with Update Account, not at creation.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.accounts.create(request: .init())
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateAccountsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.accounts.<a href="/Sources/Resources/Accounts/AccountsClient.swift">me</a>(includeTrading: Bool?, requestOptions: RequestOptions?) -> Account</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the account associated with the current Account API key.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.accounts.me()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**includeTrading:** `Bool?` — Also return the trading account under `trading`: its address, a snapshot of its margin and open positions, and its Hyperliquid WebSocket subscriptions. Requires crypto_wallet:trade:read, crypto_wallet:trade, or crypto_wallet:manage permission and an Ethereum wallet. Otherwise `trading` is `null`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.accounts.<a href="/Sources/Resources/Accounts/AccountsClient.swift">search</a>(first: Int?, after: String?, last: Int?, before: String?, query: String, order: SearchAccountsRequestOrder?, direction: SearchAccountsRequestDirection?, requestOptions: RequestOptions?) -> SearchAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Finds accounts by name among the accounts the credential can list. Support searches cover every company and return only the 50 best matches.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.accounts.search(query: "query")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String` — The account name to search for.
    
</dd>
</dl>

<dl>
<dd>

**order:** `SearchAccountsRequestOrder?` — Sort field. Without it, support searches return the best match first and other searches return the newest account first.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `SearchAccountsRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.accounts.<a href="/Sources/Resources/Accounts/AccountsClient.swift">retrieve</a>(id: String, includeTrading: Bool?, requestOptions: RequestOptions?) -> Account</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves an account visible to the credential by ID or public route, including its crypto wallet.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.accounts.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Account ID, prefixed `biz_`, its public route, or `me` for the account associated with the current Account API key. User tokens have no single account, so they cannot use `me`.
    
</dd>
</dl>

<dl>
<dd>

**includeTrading:** `Bool?` — Also return the trading account under `trading`: its address, a snapshot of its margin and open positions, and its Hyperliquid WebSocket subscriptions. Requires crypto_wallet:trade:read, crypto_wallet:trade, or crypto_wallet:manage permission and an Ethereum wallet. Otherwise `trading` is `null`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.accounts.<a href="/Sources/Resources/Accounts/AccountsClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> DeleteAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a subaccount directly owned by the authenticated platform account. The account must have no settled, pending, or reserved balance in any currency and no active, trialing, or past-due memberships. The account stops resolving immediately, and its products, plans, and team access are removed in the background; payment history is retained. Deletion cannot be undone through the API. This cannot delete the platform account itself or an account owned by another platform.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.accounts.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Subaccount ID, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.accounts.<a href="/Sources/Resources/Accounts/AccountsClient.swift">update</a>(id: String, request: Requests.UpdateAccountsRequest, requestOptions: RequestOptions?) -> Account</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an account. User tokens can update business accounts; Account API keys can update subaccounts.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.accounts.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Account ID, prefixed `biz_`. The reserved id `me` resolves to the requesting account, which an Account API key cannot edit.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateAccountsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.accounts.<a href="/Sources/Resources/Accounts/AccountsClient.swift">formCompany</a>(id: String, request: Requests.FormCompanyAccountsRequest, requestOptions: RequestOptions?) -> FormCompanyAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Starts an LLC or C-Corp formation for a business account. The application is validated and the response returns a hosted checkout URL; once paid, the filing is submitted. Track progress through the account's [`company_formation`](/api-reference/accounts/retrieve-account) field on Retrieve Account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.accounts.formCompany(
        id: "id",
        request: .init(
            businessAddress: FormCompanyAccountsRequestBusinessAddress(
                city: "Austin",
                country: "US",
                line1: "4180 Burnet Rd",
                line2: "Suite 2",
                postalCode: "78756",
                state: "TX"
            ),
            businessName: "Shine Time Auto Detailing",
            businessPhone: "+15125550142",
            businessWebsite: "https://shinetime.example",
            entitySuffix: .llc,
            entityType: .llc,
            expediteEin: true,
            formationState: .wy,
            founders: [
                FormCompanyAccountsRequestFoundersItem(
                    address: FormCompanyAccountsRequestFoundersItemAddress(
                        city: "Austin",
                        country: "US",
                        line1: "907 Ridgemont Dr",
                        line2: "Apt 4",
                        postalCode: "78704",
                        state: "TX"
                    ),
                    dateOfBirth: "1988-03-14",
                    email: "marcus@shinetime.example",
                    firstName: "Marcus",
                    isPrimary: true,
                    lastName: "Webb",
                    ownershipPercentage: 100,
                    phone: "+15125550142",
                    roles: [
                        .president
                    ],
                    ssn: "123-45-6789"
                )
            ],
            shareStructure: FormCompanyAccountsRequestShareStructure(
                numberOfShares: 123,
                value: 123
            ),
            useRegisteredAgent: true
        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Account ID, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.FormCompanyAccountsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.accounts.<a href="/Sources/Resources/Accounts/AccountsClient.swift">retryAdsPayment</a>(id: String, requestOptions: RequestOptions?) -> RetryAdsPaymentAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Queues one background retry of the account's failed ads payments across its campaigns, using the account's configured ads payment methods. A queued response does not mean payment succeeded; read each campaign's `delivery_status` and `issues` for the outcome. Successful settlement clears the payment block without changing a configured `active` or `paused` status; a legacy `payment_failed` status becomes `paused`. Returns an error when the account has no failed ads payments, or while a previous retry for the account is queued or running.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.accounts.retryAdsPayment(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Account ID, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.accounts.<a href="/Sources/Resources/Accounts/AccountsClient.swift">suspend</a>(id: String, requestOptions: RequestOptions?) -> Account</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Suspends a subaccount directly owned by the authenticated platform account. This cannot suspend the platform account itself or an account owned by another platform.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.accounts.suspend(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Subaccount ID, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.accounts.<a href="/Sources/Resources/Accounts/AccountsClient.swift">transferOwnership</a>(id: String, request: Requests.TransferOwnershipAccountsRequest, requestOptions: RequestOptions?) -> TransferOwnershipAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Transfers ownership of the account to another user, identified by user ID or email address. If the recipient already holds the owner role, ownership moves immediately; otherwise they get an invite and ownership moves when they accept. The Whop CLI and MCP can hand off a business their user owns as a partner (`as_partner: true`) with the `partner:handoff` scope; other OAuth apps cannot transfer ownership.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.accounts.transferOwnership(
        id: "id",
        request: .init(identifier: "marcus@shinetime.example")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Account ID, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.TransferOwnershipAccountsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Ad Campaigns
<details><summary><code>client.adCampaigns.<a href="/Sources/Resources/AdCampaigns/AdCampaignsClient.swift">list</a>(accountId: String?, status: ListAdCampaignsRequestStatus?, query: String?, order: ListAdCampaignsRequestOrder?, direction: ListAdCampaignsRequestDirection?, campaignType: ListAdCampaignsRequestCampaignType?, createdBefore: String?, createdAfter: String?, statsFrom: String?, statsTo: String?, timeZone: String?, attributionModel: ListAdCampaignsRequestAttributionModel?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListAdCampaignsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the ad campaigns for an account, with stats over the requested window.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adCampaigns.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — The account the campaigns belong to. Defaults to the account-scoped key's own account.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListAdCampaignsRequestStatus?` — Only return campaigns with this status.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Filter campaigns by a title or ID substring.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListAdCampaignsRequestOrder?` — The field to sort by. Defaults to created_at. Stat columns (spend, impressions, …) rank over the stats_from/stats_to window across the whole list, not just the current page. results, cost_per_result and return_on_ad_spend rank by the same Whop pixel-attributed values the response reports, and link_clicks by the same Whop pixel page views.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListAdCampaignsRequestDirection?` — The sort direction. Defaults to desc.
    
</dd>
</dl>

<dl>
<dd>

**campaignType:** `ListAdCampaignsRequestCampaignType?` — Only return campaigns of this type.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only return campaigns created before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only return campaigns created after this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**statsFrom:** `String?` — Start of the stats window. Defaults to all-time.
    
</dd>
</dl>

<dl>
<dd>

**statsTo:** `String?` — End of the stats window. Defaults to now.
    
</dd>
</dl>

<dl>
<dd>

**timeZone:** `String?` — IANA timezone (e.g. America/New_York) the stats window is interpreted in. Bare stats_from/stats_to dates resolve to day boundaries on this clock. Defaults to UTC.
    
</dd>
</dl>

<dl>
<dd>

**attributionModel:** `ListAdCampaignsRequestAttributionModel?` — Attribution model the conversion stats count under (defaults to last_touch). Under both models a journey with any whop ad touch attributes to whop; the model picks which whop touch credits the entity and which non-whop source wins otherwise.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.adCampaigns.<a href="/Sources/Resources/AdCampaigns/AdCampaignsClient.swift">create</a>(request: Requests.CreateAdCampaignsRequest, requestOptions: RequestOptions?) -> AdCampaign</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates an ad campaign in `draft` status for an account. Nothing runs until you launch it by setting `status` to `active` with `PATCH /ad_campaigns/:id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adCampaigns.create(request: .init(
        objective: .traffic,
        title: "Now hiring mobile detailers — Austin"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateAdCampaignsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.adCampaigns.<a href="/Sources/Resources/AdCampaigns/AdCampaignsClient.swift">retrieve</a>(id: String, statsFrom: String?, statsTo: String?, timeZone: String?, attributionModel: RetrieveAdCampaignsRequestAttributionModel?, requestOptions: RequestOptions?) -> AdCampaign</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a single ad campaign with stats over the requested window.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adCampaigns.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ad campaign ID.
    
</dd>
</dl>

<dl>
<dd>

**statsFrom:** `String?` — Start of the stats window.
    
</dd>
</dl>

<dl>
<dd>

**statsTo:** `String?` — End of the stats window.
    
</dd>
</dl>

<dl>
<dd>

**timeZone:** `String?` — IANA timezone the stats window is interpreted in. Defaults to UTC.
    
</dd>
</dl>

<dl>
<dd>

**attributionModel:** `RetrieveAdCampaignsRequestAttributionModel?` — Attribution model the conversion stats count under (defaults to last_touch). Under both models a journey with any whop ad touch attributes to whop; the model picks which whop touch credits the entity and which non-whop source wins otherwise.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.adCampaigns.<a href="/Sources/Resources/AdCampaigns/AdCampaignsClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> DeleteAdCampaignsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes an ad campaign with its ad groups and ads, and stops their delivery.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adCampaigns.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ad campaign ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.adCampaigns.<a href="/Sources/Resources/AdCampaigns/AdCampaignsClient.swift">update</a>(id: String, request: Requests.UpdateAdCampaignsRequest, requestOptions: RequestOptions?) -> AdCampaign</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an ad campaign's settings, or launches a draft campaign by setting `status` to `active`. The objective is fixed at creation and cannot be changed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adCampaigns.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ad campaign ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateAdCampaignsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.adCampaigns.<a href="/Sources/Resources/AdCampaigns/AdCampaignsClient.swift">claim</a>(id: String, requestOptions: RequestOptions?) -> AdCampaign</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Attributes the whole campaign and its daily budget to the calling user as its runner. One runner holds a campaign at a time. Takes the runner's Whop session, or a user API key with `ad_campaign:update`. The caller also needs active advertiser-supplier program access. Everyone else gets a 404. Returns 403 until the caller has verified their identity and added a phone number and a social account. Returns 403 when the claim would take the daily budget the caller holds past the limit for their score. Returns 409 when another user holds the campaign. Changes nothing when the caller already holds it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adCampaigns.claim(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ad campaign ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.adCampaigns.<a href="/Sources/Resources/AdCampaigns/AdCampaignsClient.swift">duplicate</a>(id: String, request: Requests.DuplicateAdCampaignsRequest, requestOptions: RequestOptions?) -> DuplicateAdCampaignsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates copies of the campaign in `duplicating` status and returns them; each copy transitions to `draft` once duplication completes. Poll each returned campaign until it leaves `duplicating` — a copy that could not be completed is deleted and returns 404.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adCampaigns.duplicate(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ad campaign ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.DuplicateAdCampaignsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.adCampaigns.<a href="/Sources/Resources/AdCampaigns/AdCampaignsClient.swift">pause</a>(id: String, requestOptions: RequestOptions?) -> AdCampaign</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Pauses an active ad campaign.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adCampaigns.pause(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ad campaign ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.adCampaigns.<a href="/Sources/Resources/AdCampaigns/AdCampaignsClient.swift">unpause</a>(id: String, requestOptions: RequestOptions?) -> AdCampaign</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Resumes a paused ad campaign. Requires an ads payment method on the account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adCampaigns.unpause(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ad campaign ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Ad Groups
<details><summary><code>client.adGroups.<a href="/Sources/Resources/AdGroups/AdGroupsClient.swift">list</a>(accountId: String?, adCampaignId: String?, adCampaignIds: [String]?, status: ListAdGroupsRequestStatus?, query: String?, order: ListAdGroupsRequestOrder?, direction: ListAdGroupsRequestDirection?, createdBefore: String?, createdAfter: String?, statsFrom: String?, statsTo: String?, timeZone: String?, attributionModel: ListAdGroupsRequestAttributionModel?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListAdGroupsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists ad groups for the account, newest first.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adGroups.list(adCampaignIds: [
        "adcamp_xxxxxxxxxxxxxx"
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Account whose ad groups to list. Defaults to the authenticated account.
    
</dd>
</dl>

<dl>
<dd>

**adCampaignId:** `String?` — Filter to ad groups in this campaign.
    
</dd>
</dl>

<dl>
<dd>

**adCampaignIds:** `[String]?` — Filter to ad groups in these campaigns (max 100). Repeat the parameter for each id (ad_campaign_ids=a&ad_campaign_ids=b).
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListAdGroupsRequestStatus?` — Filter to ad groups with this status.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Filter ad groups by a title or ID substring.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListAdGroupsRequestOrder?` — The field to sort by. Defaults to created_at. Stat columns (spend, impressions, …) rank over the stats_from/stats_to window across the whole list, not just the current page. results, cost_per_result and return_on_ad_spend rank by the same Whop pixel-attributed values the response reports, and link_clicks by the same Whop pixel page views.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListAdGroupsRequestDirection?` — The sort direction. Defaults to desc.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only return ad groups created before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only return ad groups created after this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**statsFrom:** `String?` — Start of the stats window. Defaults to all-time.
    
</dd>
</dl>

<dl>
<dd>

**statsTo:** `String?` — End of the stats window. Defaults to now.
    
</dd>
</dl>

<dl>
<dd>

**timeZone:** `String?` — IANA timezone (e.g. America/New_York) the stats window is interpreted in. Bare stats_from/stats_to dates resolve to day boundaries on this clock. Defaults to UTC.
    
</dd>
</dl>

<dl>
<dd>

**attributionModel:** `ListAdGroupsRequestAttributionModel?` — Attribution model the conversion stats count under (defaults to last_touch). Under both models a journey with any whop ad touch attributes to whop; the model picks which whop touch credits the entity and which non-whop source wins otherwise.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.adGroups.<a href="/Sources/Resources/AdGroups/AdGroupsClient.swift">create</a>(request: Requests.CreateAdGroupsRequest, requestOptions: RequestOptions?) -> AdGroup</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates an ad group (ad set) in a campaign.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adGroups.create(request: .init(adCampaignId: "adcamp_xxxxxxxxxxxxxx"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateAdGroupsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.adGroups.<a href="/Sources/Resources/AdGroups/AdGroupsClient.swift">retrieve</a>(id: String, statsFrom: String?, statsTo: String?, timeZone: String?, attributionModel: RetrieveAdGroupsRequestAttributionModel?, requestOptions: RequestOptions?) -> AdGroup</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves an ad group, with performance stats for the window set by `stats_from` and `stats_to`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adGroups.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ad group ID.
    
</dd>
</dl>

<dl>
<dd>

**statsFrom:** `String?` — Start of the stats window.
    
</dd>
</dl>

<dl>
<dd>

**statsTo:** `String?` — End of the stats window.
    
</dd>
</dl>

<dl>
<dd>

**timeZone:** `String?` — IANA timezone the stats window is interpreted in. Defaults to UTC.
    
</dd>
</dl>

<dl>
<dd>

**attributionModel:** `RetrieveAdGroupsRequestAttributionModel?` — Attribution model the conversion stats count under (defaults to last_touch). Under both models a journey with any whop ad touch attributes to whop; the model picks which whop touch credits the entity and which non-whop source wins otherwise.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.adGroups.<a href="/Sources/Resources/AdGroups/AdGroupsClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> DeleteAdGroupsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes an ad group and stops its delivery.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adGroups.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ad group ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.adGroups.<a href="/Sources/Resources/AdGroups/AdGroupsClient.swift">update</a>(id: String, request: Requests.UpdateAdGroupsRequest, requestOptions: RequestOptions?) -> AdGroup</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an ad group's editable fields. Only the keys you send are changed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adGroups.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ad group ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateAdGroupsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.adGroups.<a href="/Sources/Resources/AdGroups/AdGroupsClient.swift">duplicate</a>(id: String, request: Requests.DuplicateAdGroupsRequest, requestOptions: RequestOptions?) -> DuplicateAdGroupsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Starts copying an ad group and returns the copies in `duplicating` status. Poll each returned ad group until it leaves `duplicating`: it then takes the source's `active` or `paused` status, or, if the copy could not be completed, is deleted and returns 404.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adGroups.duplicate(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ad group ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.DuplicateAdGroupsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.adGroups.<a href="/Sources/Resources/AdGroups/AdGroupsClient.swift">pause</a>(id: String, requestOptions: RequestOptions?) -> AdGroup</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Pauses delivery of an ad group.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adGroups.pause(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ad group ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.adGroups.<a href="/Sources/Resources/AdGroups/AdGroupsClient.swift">unpause</a>(id: String, requestOptions: RequestOptions?) -> AdGroup</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Resumes delivery of a paused ad group.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adGroups.unpause(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ad group ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Ads
<details><summary><code>client.ads.<a href="/Sources/Resources/Ads/AdsClient.swift">reportIssues</a>(request: Requests.ReportIssuesAdsRequest, requestOptions: RequestOptions?) -> ReportIssuesAdsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Reports why one of a runner's ads or ad groups can't deliver yet, and replaces what the runner reported for it before. The account running the campaign sees each issue, with what to change when it can fix it. An empty `issues` list clears the object's issues, and they also clear when the runner stops holding the campaign. Takes the runner's Whop session, a user API key, or a user OAuth token with `ad_campaign:update`. A token without that scope gets a 403, and anyone not holding the whole campaign gets a 404.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.ads.reportIssues(request: .init(issues: [
        ReportIssuesAdsRequestIssuesItem(
            reason: .contentRejected
        )
    ]))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.ReportIssuesAdsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.ads.<a href="/Sources/Resources/Ads/AdsClient.swift">reportStats</a>(request: Requests.ReportStatsAdsRequest, requestOptions: RequestOptions?) -> AdStat</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Records a runner's stats for one of their ads in one hour, and pays them for the spend. Send the ad's totals so far for an hour that has started; they replace what the ad held for that hour, and its ad group's and campaign's hours are rebuilt from their ads. The spend can go up but never down. Hours before the runner's first report on the campaign can be reported too. The spend is recorded and paid exactly as sent, with no markup added, so send it with the runner's markup already applied. Takes the runner's Whop session, a user API key, or a user OAuth token with `ad_campaign:update`. A token without that scope gets a 403, and anyone not holding the ad's campaign gets a 404.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.ads.reportStats(request: .init(
        adId: "ad_xxxxxxxxxxxxxx",
        hourStartedAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601),
        spend: ReportStatsAdsRequestSpend.double(
            1.1
        )
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.ReportStatsAdsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.ads.<a href="/Sources/Resources/Ads/AdsClient.swift">list</a>(accountId: String?, adCampaignId: String?, adCampaignIds: [String]?, adGroupId: String?, adGroupIds: [String]?, status: ListAdsRequestStatus?, query: String?, order: ListAdsRequestOrder?, direction: ListAdsRequestDirection?, createdBefore: String?, createdAfter: String?, statsFrom: String?, statsTo: String?, timeZone: String?, attributionModel: ListAdsRequestAttributionModel?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListAdsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the ads for an account, with stats over the requested window.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.ads.list(
        adCampaignIds: [
            "adcamp_xxxxxxxxxxxxxx"
        ],
        adGroupIds: [
            "adgrp_xxxxxxxxxxxxxx"
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — The account the ads belong to. Defaults to the account-scoped key's own account.
    
</dd>
</dl>

<dl>
<dd>

**adCampaignId:** `String?` — Only return ads in this ad campaign.
    
</dd>
</dl>

<dl>
<dd>

**adCampaignIds:** `[String]?` — Only return ads in these ad campaigns (max 100). Repeat the parameter for each id (ad_campaign_ids=a&ad_campaign_ids=b).
    
</dd>
</dl>

<dl>
<dd>

**adGroupId:** `String?` — Only return ads in this ad group.
    
</dd>
</dl>

<dl>
<dd>

**adGroupIds:** `[String]?` — Only return ads in these ad groups (max 100). Repeat the parameter for each id (ad_group_ids=a&ad_group_ids=b).
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListAdsRequestStatus?` — Only return ads with this status.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Filter ads by a title or ID substring.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListAdsRequestOrder?` — The field to sort by. Defaults to created_at. Stat columns (spend, impressions, …) rank over the stats_from/stats_to window across the whole list, not just the current page. results, cost_per_result and return_on_ad_spend rank by the same Whop pixel-attributed values the response reports, and link_clicks by the same Whop pixel page views.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListAdsRequestDirection?` — The sort direction. Defaults to desc.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only return ads created before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only return ads created after this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**statsFrom:** `String?` — Start of the stats window. Defaults to all-time.
    
</dd>
</dl>

<dl>
<dd>

**statsTo:** `String?` — End of the stats window. Defaults to now.
    
</dd>
</dl>

<dl>
<dd>

**timeZone:** `String?` — IANA timezone (e.g. America/New_York) the stats window is interpreted in. Bare stats_from/stats_to dates resolve to day boundaries on this clock. Defaults to UTC.
    
</dd>
</dl>

<dl>
<dd>

**attributionModel:** `ListAdsRequestAttributionModel?` — Attribution model the conversion stats count under (defaults to last_touch). Under both models a journey with any whop ad touch attributes to whop; the model picks which whop touch credits the entity and which non-whop source wins otherwise.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.ads.<a href="/Sources/Resources/Ads/AdsClient.swift">create</a>(request: Requests.CreateAdsRequest, requestOptions: RequestOptions?) -> Ad</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates an ad in an ad group. Any campaign status other than `draft` launches the campaign, which requires an ads payment method on the account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.ads.create(request: .init())
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateAdsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.ads.<a href="/Sources/Resources/Ads/AdsClient.swift">retrieve</a>(id: String, statsFrom: String?, statsTo: String?, timeZone: String?, attributionModel: RetrieveAdsRequestAttributionModel?, requestOptions: RequestOptions?) -> Ad</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a single ad with stats over the requested window.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.ads.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ad ID.
    
</dd>
</dl>

<dl>
<dd>

**statsFrom:** `String?` — Start of the stats window.
    
</dd>
</dl>

<dl>
<dd>

**statsTo:** `String?` — End of the stats window.
    
</dd>
</dl>

<dl>
<dd>

**timeZone:** `String?` — IANA timezone the stats window is interpreted in. Defaults to UTC.
    
</dd>
</dl>

<dl>
<dd>

**attributionModel:** `RetrieveAdsRequestAttributionModel?` — Attribution model the conversion stats count under (defaults to last_touch). Under both models a journey with any whop ad touch attributes to whop; the model picks which whop touch credits the entity and which non-whop source wins otherwise.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.ads.<a href="/Sources/Resources/Ads/AdsClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> DeleteAdsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes an ad.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.ads.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ad ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.ads.<a href="/Sources/Resources/Ads/AdsClient.swift">update</a>(id: String, request: Requests.UpdateAdsRequest, requestOptions: RequestOptions?) -> Ad</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an ad's editable fields.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.ads.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ad ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateAdsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.ads.<a href="/Sources/Resources/Ads/AdsClient.swift">duplicate</a>(id: String, request: Requests.DuplicateAdsRequest, requestOptions: RequestOptions?) -> DuplicateAdsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Copies an ad into its own ad group or into another one. Copies keep the source ad's active or paused state.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.ads.duplicate(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ad ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.DuplicateAdsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.ads.<a href="/Sources/Resources/Ads/AdsClient.swift">pause</a>(id: String, requestOptions: RequestOptions?) -> Ad</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Pauses an active ad.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.ads.pause(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ad ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.ads.<a href="/Sources/Resources/Ads/AdsClient.swift">unpause</a>(id: String, requestOptions: RequestOptions?) -> Ad</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Resumes a paused ad.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.ads.unpause(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ad ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Ad Pixels
<details><summary><code>client.adPixels.<a href="/Sources/Resources/AdPixels/AdPixelsClient.swift">list</a>(accountId: String?, first: Int?, after: String?, last: Int?, before: String?, order: ListAdPixelsRequestOrder?, direction: ListAdPixelsRequestDirection?, requestOptions: RequestOptions?) -> ListAdPixelsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List the pixels you added for businesses whose campaigns you claimed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adPixels.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Only return the pixels for this business, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListAdPixelsRequestOrder?` 
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListAdPixelsRequestDirection?` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.adPixels.<a href="/Sources/Resources/AdPixels/AdPixelsClient.swift">create</a>(request: Requests.CreateAdPixelsRequest, requestOptions: RequestOptions?) -> AdPixel</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Add your pixel for a business whose campaigns you claimed. Whop checks the access token with the ad platform, then sends the pixel the conversions credited to your claimed campaigns for that business. Each business takes one pixel per ad platform, and each pixel can serve one business. On Google, the pixel is your Google Ads account, which can serve several businesses, and Whop creates its conversion actions there with your service account key.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adPixels.create(request: .init(
        accessToken: "new-token",
        accountId: "biz_xxxxxxxxxxxxxx",
        externalId: "998877665544",
        platform: .meta
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateAdPixelsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.adPixels.<a href="/Sources/Resources/AdPixels/AdPixelsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> AdPixel</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adPixels.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Ad pixel ID, prefixed `adpx_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.adPixels.<a href="/Sources/Resources/AdPixels/AdPixelsClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> DeleteAdPixelsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove the pixel and its access token. Whop stops sending it conversions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adPixels.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Ad pixel ID, prefixed `adpx_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.adPixels.<a href="/Sources/Resources/AdPixels/AdPixelsClient.swift">update</a>(id: String, request: Requests.UpdateAdPixelsRequest, requestOptions: RequestOptions?) -> AdPixel</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Replace the pixel's access token. Whop checks the new token with the ad platform and resumes deliveries to an `errored` pixel.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.adPixels.update(
        id: "id",
        request: .init(accessToken: "new-token")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Ad pixel ID, prefixed `adpx_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateAdPixelsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Affiliates
<details><summary><code>client.affiliates.<a href="/Sources/Resources/Affiliates/AffiliatesClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, direction: Direction?, order: AffiliatesSortableColumns?, query: String?, status: Status?, accountId: String, requestOptions: RequestOptions?) -> ListAffiliatesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the affiliates of an account.

Required permissions:
 - `affiliate:basic:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.affiliates.list(
        first: 42,
        last: 42,
        accountId: "biz_xxxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `Direction?` 
    
</dd>
</dl>

<dl>
<dd>

**order:** `AffiliatesSortableColumns?` 
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Search affiliates by username.
    
</dd>
</dl>

<dl>
<dd>

**status:** `Status?` 
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String` — The unique identifier of the company to list affiliates for.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.affiliates.<a href="/Sources/Resources/Affiliates/AffiliatesClient.swift">create</a>(request: Requests.CreateAffiliatesRequest, requestOptions: RequestOptions?) -> Affiliate</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates an affiliate for a user on an account. If the user is already an affiliate of the account, returns that affiliate, reactivating it if it was archived.

Required permissions:
 - `affiliate:create`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.affiliates.create(request: .init(
        accountId: "biz_xxxxxxxxxxxxxx",
        userIdentifier: "user_identifier"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateAffiliatesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.affiliates.<a href="/Sources/Resources/Affiliates/AffiliatesClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Affiliate</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing affiliate.

Required permissions:
 - `affiliate:basic:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.affiliates.retrieve(id: "aff_xxxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the affiliate.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.affiliates.<a href="/Sources/Resources/Affiliates/AffiliatesClient.swift">archive</a>(id: String, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Archives an affiliate. The affiliate that handles Whop marketplace referrals cannot be archived.

Required permissions:
 - `affiliate:update`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.affiliates.archive(id: "aff_xxxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The internal ID of the affiliate to archive.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.affiliates.<a href="/Sources/Resources/Affiliates/AffiliatesClient.swift">unarchive</a>(id: String, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Unarchives an archived affiliate.

Required permissions:
 - `affiliate:update`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.affiliates.unarchive(id: "aff_xxxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The internal ID of the affiliate to archive.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## AiChats
<details><summary><code>client.aiChats.<a href="/Sources/Resources/AiChats/AiChatsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, agentIdentifier: AiChatAgentIdentifiers?, accountId: String?, onlyActiveCrons: Bool?, requestOptions: RequestOptions?) -> ListAiChatsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of AI chat threads for the current authenticated user.

Required permissions:
 - `ai_chat:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.aiChats.list(
        first: 42,
        last: 42
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**agentIdentifier:** `AiChatAgentIdentifiers?` 
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Only return chats associated with this business account.
    
</dd>
</dl>

<dl>
<dd>

**onlyActiveCrons:** `Bool?` — When true, returns only chats with an active cron schedule
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.aiChats.<a href="/Sources/Resources/AiChats/AiChatsClient.swift">create</a>(request: Requests.CreateAiChatsRequest, requestOptions: RequestOptions?) -> AiChat</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new AI chat thread and send the first message to the AI agent.

Required permissions:
 - `ai_chat:create`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.aiChats.create(request: .init(messageText: "message_text"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateAiChatsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.aiChats.<a href="/Sources/Resources/AiChats/AiChatsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> AiChat</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing AI chat.

Required permissions:
 - `ai_chat:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.aiChats.retrieve(id: "aich_xxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the AI chat to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.aiChats.<a href="/Sources/Resources/AiChats/AiChatsClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete an AI chat thread so it no longer appears in the user's chat list.

Required permissions:
 - `ai_chat:delete`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.aiChats.delete(id: "aich_xxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the AI chat to delete (e.g., "ai_chat_XXXXX").
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.aiChats.<a href="/Sources/Resources/AiChats/AiChatsClient.swift">update</a>(id: String, request: Requests.UpdateAiChatsRequest, requestOptions: RequestOptions?) -> AiChat</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update an AI chat's title, notification preferences, or associated account context.

Required permissions:
 - `ai_chat:update`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.aiChats.update(
        id: "aich_xxxxxxxxxxxxx",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the AI chat to update (e.g., "ai_chat_XXXXX").
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateAiChatsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## API Keys
<details><summary><code>client.apiKeys.<a href="/Sources/Resources/ApiKeys/ApiKeysClient.swift">list</a>(resourceId: String, resourceType: ListApiKeysRequestResourceType, createdBefore: ListApiKeysRequestCreatedBefore?, createdAfter: ListApiKeysRequestCreatedAfter?, first: Int?, after: String?, last: Int?, before: String?, order: ListApiKeysRequestOrder?, direction: ListApiKeysRequestDirection?, requestOptions: RequestOptions?) -> ListApiKeysResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the API keys of an account, app, or your own user, newest first. Responses never include the full secret — only its obfuscated form.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.apiKeys.list(
        resourceId: "resource_id",
        resourceType: .account
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**resourceId:** `String` — The account (`biz_`), app (`app_`), or your own user (`user_`) tag to list API keys for.
    
</dd>
</dl>

<dl>
<dd>

**resourceType:** `ListApiKeysRequestResourceType` — The type of resource that owns the API keys.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `ListApiKeysRequestCreatedBefore?` — Only return API keys created before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `ListApiKeysRequestCreatedAfter?` — Only return API keys created after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListApiKeysRequestOrder?` — The field to sort API keys by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListApiKeysRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.apiKeys.<a href="/Sources/Resources/ApiKeys/ApiKeysClient.swift">create</a>(request: Requests.CreateApiKeysRequest, requestOptions: RequestOptions?) -> ApiKey</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates an API key for an account, an app, or your own user. A user API key acts as you and can only grant `ad_campaign:basic:read`, `ad_campaign:update`, `ad_pixel:manage`, `member:journey:read`. The response is the only place the full `secret_key` is returned — store it immediately. Requires a user session; API keys cannot manage API keys.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.apiKeys.create(request: .init(
        name: "Shine Time Booking (production)",
        permissions: CreateApiKeysRequestPermissions(

        ),
        resourceId: "biz_xxxxxxxxxxxxxx",
        resourceType: .account
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateApiKeysRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.apiKeys.<a href="/Sources/Resources/ApiKeys/ApiKeysClient.swift">listPermissions</a>(requestOptions: RequestOptions?) -> ListPermissionsApiKeysResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the catalog of permission actions that can be granted to users, apps, and API keys. Use it to choose the `permissions` for an API key or to build a permission picker. Small and returned in full on one page.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.apiKeys.listPermissions()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.apiKeys.<a href="/Sources/Resources/ApiKeys/ApiKeysClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> ApiKey</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves an API key with its effective permission grants. The full secret is never returned — rotate the key if it was lost.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.apiKeys.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — API key ID, prefixed `apik_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.apiKeys.<a href="/Sources/Resources/ApiKeys/ApiKeysClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> DeleteApiKeysResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Permanently revokes an API key; requests using its secret stop authenticating immediately. Default and agent-backend keys cannot be deleted.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.apiKeys.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — API key ID, prefixed `apik_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.apiKeys.<a href="/Sources/Resources/ApiKeys/ApiKeysClient.swift">update</a>(id: String, request: Requests.UpdateApiKeysRequest, requestOptions: RequestOptions?) -> ApiKey</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an API key's name, permissions, API version, expiration, or IP allowlist. Fields that are omitted keep their current value; default keys cannot be modified.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.apiKeys.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — API key ID, prefixed `apik_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateApiKeysRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.apiKeys.<a href="/Sources/Resources/ApiKeys/ApiKeysClient.swift">rotate</a>(id: String, requestOptions: RequestOptions?) -> ApiKey</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Rotates the API key's secret, invalidating the previous secret immediately. The response is the only place the new `secret_key` is returned.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.apiKeys.rotate(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — API key ID, prefixed `apik_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Api Logs
<details><summary><code>client.apiLogs.<a href="/Sources/Resources/ApiLogs/ApiLogsClient.swift">list</a>(accountId: String?, createdAfter: String?, createdBefore: String?, operationName: String?, httpMethod: ListApiLogsRequestHttpMethod?, status: ListApiLogsRequestStatus?, apiKeyId: String?, minDurationMs: Int?, maxDurationMs: Int?, first: Int?, after: String?, requestOptions: RequestOptions?) -> ListApiLogsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the requests served by Whop's API with the account's API keys, newest first — every surface (GraphQL, REST, and native /api/v1), reads and failed requests included.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.apiLogs.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — The account (biz_*) whose API logs to list. Defaults to the authenticated account.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only return requests served at or after this ISO 8601 timestamp. Defaults to 7 days before created_before, or 7 days ago.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only return requests served before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**operationName:** `String?` — Only return requests for this operation, matched exactly against the operation_name shown on each log row (for example api/v1/products#create).
    
</dd>
</dl>

<dl>
<dd>

**httpMethod:** `ListApiLogsRequestHttpMethod?` — Only return requests made with this HTTP method.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListApiLogsRequestStatus?` — Only return requests that finished with this status.
    
</dd>
</dl>

<dl>
<dd>

**apiKeyId:** `String?` — Only return requests made with this API key (apik_…).
    
</dd>
</dl>

<dl>
<dd>

**minDurationMs:** `Int?` — Only return requests that took at least this many milliseconds.
    
</dd>
</dl>

<dl>
<dd>

**maxDurationMs:** `Int?` — Only return requests that took at most this many milliseconds.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## App Builds
<details><summary><code>client.appBuilds.<a href="/Sources/Resources/AppBuilds/AppBuildsClient.swift">list</a>(appId: String, platform: ListAppBuildsRequestPlatform?, status: ListAppBuildsRequestStatus?, createdBefore: ListAppBuildsRequestCreatedBefore?, createdAfter: ListAppBuildsRequestCreatedAfter?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListAppBuildsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of build artifacts for an app, newest first, with optional platform, status, and creation-date filters.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.appBuilds.list(appId: "app_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**appId:** `String` — The app to list builds for, prefixed `app_`.
    
</dd>
</dl>

<dl>
<dd>

**platform:** `ListAppBuildsRequestPlatform?` — Filter builds by target platform.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListAppBuildsRequestStatus?` — Filter builds by review status.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `ListAppBuildsRequestCreatedBefore?` — Only return builds created before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `ListAppBuildsRequestCreatedAfter?` — Only return builds created after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.appBuilds.<a href="/Sources/Resources/AppBuilds/AppBuildsClient.swift">create</a>(request: Requests.CreateAppBuildsRequest, requestOptions: RequestOptions?) -> AppBuild</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Uploads a new build artifact for an app. Upload the file first with `POST /files` or a direct upload, then reference it in `attachment`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.appBuilds.create(request: .init(
        attachment: CreateAppBuildsRequestAttachment(

        ),
        checksum: "xxxxxxxxxxxxxxx",
        platform: .ios
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateAppBuildsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.appBuilds.<a href="/Sources/Resources/AppBuilds/AppBuildsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> AppBuild</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing app build.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.appBuilds.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — App build ID, prefixed `abld_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.appBuilds.<a href="/Sources/Resources/AppBuilds/AppBuildsClient.swift">promote</a>(id: String, requestOptions: RequestOptions?) -> AppBuild</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Promotes a draft or approved app build to production so it becomes the active version served to users. Draft builds enter review first.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.appBuilds.promote(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — App build ID, prefixed `abld_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## App Installations
<details><summary><code>client.appInstallations.<a href="/Sources/Resources/AppInstallations/AppInstallationsClient.swift">list</a>(accountId: String?, appId: String?, viewType: ListAppInstallationsRequestViewType?, externalId: String?, createdBefore: String?, createdAfter: String?, first: Int?, after: String?, last: Int?, before: String?, order: ListAppInstallationsRequestOrder?, direction: ListAppInstallationsRequestDirection?, requestOptions: RequestOptions?) -> ListAppInstallationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists app installations, newest first. An app's API key lists the accounts that installed it. An account lists the apps installed on it; a user passes that account's `account_id`. The developer of an app lists every installation of it by passing `app_id`. Uninstalled apps, deleted apps and deleted accounts are left out.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.appInstallations.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Only return installations on this account, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**appId:** `String?` — Only return installations of this app, prefixed `app_`. Pass your own app's ID to list the accounts that installed it.
    
</dd>
</dl>

<dl>
<dd>

**viewType:** `ListAppInstallationsRequestViewType?` — Only return installations of apps that have this view, such as `dashboard` for apps shown in a business's dashboard.
    
</dd>
</dl>

<dl>
<dd>

**externalId:** `String?` — Only return the installation with this `external_id`, the installed app's own identifier for it. Only the app and its developer can filter by it.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only return installations created before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only return installations created after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListAppInstallationsRequestOrder?` — Field to sort installations by. `name` sorts by app name, and only when listing the apps installed on one account.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListAppInstallationsRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.appInstallations.<a href="/Sources/Resources/AppInstallations/AppInstallationsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> AppInstallation</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves an app installation, with the metadata the app stores on it. The app, its developer and the account it's installed on can retrieve it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.appInstallations.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — App installation ID, prefixed `aag_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.appInstallations.<a href="/Sources/Resources/AppInstallations/AppInstallationsClient.swift">update</a>(id: String, request: Requests.UpdateAppInstallationsRequest, requestOptions: RequestOptions?) -> AppInstallation</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the `metadata` and `external_id` your app keeps on an installation. Only the metadata keys you send change, so separate jobs can each keep their own keys.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.appInstallations.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — App installation ID, prefixed `aag_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateAppInstallationsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Apps
<details><summary><code>client.apps.<a href="/Sources/Resources/Apps/AppsClient.swift">list</a>(accountId: String?, appType: ListAppsRequestAppType?, viewType: ListAppsRequestViewType?, verified: Bool?, verifiedAppsOnly: Bool?, recommended: Bool?, query: String?, productCategory: String?, businessType: String?, industryType: String?, marketplaceCategoryRoute: String?, order: ListAppsRequestOrder?, direction: ListAppsRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, includeTotalCount: Bool?, requestOptions: RequestOptions?) -> ListAppsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists published apps approved for the app store without authentication. With `account_id` and developer access, also includes unpublished apps that the account owns. Public website discovery includes built official blueprints and built, live community blueprints that Whop recommends.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.apps.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Only return apps created by this account (`biz_` tag). With developer access to the account this includes its unlisted and hidden apps.
    
</dd>
</dl>

<dl>
<dd>

**appType:** `ListAppsRequestAppType?` — Filter apps by the type of end-user they are built for. Apps of type `website` are left out unless you ask for them by name.
    
</dd>
</dl>

<dl>
<dd>

**viewType:** `ListAppsRequestViewType?` — Only return apps supporting this view type, such as `dashboard` or `hub`.
    
</dd>
</dl>

<dl>
<dd>

**verified:** `Bool?` — Only return apps whose Whop verification status matches this value. Omit this filter to include every verification status the caller can see.
    
</dd>
</dl>

<dl>
<dd>

**verifiedAppsOnly:** `Bool?` — Legacy compatibility filter. Use `verified` for field equality. `true` returns verified apps; clients pinned before `2026-08-25-2` retain the earlier public website discovery behavior.
    
</dd>
</dl>

<dl>
<dd>

**recommended:** `Bool?` — Only return apps Whop recommends (or, with `false`, only those it does not), independently of verification status.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — A search string matched against app names.
    
</dd>
</dl>

<dl>
<dd>

**productCategory:** `String?` — Only return apps whose `product_category` is this product category, such as `pressure_washing`. An unknown product category is rejected.
    
</dd>
</dl>

<dl>
<dd>

**businessType:** `String?` — Only return apps whose `product_category` sits under this business type in Whop's business taxonomy, such as `services`. An unknown business type is rejected.
    
</dd>
</dl>

<dl>
<dd>

**industryType:** `String?` — Only return apps whose `product_category` sits under this industry type of `business_type`, such as `exterior_cleaning`. Requires `business_type`. An industry type outside it is rejected.
    
</dd>
</dl>

<dl>
<dd>

**marketplaceCategoryRoute:** `String?` — Only return apps in this app store category. Use a `route` from `GET /apps/categories`, such as `business-productivity`. An unknown route is rejected.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListAppsRequestOrder?` — The field to sort apps by. Defaults to discoverable_at, showing the most recently published apps first. `template_usage` ranks Whop-verified apps first, then by how many businesses created apps from each app as a template. `template_recent_sales` ranks them by how many of those businesses processed a payment in the last 24 hours, recounted hourly, breaking ties by `template_usage`.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListAppsRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**includeTotalCount:** `Bool?` — Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.apps.<a href="/Sources/Resources/Apps/AppsClient.swift">create</a>(request: Requests.CreateAppsRequest, requestOptions: RequestOptions?) -> App</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Registers a new app on the Whop developer platform. Apps provide custom experiences that can be added to products.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.apps.create(request: .init(name: "Shine Time Booking"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateAppsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.apps.<a href="/Sources/Resources/Apps/AppsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> App</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves an app by ID, claimed route, active verified custom hostname, or proxy domain id. Authentication is optional; credential fields stay `null` unless you have the matching developer permission on the owning account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.apps.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — App ID (prefixed `app_`). Retrieval also accepts the app's claimed route, an active verified custom hostname, or its proxy domain id; a custom hostname returns `404` when its assignment is inactive, the owning account is suspended, or the app is deleted.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.apps.<a href="/Sources/Resources/Apps/AppsClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> DeleteAppsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes an app. The app stops resolving within seconds — a website's site stops serving, and any claimed subdomain is reserved for a month before it can be claimed again.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.apps.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — App ID (prefixed `app_`). Retrieval also accepts the app's claimed route, an active verified custom hostname, or its proxy domain id; a custom hostname returns `404` when its assignment is inactive, the owning account is suspended, or the app is deleted.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.apps.<a href="/Sources/Resources/Apps/AppsClient.swift">update</a>(id: String, request: Requests.UpdateAppsRequest, requestOptions: RequestOptions?) -> App</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the settings, metadata, or status of an app. Fields that are omitted keep their current value.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.apps.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — App ID (prefixed `app_`). Retrieval also accepts the app's claimed route, an active verified custom hostname, or its proxy domain id; a custom hostname returns `404` when its assignment is inactive, the owning account is suspended, or the app is deleted.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateAppsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.apps.<a href="/Sources/Resources/Apps/AppsClient.swift">deploy</a>(id: String, request: Requests.DeployAppsRequest, requestOptions: RequestOptions?) -> AppDeployment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Builds the app's current source and ships it. Returns the run it started, so the caller can render progress from this response and then follow it on the app's `deployment` field. Only one deployment runs per app at a time — calling this while one is in flight reports that run rather than starting a second, and calling it with nothing to publish reports that instead of starting one.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.apps.deploy(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The app to deploy, prefixed `app_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.DeployAppsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.apps.<a href="/Sources/Resources/Apps/AppsClient.swift">logs</a>(id: String, appBuildId: String?, level: LogsAppsRequestLevel?, query: String?, createdAfter: Date?, createdBefore: Date?, first: Int?, after: String?, before: String?, requestOptions: RequestOptions?) -> LogsAppsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists a hosted app's server runtime logs, most recent first: console output, uncaught exceptions, and failed-request summaries captured on whop.site hosting. Logs are retained for 7 days.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.apps.logs(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the app, which will look like app_*************.
    
</dd>
</dl>

<dl>
<dd>

**appBuildId:** `String?` — Only return logs from this build.
    
</dd>
</dl>

<dl>
<dd>

**level:** `LogsAppsRequestLevel?` — Only return console lines of this level.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Only return logs whose message contains this text (case-insensitive).
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Start of the time window as an ISO 8601 timestamp. Defaults to 7 days before created_before.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — End of the time window as an ISO 8601 timestamp. Defaults to now.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.apps.<a href="/Sources/Resources/Apps/AppsClient.swift">updatePermissions</a>(id: String, request: Requests.UpdatePermissionsAppsRequest, requestOptions: RequestOptions?) -> App</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Replaces the set of permissions the app requests from users when they install it. Requires a user session: the `developer:update_app_authorization` scope cannot be delegated to API keys. Sensitive permissions require step-up verification.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.apps.updatePermissions(
        id: "id",
        request: .init(requestedPermissions: [
            UpdatePermissionsAppsRequestRequestedPermissionsItem(
                action: "company:basic:read",
                isRequired: true,
                justification: "Reads basic account info to render the dashboard home."
            )
        ])
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — App ID, prefixed `app_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdatePermissionsAppsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Audiences
<details><summary><code>client.audiences.<a href="/Sources/Resources/Audiences/AudiencesClient.swift">list</a>(accountId: String, audienceId: String?, audienceType: ListAudiencesRequestAudienceType?, sourceType: ListAudiencesRequestSourceType?, first: Int?, after: String?, requestOptions: RequestOptions?) -> ListAudiencesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists an account's custom and lookalike audiences.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.audiences.list(accountId: "account_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Account ID, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**audienceId:** `String?` — Audience ID, prefixed `adaud_`, used to filter the response to one audience.
    
</dd>
</dl>

<dl>
<dd>

**audienceType:** `ListAudiencesRequestAudienceType?` — Filter by custom or lookalike audiences.
    
</dd>
</dl>

<dl>
<dd>

**sourceType:** `ListAudiencesRequestSourceType?` — Filter by uploaded customer lists, Whop People filters, or social engagement.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.audiences.<a href="/Sources/Resources/Audiences/AudiencesClient.swift">create</a>(request: Requests.CreateAudiencesRequest, requestOptions: RequestOptions?) -> CreateAudiencesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a custom audience from a customer list or your account's Whop People data, or a lookalike audience that reaches people similar to an existing one. Processing runs asynchronously. A custom audience returns one audience; a lookalike returns the requested similarity bands in `data`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.audiences.create(request: .init(accountId: "biz_xxxxxxxxxxxxxx"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateAudiencesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.audiences.<a href="/Sources/Resources/Audiences/AudiencesClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> DeleteAudiencesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes an audience so it is no longer available for targeting.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.audiences.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Audience ID, prefixed `adaud_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.audiences.<a href="/Sources/Resources/Audiences/AudiencesClient.swift">update</a>(id: String, request: Requests.UpdateAudiencesRequest, requestOptions: RequestOptions?) -> Audience</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Renames an audience. For an audience built from People filters that keeps itself up to date, pass `filters` to replace them, which rebuilds membership immediately. Whether an audience auto refreshes is set when it is created.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.audiences.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Audience ID, prefixed `adaud_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateAudiencesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.audiences.<a href="/Sources/Resources/Audiences/AudiencesClient.swift">addPeople</a>(id: String, request: Requests.AddPeopleAudiencesRequest, requestOptions: RequestOptions?) -> Audience</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds users from a new CSV file to an existing uploaded custom audience. The file uses the audience's saved column mapping, processing happens in the background, and existing audience members remain unchanged.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.audiences.addPeople(
        id: "id",
        request: .init(fileId: "file_xxxxxxxxxxxxxx")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Audience ID, prefixed `adaud_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.AddPeopleAudiencesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## AuthorizedUsers
<details><summary><code>client.authorizedUsers.<a href="/Sources/Resources/AuthorizedUsers/AuthorizedUsersClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, userId: String?, role: AuthorizedUserRoles?, createdBefore: Date?, createdAfter: Date?, accountId: String?, requestOptions: RequestOptions?) -> ListAuthorizedUsersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the authorized users on an account's team.

Required permissions:
 - `company:authorized_user:read`
 - `member:email:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.authorizedUsers.list(
        first: 42,
        last: 42,
        userId: "user_xxxxxxxxxxxxx",
        createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        accountId: "biz_xxxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — Filter results to a specific user to check if they are an authorized team member.
    
</dd>
</dl>

<dl>
<dd>

**role:** `AuthorizedUserRoles?` 
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Only return authorized users created before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Only return authorized users created after this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — The unique identifier of the company to list authorized users for.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.authorizedUsers.<a href="/Sources/Resources/AuthorizedUsers/AuthorizedUsersClient.swift">create</a>(request: Requests.CreateAuthorizedUsersRequest, requestOptions: RequestOptions?) -> AuthorizedUser</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds a user to an account's team as an authorized user with the given role.

Required permissions:
 - `authorized_user:create`
 - `member:email:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.authorizedUsers.create(request: .init(
        accountId: "biz_xxxxxxxxxxxxxx",
        role: .owner,
        userId: "user_xxxxxxxxxxxxx"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateAuthorizedUsersRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.authorizedUsers.<a href="/Sources/Resources/AuthorizedUsers/AuthorizedUsersClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> AuthorizedUser</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing authorized user.

Required permissions:
 - `company:authorized_user:read`
 - `member:email:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.authorizedUsers.retrieve(id: "ausr_xxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the authorized user to retrieve. Team member IDs may start with `ausr_` or `mber_`; treat them as opaque.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.authorizedUsers.<a href="/Sources/Resources/AuthorizedUsers/AuthorizedUsersClient.swift">delete</a>(id: String, accountId: String?, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Removes an authorized user from an account's team.

Required permissions:
 - `authorized_user:delete`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.authorizedUsers.delete(
        id: "ausr_xxxxxxxxxxxxx",
        accountId: "biz_xxxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the authorized user or user to remove. Team member IDs may start with `ausr_` or `mber_`; treat them as opaque.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — The ID of the company the authorized user belongs to. Optional if the authorized user ID is provided.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Automation Enrollments
<details><summary><code>client.automationEnrollments.<a href="/Sources/Resources/AutomationEnrollments/AutomationEnrollmentsClient.swift">list</a>(accountId: String?, automationId: String?, memberId: String?, status: ListAutomationEnrollmentsRequestStatus?, version: Int?, order: ListAutomationEnrollmentsRequestOrder?, direction: ListAutomationEnrollmentsRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListAutomationEnrollmentsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists members' enrollments in automations, newest first.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.automationEnrollments.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Only this account's enrollments, prefixed `biz_`. Defaults to the credential's account, or every account a user can read.
    
</dd>
</dl>

<dl>
<dd>

**automationId:** `String?` — Only this automation's enrollments, prefixed `ato_`.
    
</dd>
</dl>

<dl>
<dd>

**memberId:** `String?` — Only this member's enrollments, prefixed `mber_`.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListAutomationEnrollmentsRequestStatus?` — Only enrollments with this status.
    
</dd>
</dl>

<dl>
<dd>

**version:** `Int?` — Only members on this automation version.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListAutomationEnrollmentsRequestOrder?` — Field to sort by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListAutomationEnrollmentsRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.automationEnrollments.<a href="/Sources/Resources/AutomationEnrollments/AutomationEnrollmentsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> AutomationEnrollment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a member's enrollment in an automation, with the step they're waiting on.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.automationEnrollments.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Automation enrollment ID, prefixed `atoe_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.automationEnrollments.<a href="/Sources/Resources/AutomationEnrollments/AutomationEnrollmentsClient.swift">cancel</a>(id: String, requestOptions: RequestOptions?) -> AutomationEnrollment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cancels an `active` enrollment: the member gets none of the automation's remaining steps, and their enrollment becomes `canceled`. The member can enroll in the automation again later.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.automationEnrollments.cancel(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Automation enrollment ID, prefixed `atoe_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Automation Steps
<details><summary><code>client.automationSteps.<a href="/Sources/Resources/AutomationSteps/AutomationStepsClient.swift">list</a>(automationId: String?, version: Int?, accountId: String?, order: ListAutomationStepsRequestOrder?, direction: ListAutomationStepsRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListAutomationStepsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists automation steps. With `automation_id`, lists one version of that automation in the order its steps run: the draft version unless `version` names another. Without it, lists the steps of every version of every automation, newest first. Steps get new IDs at every publish, so list them again afterwards and match them up by `key`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.automationSteps.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**automationId:** `String?` — Only this automation's steps, in run order, prefixed `ato_`. `order` doesn't apply.
    
</dd>
</dl>

<dl>
<dd>

**version:** `Int?` — With `automation_id`, the version to list, such as its `published_version`. Defaults to its `draft_version`.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Without `automation_id`, only this account's steps, prefixed `biz_`. Defaults to the credential's account, or every account a user can read.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListAutomationStepsRequestOrder?` — Field to sort by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListAutomationStepsRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.automationSteps.<a href="/Sources/Resources/AutomationSteps/AutomationStepsClient.swift">create</a>(request: Requests.CreateAutomationStepsRequest, requestOptions: RequestOptions?) -> AutomationStep</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds a step to an automation's draft version, directly after `previous_step_id`, or first when it's left out. The step that held that position now runs after the new one. Steps can't be moved, so add each one where it belongs. Setting `source_code` also needs every read permission listed for previewing a step, which the step's code reads the account with.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.automationSteps.create(request: .init(
        actionType: .wait,
        automationId: "ato_xxxxxxxxxxxxxx"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateAutomationStepsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.automationSteps.<a href="/Sources/Resources/AutomationSteps/AutomationStepsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> AutomationStep</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves an automation step, with how many members are waiting for it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.automationSteps.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Automation step ID, prefixed `atos_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.automationSteps.<a href="/Sources/Resources/AutomationSteps/AutomationStepsClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> AutomationStep</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a step of the draft version. The step after it runs in its place. Members already in the automation aren't affected until the draft is published.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.automationSteps.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Automation step ID, prefixed `atos_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.automationSteps.<a href="/Sources/Resources/AutomationSteps/AutomationStepsClient.swift">update</a>(id: String, request: Requests.UpdateAutomationStepsRequest, requestOptions: RequestOptions?) -> AutomationStep</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Edits a step of the draft version. A published version's steps never change; edit the same `key` in the draft instead. `previous_step_id` can't change. Setting `source_code` also needs every read permission listed for previewing a step, which the step's code reads the account with.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.automationSteps.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Automation step ID, prefixed `atos_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateAutomationStepsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.automationSteps.<a href="/Sources/Resources/AutomationSteps/AutomationStepsClient.swift">preview</a>(id: String, request: Requests.PreviewAutomationStepsRequest, requestOptions: RequestOptions?) -> AutomationStepPreview</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Runs an `email` or `message` step's code for one member, as if they had reached it, and returns what it would send. Nothing is sent. The step's code reads the account with every account-level `:read` permission that both the admin role and Whop AI hold except `payout:account:read`, so previewing, like setting `source_code`, needs `automation:write` and every one of those permissions. OAuth apps can't be granted all of them, so they can't preview or set step code.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.automationSteps.preview(
        id: "id",
        request: .init(memberId: "mber_xxxxxxxxxxxxxx")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Automation step ID, prefixed `atos_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PreviewAutomationStepsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Automations
<details><summary><code>client.automations.<a href="/Sources/Resources/Automations/AutomationsClient.swift">list</a>(accountId: String?, status: ListAutomationsRequestStatus?, triggerEvent: ListAutomationsRequestTriggerEvent?, order: ListAutomationsRequestOrder?, direction: ListAutomationsRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListAutomationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists automations, newest first.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.automations.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Only this account's automations, prefixed `biz_`. Defaults to the credential's account, or every account a user can read.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListAutomationsRequestStatus?` — Only automations with this status.
    
</dd>
</dl>

<dl>
<dd>

**triggerEvent:** `ListAutomationsRequestTriggerEvent?` — Only automations this webhook event enrolls into.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListAutomationsRequestOrder?` — Field to sort by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListAutomationsRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.automations.<a href="/Sources/Resources/Automations/AutomationsClient.swift">create</a>(request: Requests.CreateAutomationsRequest, requestOptions: RequestOptions?) -> Automation</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates an automation, `stopped`, with an empty draft version. Add steps with `POST /automation_steps`, then publish it with `POST /automations/{id}/publish`, which makes it `active`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.automations.create(request: .init(name: "Welcome"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateAutomationsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.automations.<a href="/Sources/Resources/Automations/AutomationsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Automation</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves an automation, with how many members are in it now and how many times members have enrolled in it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.automations.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Automation ID, prefixed `ato_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.automations.<a href="/Sources/Resources/Automations/AutomationsClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> Automation</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes an automation. It stops enrolling members, and every member in it stops.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.automations.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Automation ID, prefixed `ato_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.automations.<a href="/Sources/Resources/Automations/AutomationsClient.swift">update</a>(id: String, request: Requests.UpdateAutomationsRequest, requestOptions: RequestOptions?) -> Automation</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Renames an automation, changes its trigger event before its first publish, sets its secrets, or changes its status. Changing `secrets` or `status` also needs `automation:manage`. Use `POST /automations/{id}/publish` to publish the draft, and the steps endpoints to change what it does.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.automations.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Automation ID, prefixed `ato_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateAutomationsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.automations.<a href="/Sources/Resources/Automations/AutomationsClient.swift">publish</a>(id: String, requestOptions: RequestOptions?) -> Automation</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Publishes the draft version: new members start on it, and the automation becomes `active`. Members already in the automation move onto it. A member stays on the same step when it's still there. When the draft removed that step, the member moves to the step that now follows the nearest earlier step the draft kept. The draft is then copied into the next draft version, whose steps get new IDs and keep their `key`. Every draft step's `issues` must be empty. When the draft has no edits since the last publish, no new version is made. Publishing then only makes a `closed` or `stopped` automation `active` again. The account must have Economic Intelligence turned on.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.automations.publish(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Automation ID, prefixed `ato_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.automations.<a href="/Sources/Resources/Automations/AutomationsClient.swift">trigger</a>(id: String, request: Requests.TriggerAutomationsRequest, requestOptions: RequestOptions?) -> Automation</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Enrolls members into an active automation at the first step of its published version: the members you name, or every member `GET /members` lists with the filters you pass, as they match now. Members already in the automation are skipped. Enrolling runs in the background, so this returns the automation right away and `active_enrollments_count` grows as members enroll.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.automations.trigger(
        id: "id",
        request: .init(members: TriggerAutomationsRequestMembers.stringArray(
            [
                "mber_xxxxxxxxxxxxxx"
            ]
        ))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Automation ID, prefixed `ato_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.TriggerAutomationsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Bounties
<details><summary><code>client.bounties.<a href="/Sources/Resources/Bounties/BountiesClient.swift">list</a>(accountId: String?, userId: String?, status: ListBountiesRequestStatus?, businessGoalType: ListBountiesRequestBusinessGoalType?, country: String?, experienceId: String?, query: String?, createdAfter: String?, createdBefore: String?, order: ListBountiesRequestOrder?, direction: ListBountiesRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListBountiesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists bounties visible to the credential — for an account API key, the account's bounties including scheduled drafts; for a user token, the bounties the user can see and work.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.bounties.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Scope the list to this account (`biz_` tag). Requires read access to the account; account API keys may pass their own account or a subaccount.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — List the bounties this user participated in (`user_` tag). Must be the authenticated user.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListBountiesRequestStatus?` — Filter by lifecycle state.
    
</dd>
</dl>

<dl>
<dd>

**businessGoalType:** `ListBountiesRequestBusinessGoalType?` — Filter by the poster's declared goal. Bounties created before the goal taxonomy carry no goal and never match this filter.
    
</dd>
</dl>

<dl>
<dd>

**country:** `String?` — Only bounties workable from this country, as an ISO 3166-1 alpha-2 code. Bounties with no country targeting are workable worldwide and always match.
    
</dd>
</dl>

<dl>
<dd>

**experienceId:** `String?` — Only bounties posted to this forum experience, prefixed `exp_`. An unknown experience, or one outside the caller's scope, matches nothing.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Substring match on the bounty title or ID.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only bounties created after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only bounties created before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListBountiesRequestOrder?` — Sort field.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListBountiesRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bounties.<a href="/Sources/Resources/Bounties/BountiesClient.swift">create</a>(request: Requests.CreateBountiesRequest, requestOptions: RequestOptions?) -> Bounty</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a bounty and escrows its reward pool. Publishes immediately, or as a scheduled draft when you set `publish_at`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.bounties.create(request: .init(
        description: "Record one continuous pass of a full interior detail, dash to trunk, on a customer vehicle.",
        grossRewardAmount: 40,
        title: "Record interior detailing passes"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateBountiesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bounties.<a href="/Sources/Resources/Bounties/BountiesClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Bounty</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a bounty by ID. Authentication is optional: a request with no credential reads the bounty when it is publicly visible — published or completed, and not restricted to a private experience's members. Bounties outside the caller's scope, and bounties not publicly visible to an anonymous caller, return `404`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.bounties.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Bounty ID (`bnty_` tag).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bounties.<a href="/Sources/Resources/Bounties/BountiesClient.swift">update</a>(id: String, request: Requests.UpdateBountiesRequest, requestOptions: RequestOptions?) -> Bounty</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a bounty. A published bounty accepts title, description, and country targeting while it is still open with nothing under review. A scheduled (not-yet-published) draft additionally accepts the reward, winner slots, and schedule.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.bounties.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Bounty ID (`bnty_` tag).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateBountiesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bounties.<a href="/Sources/Resources/Bounties/BountiesClient.swift">cancel</a>(id: String, requestOptions: RequestOptions?) -> Bounty</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cancels a bounty. With no in-flight work, it cancels immediately and refunds the funder. Otherwise it stops new submissions and cancels once the in-flight work resolves and pays out. Repeating the request is a no-op. A bounty that already paid out every slot returns `400`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.bounties.cancel(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Bounty ID (`bnty_` tag).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Bounty Submissions
<details><summary><code>client.bountySubmissions.<a href="/Sources/Resources/BountySubmissions/BountySubmissionsClient.swift">list</a>(accountId: String?, bountyId: String?, status: ListBountySubmissionsRequestStatus?, createdAfter: String?, createdBefore: String?, order: ListBountySubmissionsRequestOrder?, direction: ListBountySubmissionsRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListBountySubmissionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists bounty submissions visible to the credential — for a user token, the submissions they authored plus those on bounties they posted; for an account API key, the submissions on the account's bounties. For the anonymous view of one bounty's reviewed work, use the submissions list under the bounty instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.bountySubmissions.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Scope the list to submissions on this account's bounties (`biz_` tag). Requires read access to the account.
    
</dd>
</dl>

<dl>
<dd>

**bountyId:** `String?` — Only submissions on this bounty (`bnty_` tag).
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListBountySubmissionsRequestStatus?` — Filter by lifecycle state.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only submissions created after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only submissions created before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListBountySubmissionsRequestOrder?` — Sort field.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListBountySubmissionsRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bountySubmissions.<a href="/Sources/Resources/BountySubmissions/BountySubmissionsClient.swift">create</a>(request: Requests.CreateBountySubmissionsRequest, requestOptions: RequestOptions?) -> BountySubmission</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a submission on a workforce bounty. Include a `deliverable` and the submission goes straight to review; create is the only step. For `data_capture` bounties, omit the deliverable: this starts a claimed attempt whose proof accumulates server-side, and `POST /bounty_submissions/:id/submit` sends it to review once complete. Requires a user credential — account API keys cannot author submissions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.bountySubmissions.create(request: .init(bountyId: "bnty_xxxxxxxxxxxxxx"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateBountySubmissionsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bountySubmissions.<a href="/Sources/Resources/BountySubmissions/BountySubmissionsClient.swift">retrieve</a>(id: String, accountId: String?, requestOptions: RequestOptions?) -> BountySubmission</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves one bounty submission the credential can see — one the caller authored, or one on a bounty they posted or their account owns. Reading another member's work on an account's bounty takes `account_id`, the same way the list does.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.bountySubmissions.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The bounty submission to act on (`btys_` tag).
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Read the submission as this account (`biz_` tag), scoping the lookup to its bounties rather than the caller's own work. Requires read access to the account. Without it the lookup covers only what the credential owns — the submissions the caller authored plus those on bounties they posted.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bountySubmissions.<a href="/Sources/Resources/BountySubmissions/BountySubmissionsClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> DeleteBountySubmissionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cancels the caller's own active attempt on a bounty and discards any accumulated capture clips. Only the worker who started the attempt can cancel it — account API keys cannot.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.bountySubmissions.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The bounty submission to act on (`btys_` tag).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bountySubmissions.<a href="/Sources/Resources/BountySubmissions/BountySubmissionsClient.swift">submit</a>(id: String, request: Requests.SubmitBountySubmissionsRequest, requestOptions: RequestOptions?) -> BountySubmission</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Submits a claimed attempt for review. A livestream attempt needs an ended proof stream and can attach a `deliverable`; a data capture attempt instead needs enough validated clip time and takes no payload. Only the worker who started the attempt can submit it — account API keys cannot.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.bountySubmissions.submit(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The claimed attempt to submit for review (`btys_` tag).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.SubmitBountySubmissionsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## CardTransactions
<details><summary><code>client.cardTransactions.<a href="/Sources/Resources/CardTransactions/CardTransactionsClient.swift">list</a>(accountId: String?, userId: String?, transactionIds: [String]?, cardId: [String]?, cardholderId: [String]?, status: ListCardTransactionsRequestStatus?, createdAfter: String?, createdBefore: String?, order: ListCardTransactionsRequestOrder?, direction: ListCardTransactionsRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListCardTransactionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the card transactions of an account or a user, newest first. Covers every card the owner has ever had, including canceled cards and spend that predates a re-application, and team members only see transactions on the cards assigned to them. Pass `transaction_ids` to fetch specific transactions instead of paging for them.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.cardTransactions.list(
        transactionIds: [
            "citx_xxxxxxxxxxxxxx"
        ],
        cardId: [
            "icrd_xxxxxxxxxxxxxx"
        ],
        cardholderId: [
            "user_xxxxxxxxxxxxxx"
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — The account whose card transactions to list, prefixed `biz_`. Provide this or `user_id`. Defaults to the credential's account.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — The user whose personal card transactions to list, prefixed `user_`. Provide this or `account_id`. Only that user can read them.
    
</dd>
</dl>

<dl>
<dd>

**transactionIds:** `[String]?` — Return only these card transactions, each prefixed `citx_`. Repeat the parameter, or pass one comma-separated value.
    
</dd>
</dl>

<dl>
<dd>

**cardId:** `[String]?` — Return only transactions charged to these cards, each prefixed `icrd_`.
    
</dd>
</dl>

<dl>
<dd>

**cardholderId:** `[String]?` — Return only transactions on cards assigned to these users, each prefixed `user_`.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListCardTransactionsRequestStatus?` — Return only transactions with this status.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Return only transactions authorized at or after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Return only transactions authorized at or before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListCardTransactionsRequestOrder?` — The field to sort by. Defaults to `created_at`.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListCardTransactionsRequestDirection?` — The sort direction. Defaults to `desc`.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.cardTransactions.<a href="/Sources/Resources/CardTransactions/CardTransactionsClient.swift">retrieve</a>(id: String, accountId: String?, userId: String?, requestOptions: RequestOptions?) -> CardTransaction</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a single card transaction from any card the owner has ever had, including canceled cards. Team members can retrieve only transactions on the cards assigned to them.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.cardTransactions.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The card transaction ID, prefixed `citx_`.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — The account that owns the transaction, prefixed `biz_`. Provide this or `user_id`. Defaults to the credential's account.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — The user that owns the transaction, prefixed `user_`. Provide this or `account_id`. Only that user can read it.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Cards
<details><summary><code>client.cards.<a href="/Sources/Resources/Cards/CardsClient.swift">list</a>(accountId: String?, userId: String?, requestOptions: RequestOptions?) -> ListCardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the Whop cards of an account or user, including ones still being set up. Team members only see the cards assigned to them.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.cards.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — The owning account ID (a biz_ identifier). Provide this or user_id.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — The owning user ID (a user_ identifier). Provide this or account_id.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.cards.<a href="/Sources/Resources/Cards/CardsClient.swift">create</a>(request: Requests.CreateCardsRequest, requestOptions: RequestOptions?) -> CreateCardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Issues a virtual card, or applies for card issuing. An account with no application files one here and gets back a `202`; call again to issue the card once it is approved. An account whose application was denied or canceled applies again the same way, replacing that application.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.cards.create(request: .init())
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateCardsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.cards.<a href="/Sources/Resources/Cards/CardsClient.swift">retrieve</a>(id: String, accountId: String?, userId: String?, requestOptions: RequestOptions?) -> RetrieveCardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a single card, including its `secrets` (card number, CVC, and PIN), which List Cards does not return.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.cards.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Card ID to retrieve, prefixed `icrd_`.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — The owning account ID (a biz_ identifier). Provide this or user_id.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — The owning user ID (a user_ identifier). Provide this or account_id.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.cards.<a href="/Sources/Resources/Cards/CardsClient.swift">update</a>(id: String, request: Requests.UpdateCardsRequest, requestOptions: RequestOptions?) -> UpdateCardsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates, freezes, or cancels a card. Updating the card's name, billing address, or limits requires both `payout:account:update` and `company:balance:read`; a card's assigned holder may update their own card's pin and frozen state with any user token.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.cards.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Card ID to retrieve, prefixed `icrd_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateCardsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Cashback Rules
<details><summary><code>client.cashbackRules.<a href="/Sources/Resources/CashbackRules/CashbackRulesClient.swift">create</a>(request: Requests.CreateCashbackRulesRequest, requestOptions: RequestOptions?) -> CashbackRule</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a future-dated card cashback rule for your direct subaccounts, funded by the authenticated platform account. Creating a rule does not transfer funds; pay cashback out with `POST /cashback_rules/payout`. Requires `payout:transfer_funds`. Supports `Idempotency-Key` for safe retries.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.cashbackRules.create(request: .init(
        rateBps: 500,
        startsAt: try! Date("2026-01-01T12:00:00Z", strategy: .iso8601)
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateCashbackRulesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.cashbackRules.<a href="/Sources/Resources/CashbackRules/CashbackRulesClient.swift">list</a>(first: Int?, after: String?, last: Int?, before: String?, order: ListCashbackRulesRequestOrder?, direction: ListCashbackRulesRequestDirection?, requestOptions: RequestOptions?) -> ListCashbackRulesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the cashback rules funded by the authenticated platform account, including scheduled, expired, and discarded rules. Requires an account-scoped credential with `payout:transfer:read`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.cashbackRules.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListCashbackRulesRequestOrder?` — Field to sort by. Defaults to created_at.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListCashbackRulesRequestDirection?` — Sort direction. Defaults to desc.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.cashbackRules.<a href="/Sources/Resources/CashbackRules/CashbackRulesClient.swift">payout</a>(request: Requests.PayoutCashbackRulesRequest, requestOptions: RequestOptions?) -> CashbackPayout</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Pays out cashback on demand from the authenticated platform's available USD balance to its direct subaccounts. Covers completed, unpaid card transactions created before the request, each under its latest matching rule, which must be funded by the authenticated platform. Filters combine, and an empty body includes every eligible transaction. Payouts process in the background and amounts are calculated then, so the response confirms queuing, not payment. If a payout fails for insufficient funds, add USD to the platform's balance. Requires `payout:transfer_funds`. Supports `Idempotency-Key`, and overlapping requests cannot pay the same card transaction twice.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.cashbackRules.payout(request: .init())
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.PayoutCashbackRulesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.cashbackRules.<a href="/Sources/Resources/CashbackRules/CashbackRulesClient.swift">update</a>(id: String, request: Requests.UpdateCashbackRulesRequest, requestOptions: RequestOptions?) -> CashbackRule</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the merchant filters, description, or expiration of a cashback rule funded by the authenticated platform account; its start, rate, and accounts can't change. Omitted fields stay unchanged. Scheduled, active, and expired rules can be updated, but discarded rules can't. Updating a rule does not transfer funds. Requires `payout:transfer_funds`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.cashbackRules.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — ID of the cashback rule, prefixed cicbr_.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateCashbackRulesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Channel Members
<details><summary><code>client.channelMembers.<a href="/Sources/Resources/ChannelMembers/ChannelMembersClient.swift">list</a>(first: Int?, after: String?, last: Int?, before: String?, channelId: String, query: String?, requestOptions: RequestOptions?) -> ListChannelMembersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List or search the people in a channel.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.channelMembers.list(channelId: "channel_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**channelId:** `String` — The channel whose members to list.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Search by name or username.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channelMembers.<a href="/Sources/Resources/ChannelMembers/ChannelMembersClient.swift">create</a>(request: Requests.CreateChannelMembersRequest, requestOptions: RequestOptions?) -> ChannelMember</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Add a member to a direct or support channel.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.channelMembers.create(request: .init(
        channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
        userId: "user_xxxxxxxxxxxxxx"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateChannelMembersRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channelMembers.<a href="/Sources/Resources/ChannelMembers/ChannelMembersClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> ChannelMember</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a channel member and their read position.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.channelMembers.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Public resource ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channelMembers.<a href="/Sources/Resources/ChannelMembers/ChannelMembersClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> Void</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove a channel member, or leave the channel yourself. Requires dms:channel:manage and access to the channel. Removing someone else also requires permission to manage its members.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.channelMembers.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Public resource ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channelMembers.<a href="/Sources/Resources/ChannelMembers/ChannelMembersClient.swift">update</a>(id: String, request: Requests.UpdateChannelMembersRequest, requestOptions: RequestOptions?) -> ChannelMember</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update your notification preference using your stored membership ID in a private or support channel.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.channelMembers.update(
        id: "id",
        request: .init(notificationPreference: .all)
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Public resource ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateChannelMembersRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Channels
<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">list</a>(first: Int?, after: String?, last: Int?, before: String?, includeTotalCount: Bool?, kind: [ListChannelsRequestKindItem]?, supportRole: ListChannelsRequestSupportRole?, accountId: String?, query: String?, status: ListChannelsRequestStatus?, awaitingReply: Bool?, unread: Bool?, pinned: Bool?, viewed: Bool?, requested: Bool?, order: ListChannelsRequestOrder?, includeMembers: Bool?, includeLastMessage: Bool?, direction: ListChannelsRequestDirection?, includeDeleted: Bool?, updatedAfter: String?, createdBefore: String?, createdAfter: String?, requestOptions: RequestOptions?) -> ListChannelsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List channels you can access.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.channels.list(kind: [
        .private
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**includeTotalCount:** `Bool?` — Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    
</dd>
</dl>

<dl>
<dd>

**kind:** `[ListChannelsRequestKindItem]?` — Channel kinds to return. Combine `private` and `support`, or pass `community` alone. `private` includes one-to-one and group direct messages.
    
</dd>
</dl>

<dl>
<dd>

**supportRole:** `ListChannelsRequestSupportRole?` — Which support channels to return. `customer` returns support chats you opened, including when `account_id` is set. `staff` returns the support inbox of the account in `account_id`, and requires permission to read that account's support chats. Applies only to `support` channels.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Filter channels by their owning account, prefixed `biz_`. Applies to private, community and support channels.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Return only channels whose name contains this text. Private and support channels also match a member's username or name. `%` and `_` match literally.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListChannelsRequestStatus?` — Return only support channels with this resolution. Requires `kind` to be `support` alone.
    
</dd>
</dl>

<dl>
<dd>

**awaitingReply:** `Bool?` — `true` returns unresolved support channels whose last message came from the customer; `false` returns the other support channels. Other channel kinds are returned either way.
    
</dd>
</dl>

<dl>
<dd>

**unread:** `Bool?` — `true` returns channels with messages you have not read; `false` returns the rest. Requires authenticating as a user.
    
</dd>
</dl>

<dl>
<dd>

**pinned:** `Bool?` — `true` returns private and support channels you have pinned; `false` returns those you have not. Requires authenticating as a user.
    
</dd>
</dl>

<dl>
<dd>

**viewed:** `Bool?` — `true` returns community channels you have opened; `false` returns those you never have. Requires authenticating as a user.
    
</dd>
</dl>

<dl>
<dd>

**requested:** `Bool?` — `true` returns your pending direct-message requests; `false` returns your accepted private channels. Requires `private` in `kind` and authenticating as a user. With `support` also in `kind`, `false` keeps support channels and `true` returns only pending requests.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListChannelsRequestOrder?` — The field to sort by. Defaults to `last_viewed_at` for community channels and `last_message_at` for private and support channels. Ties sort in a stable order. Cannot be supplied with updated_after.
    
</dd>
</dl>

<dl>
<dd>

**includeMembers:** `Bool?` — Include the current members of private and support channels, including you, with their public profiles.
    
</dd>
</dl>

<dl>
<dd>

**includeLastMessage:** `Bool?` — Include the most recent message you can see, with its author.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListChannelsRequestDirection?` — The sort direction. Defaults to `desc`. Cannot be supplied with updated_after.
    
</dd>
</dl>

<dl>
<dd>

**includeDeleted:** `Bool?` — Include redacted entries for deleted channels and your removed memberships. Use deleted_at to remove these channels from your cache.
    
</dd>
</dl>

<dl>
<dd>

**updatedAfter:** `String?` — Return channels where the channel or your membership changed at or after this ISO 8601 timestamp. Cannot be more than one hour old, including on subsequent pages. For older changes, reload channels without updated_after. Results use ascending synchronized_at order. Cannot be combined with order, direction, query, status, awaiting_reply, unread, pinned, viewed, requested, created_before, or created_after.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Return only channels created before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Return only channels created after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">create</a>(request: Requests.CreateChannelsRequest, requestOptions: RequestOptions?) -> Channel</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a private, community or support channel. Returns an existing private or support channel unchanged with `200`, or a new channel with `201`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.channels.create(request: .init(kind: .private))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateChannelsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Channel</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a channel.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.channels.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Public resource ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> Void</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a channel. Deleting a support channel requires `support_chat:create` on the account. Community channels delete their backing experience and accept account API keys with the `experience:delete` permission. Private and support channels require a user identity with channel management permission; account API keys cannot act as a channel participant.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.channels.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Public resource ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">update</a>(id: String, request: Requests.UpdateChannelsRequest, requestOptions: RequestOptions?) -> Channel</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a channel. Community icon changes update the experience logo and require `experience:update`. Group private channel icon changes set the channel's own icon and require a group member. One-to-one private and support channels reject icon changes. Support rename and notification changes require `support_chat:create`. Private and support writes require a user identity with channel management permission. Account API keys can update community channels only.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.channels.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Public resource ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateChannelsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">accept</a>(id: String, request: Requests.AcceptChannelsRequest, requestOptions: RequestOptions?) -> ChannelMember</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Accept a direct-message request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.channels.accept(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Public resource ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.AcceptChannelsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">hide</a>(id: String, request: Requests.HideChannelsRequest, requestOptions: RequestOptions?) -> ChannelMember</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Decline a DM request by hiding the channel from your inbox.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.channels.hide(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Public resource ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.HideChannelsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">markRead</a>(id: String, request: Requests.MarkReadChannelsRequest, requestOptions: RequestOptions?) -> ChannelMember</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Mark a channel as read and optionally record viewed messages.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.channels.markRead(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Public resource ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.MarkReadChannelsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">markUnread</a>(id: String, request: Requests.MarkUnreadChannelsRequest, requestOptions: RequestOptions?) -> ChannelMember</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Mark a channel as unread for the authenticated user. Experience channels are unchanged.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.channels.markUnread(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Public resource ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.MarkUnreadChannelsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">pin</a>(id: String, request: Requests.PinChannelsRequest, requestOptions: RequestOptions?) -> Void</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Pin a private or support channel for yourself. Omit position to append a new pin or keep an existing pin in place. An explicit zero-based position inserts or moves the pin and shifts the rest. At most 12 channels can be pinned.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.channels.pin(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The channel ID, prefixed `feed_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PinChannelsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">reopen</a>(id: String, request: Requests.ReopenChannelsRequest, requestOptions: RequestOptions?) -> Channel</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Reopen a resolved support channel.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.channels.reopen(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Public resource ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ReopenChannelsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">resolve</a>(id: String, request: Requests.ResolveChannelsRequest, requestOptions: RequestOptions?) -> Channel</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Resolve a support channel.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.channels.resolve(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Public resource ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ResolveChannelsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">unpin</a>(id: String, requestOptions: RequestOptions?) -> Void</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove a channel from your pins and compact the remaining order. Your discarded memberships and inaccessible channels can be unpinned. Does not return channel data or grant read access.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.channels.unpin(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The channel ID, prefixed `feed_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ChatChannels
<details><summary><code>client.chatChannels.<a href="/Sources/Resources/ChatChannels/ChatChannelsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, productId: String?, accountId: String, requestOptions: RequestOptions?) -> ListChatChannelsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the chat channels in an account.

Required permissions:
 - `chat:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.chatChannels.list(
        first: 42,
        last: 42,
        productId: "prod_xxxxxxxxxxxxx",
        accountId: "biz_xxxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**productId:** `String?` — The unique identifier of a product to filter by. When set, only chat channels connected to this product are returned.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String` — The unique identifier of the company to list chat channels for.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.chatChannels.<a href="/Sources/Resources/ChatChannels/ChatChannelsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> ChatChannel</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing chat channel.

Required permissions:
 - `chat:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.chatChannels.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the chat channel or experience to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.chatChannels.<a href="/Sources/Resources/ChatChannels/ChatChannelsClient.swift">update</a>(id: String, request: Requests.UpdateChatChannelsRequest, requestOptions: RequestOptions?) -> ChatChannel</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a chat channel's moderation settings, such as who can post, banned words, and media restrictions.

Required permissions:
 - `chat:moderate`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.chatChannels.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the chat channel to update. Accepts either an experience ID (e.g. 'exp_xxxxx') or a chat channel ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateChatChannelsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Checkout Configurations
<details><summary><code>client.checkoutConfigurations.<a href="/Sources/Resources/CheckoutConfigurations/CheckoutConfigurationsClient.swift">list</a>(accountId: String, variantId: String?, createdBefore: String?, createdAfter: String?, order: ListCheckoutConfigurationsRequestOrder?, direction: ListCheckoutConfigurationsRequestDirection?, first: Int?, after: String?, requestOptions: RequestOptions?) -> ListCheckoutConfigurationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists checkout configurations for an account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.checkoutConfigurations.list(accountId: "account_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Account ID, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**variantId:** `String?` — Only return checkout configurations for this variant ID, prefixed `plan_`.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only return checkout configurations created before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only return checkout configurations created after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListCheckoutConfigurationsRequestOrder?` — Field used to sort checkout configurations.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListCheckoutConfigurationsRequestDirection?` — Sort direction. Defaults to `desc`.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.checkoutConfigurations.<a href="/Sources/Resources/CheckoutConfigurations/CheckoutConfigurationsClient.swift">create</a>(request: Requests.CreateCheckoutConfigurationsRequest, requestOptions: RequestOptions?) -> CreateCheckoutConfigurationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a reusable checkout configuration for an existing or inline variant. Send customers to its `purchase_url` to check out.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.checkoutConfigurations.create(request: .init(
        accountId: "biz_xxxxxxxxxxxxxx",
        variantId: .value("plan_xxxxxxxxxxxxx")
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateCheckoutConfigurationsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.checkoutConfigurations.<a href="/Sources/Resources/CheckoutConfigurations/CheckoutConfigurationsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> RetrieveCheckoutConfigurationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a checkout configuration by ID. This endpoint is public so a checkout page can load from the configuration URL.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.checkoutConfigurations.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the checkout configuration.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.checkoutConfigurations.<a href="/Sources/Resources/CheckoutConfigurations/CheckoutConfigurationsClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> DeleteCheckoutConfigurationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a checkout configuration so its checkout URL can no longer be used.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.checkoutConfigurations.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the checkout configuration.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ClaimLinks
<details><summary><code>client.claimLinks.<a href="/Sources/Resources/ClaimLinks/ClaimLinksClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> RetrieveClaimLinksResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a funded claim link by ID or by its public claim code. By ID, the caller needs `airdrop_link:basic:read` on the funding account, or must own the funding personal account; `code` and `claim_url` are `null` without `airdrop_link:manage` on the funding account or `payout:withdraw_funds` on the personal account. A claim code previews the sender, amount, expiry, and claim availability without authentication. Treat codes as secrets: anyone holding one can claim after signing in.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.claimLinks.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — A claim-link ID (`airdrp_…`), or the public claim code from the `c` parameter in the claim URL.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.claimLinks.<a href="/Sources/Resources/ClaimLinks/ClaimLinksClient.swift">claim</a>(id: String, requestOptions: RequestOptions?) -> ClaimClaimLinksResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Claims a funded link into the authenticated user's personal balance and returns the updated link. Requires a signed-in user and the public claim code; account API keys cannot claim on a recipient's behalf. Each user can claim a link once. Reuse the same `Idempotency-Key` when retrying the same request. On-chain claims may take several minutes to complete.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.claimLinks.claim(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The public claim code from the `c` parameter in the claim URL. A claim-link ID does not authorize redemption.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## CompanyTokenTransactions
<details><summary><code>client.companyTokenTransactions.<a href="/Sources/Resources/CompanyTokenTransactions/CompanyTokenTransactionsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, userId: String?, transactionType: CompanyTokenTransactionTypes?, accountId: String, requestOptions: RequestOptions?) -> ListCompanyTokenTransactionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists an account's token transactions, newest first.

Required permissions:
 - `company_token_transaction:read`
 - `member:basic:read`
 - `company:basic:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.companyTokenTransactions.list(
        first: 42,
        last: 42,
        userId: "user_xxxxxxxxxxxxx",
        accountId: "biz_xxxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — Filter transactions to only those involving this specific user.
    
</dd>
</dl>

<dl>
<dd>

**transactionType:** `CompanyTokenTransactionTypes?` 
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String` — The unique identifier of the company to list token transactions for.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.companyTokenTransactions.<a href="/Sources/Resources/CompanyTokenTransactions/CompanyTokenTransactionsClient.swift">create</a>(request: CreateCompanyTokenTransactionsRequest, requestOptions: RequestOptions?) -> CompanyTokenTransaction</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a token transaction that adds, subtracts, or transfers tokens for a member of an account.

Required permissions:
 - `company_token_transaction:create`
 - `member:basic:read`
 - `company:basic:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.companyTokenTransactions.create(request: CreateCompanyTokenTransactionsRequest.transfer(
        CreateCompanyTokenTransactionsRequestTransfer(
            accountId: "biz_xxxxxxxxxxxxxx",
            amount: 6.9,
            destinationUserId: "destination_user_id",
            userId: "user_xxxxxxxxxxxxx"
        )
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `CreateCompanyTokenTransactionsRequest` — Parameters for CreateCompanyTokenTransaction
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.companyTokenTransactions.<a href="/Sources/Resources/CompanyTokenTransactions/CompanyTokenTransactionsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> CompanyTokenTransaction</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a token transaction.

Required permissions:
 - `company_token_transaction:read`
 - `member:basic:read`
 - `company:basic:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.companyTokenTransactions.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the token transaction to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Confirmation Tokens
<details><summary><code>client.confirmationTokens.<a href="/Sources/Resources/ConfirmationTokens/ConfirmationTokensClient.swift">retrieve</a>(id: String, accountId: String, requestOptions: RequestOptions?) -> ConfirmationToken</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a confirmation token's payment method and billing details, never the underlying payment credential, to display what the buyer chose or check that the token is still usable. Requires no authentication and is rate-limited.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.confirmationTokens.retrieve(
        id: "id",
        accountId: "account_id"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Confirmation token ID, prefixed `ctok_`.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String` — The account the token was minted for, prefixed `biz_`. It must match the token's account.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## CourseChapters
<details><summary><code>client.courseChapters.<a href="/Sources/Resources/CourseChapters/CourseChaptersClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, courseId: String, requestOptions: RequestOptions?) -> ListCourseChaptersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of chapters within a course, ordered by position.

Required permissions:
 - `courses:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courseChapters.list(
        first: 42,
        last: 42,
        courseId: "cors_xxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**courseId:** `String` — The unique identifier of the course to list chapters for.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.courseChapters.<a href="/Sources/Resources/CourseChapters/CourseChaptersClient.swift">create</a>(request: Requests.CreateCourseChaptersRequest, requestOptions: RequestOptions?) -> CourseChapter</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new chapter within a course to organize lessons into sections.

Required permissions:
 - `courses:update`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courseChapters.create(request: .init(courseId: "cors_xxxxxxxxxxxxx"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateCourseChaptersRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.courseChapters.<a href="/Sources/Resources/CourseChapters/CourseChaptersClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> CourseChapter</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing course chapter.

Required permissions:
 - `courses:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courseChapters.retrieve(id: "chap_xxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the chapter to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.courseChapters.<a href="/Sources/Resources/CourseChapters/CourseChaptersClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Permanently delete a chapter and all of its lessons from a course.

Required permissions:
 - `courses:update`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courseChapters.delete(id: "chap_xxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the chapter to delete (e.g., "chap_XXXXX").
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.courseChapters.<a href="/Sources/Resources/CourseChapters/CourseChaptersClient.swift">update</a>(id: String, request: Requests.UpdateCourseChaptersRequest, requestOptions: RequestOptions?) -> CourseChapter</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a chapter's title within a course.

Required permissions:
 - `courses:update`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courseChapters.update(
        id: "chap_xxxxxxxxxxxxx",
        request: .init(title: "title")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the chapter to update (e.g., "chap_XXXXX").
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateCourseChaptersRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## CourseLessonInteractions
<details><summary><code>client.courseLessonInteractions.<a href="/Sources/Resources/CourseLessonInteractions/CourseLessonInteractionsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, userId: String?, lessonId: String?, courseId: String?, completed: Bool?, requestOptions: RequestOptions?) -> ListCourseLessonInteractionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of lesson interactions for a lesson or course. Callers without admin access to the course's experience see only their own interactions.

Required permissions:
 - `courses:read`
 - `course_analytics:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courseLessonInteractions.list(
        first: 42,
        last: 42,
        userId: "user_xxxxxxxxxxxxx",
        lessonId: "lesn_xxxxxxxxxxxxx",
        courseId: "cors_xxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — The unique identifier of the user to filter lesson interactions for.
    
</dd>
</dl>

<dl>
<dd>

**lessonId:** `String?` — The unique identifier of the lesson to filter interactions for.
    
</dd>
</dl>

<dl>
<dd>

**courseId:** `String?` — The unique identifier of the course to filter interactions for.
    
</dd>
</dl>

<dl>
<dd>

**completed:** `Bool?` — Whether to filter for completed or in-progress lesson interactions.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.courseLessonInteractions.<a href="/Sources/Resources/CourseLessonInteractions/CourseLessonInteractionsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> CourseLessonInteraction</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing course lesson interaction.

Required permissions:
 - `courses:read`
 - `course_analytics:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courseLessonInteractions.retrieve(id: "crsli_xxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the lesson interaction to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## CourseLessons
<details><summary><code>client.courseLessons.<a href="/Sources/Resources/CourseLessons/CourseLessonsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, courseId: String?, chapterId: String?, requestOptions: RequestOptions?) -> ListCourseLessonsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of lessons within a course or chapter, ordered by position.

Required permissions:
 - `courses:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courseLessons.list(
        first: 42,
        last: 42,
        courseId: "cors_xxxxxxxxxxxxx",
        chapterId: "chap_xxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**courseId:** `String?` — The unique identifier of the course to return all lessons across all chapters.
    
</dd>
</dl>

<dl>
<dd>

**chapterId:** `String?` — The unique identifier of a chapter to return only its lessons.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.courseLessons.<a href="/Sources/Resources/CourseLessons/CourseLessonsClient.swift">create</a>(request: Requests.CreateCourseLessonsRequest, requestOptions: RequestOptions?) -> CourseLesson</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new lesson within a course chapter. Lessons can contain video, text, or assessment content.

Required permissions:
 - `courses:update`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courseLessons.create(request: .init(
        chapterId: "chap_xxxxxxxxxxxxx",
        lessonType: .text
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateCourseLessonsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.courseLessons.<a href="/Sources/Resources/CourseLessons/CourseLessonsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> CourseLesson</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing course lesson.

Required permissions:
 - `courses:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courseLessons.retrieve(id: "lesn_xxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the lesson to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.courseLessons.<a href="/Sources/Resources/CourseLessons/CourseLessonsClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Permanently delete a lesson and remove it from its chapter.

Required permissions:
 - `courses:update`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courseLessons.delete(id: "lesn_xxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the lesson to delete (e.g., "les_XXXXX").
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.courseLessons.<a href="/Sources/Resources/CourseLessons/CourseLessonsClient.swift">update</a>(id: String, request: Requests.UpdateCourseLessonsRequest, requestOptions: RequestOptions?) -> CourseLesson</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a lesson's content, type, visibility, assessment questions, or media attachments.

Required permissions:
 - `courses:update`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courseLessons.update(
        id: "lesn_xxxxxxxxxxxxx",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the lesson to update (e.g., "les_XXXXX").
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateCourseLessonsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.courseLessons.<a href="/Sources/Resources/CourseLessons/CourseLessonsClient.swift">markAsCompleted</a>(lessonId: String, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Mark a lesson as completed for the current user after they finish the content.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courseLessons.markAsCompleted(lessonId: "lesson_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**lessonId:** `String` — The unique identifier of the lesson to mark as completed (e.g., "les_XXXXX").
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.courseLessons.<a href="/Sources/Resources/CourseLessons/CourseLessonsClient.swift">start</a>(lessonId: String, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Record that the current user has started viewing a lesson, creating progress tracking records.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courseLessons.start(lessonId: "lesson_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**lessonId:** `String` — The unique identifier of the lesson the user is starting (e.g., "les_XXXXX").
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.courseLessons.<a href="/Sources/Resources/CourseLessons/CourseLessonsClient.swift">submitAssessment</a>(lessonId: String, request: Requests.SubmitAssessmentCourseLessonsRequest, requestOptions: RequestOptions?) -> SubmitAssessmentCourseLessonsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Submit answers for a quiz or knowledge check lesson and receive a graded result.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courseLessons.submitAssessment(
        lessonId: "lesson_id",
        request: .init(answers: [
            SubmitAssessmentCourseLessonsRequestAnswersItem(
                questionId: "question_id"
            )
        ])
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**lessonId:** `String` — The unique identifier of the quiz or knowledge check lesson to submit answers for (e.g., "les_XXXXX").
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.SubmitAssessmentCourseLessonsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## CourseStudents
<details><summary><code>client.courseStudents.<a href="/Sources/Resources/CourseStudents/CourseStudentsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, courseId: String, keyword: String?, requestOptions: RequestOptions?) -> ListCourseStudentsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of students enrolled in a course, with optional name filtering.

Required permissions:
 - `courses:read`
 - `course_analytics:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courseStudents.list(
        first: 42,
        last: 42,
        courseId: "cors_xxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**courseId:** `String` — The unique identifier of the course to list enrolled students for.
    
</dd>
</dl>

<dl>
<dd>

**keyword:** `String?` — A search term to filter students by name or username.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.courseStudents.<a href="/Sources/Resources/CourseStudents/CourseStudentsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> CourseStudent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing course student.

Required permissions:
 - `courses:read`
 - `course_analytics:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courseStudents.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the course student record to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Courses
<details><summary><code>client.courses.<a href="/Sources/Resources/Courses/CoursesClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, experienceId: String?, accountId: String?, requestOptions: RequestOptions?) -> ListCoursesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of the courses in an experience or an account. `hidden` courses are included only for callers with `courses:update`.

Required permissions:
 - `courses:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courses.list(
        first: 42,
        last: 42,
        experienceId: "exp_xxxxxxxxxxxxxx",
        accountId: "biz_xxxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**experienceId:** `String?` — The unique identifier of the experience to list courses for.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — The unique identifier of the company to list courses for.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.courses.<a href="/Sources/Resources/Courses/CoursesClient.swift">create</a>(request: Requests.CreateCoursesRequest, requestOptions: RequestOptions?) -> Course</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new course within an experience, with optional chapters, lessons, and a certificate.

Required permissions:
 - `courses:update`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courses.create(request: .init(
        experienceId: "exp_xxxxxxxxxxxxxx",
        title: "title"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateCoursesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.courses.<a href="/Sources/Resources/Courses/CoursesClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Course</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing course. A `hidden` course is returned only to callers with `courses:update`.

Required permissions:
 - `courses:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courses.retrieve(id: "cors_xxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the course to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.courses.<a href="/Sources/Resources/Courses/CoursesClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Permanently delete a course and all of its chapters, lessons, and student progress.

Required permissions:
 - `courses:update`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courses.delete(id: "cors_xxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the course to delete (e.g., "course_XXXXX").
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.courses.<a href="/Sources/Resources/Courses/CoursesClient.swift">update</a>(id: String, request: Requests.UpdateCoursesRequest, requestOptions: RequestOptions?) -> Course</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a course's title, description, visibility, thumbnail, or chapter ordering.

Required permissions:
 - `courses:update`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.courses.update(
        id: "cors_xxxxxxxxxxxxx",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the course to update (e.g., "course_XXXXX").
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateCoursesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Deposits
<details><summary><code>client.deposits.<a href="/Sources/Resources/Deposits/DepositsClient.swift">create</a>(request: Requests.CreateDepositsRequest, requestOptions: RequestOptions?) -> CreateDepositsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the deposit methods for an account or user, including crypto addresses, bank transfer instructions, and, for a business, a hosted deposit page. Bitcoin deposits are converted to USDT on Plasma in the destination's wallet. Business destinations require no authentication. Pass `payment_method_id` to also charge a business's saved payment method for `amount` in USD and add it to the business's balance; that requires authentication with the `payment:charge` scope. The charge has no fees or taxes and does not count as revenue.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.deposits.create(request: .init(destination: "biz_xxxxxxxxxxxxxx"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateDepositsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.deposits.<a href="/Sources/Resources/Deposits/DepositsClient.swift">reverse</a>(id: String, request: Requests.ReverseDepositsRequest, requestOptions: RequestOptions?) -> LedgerActivity</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Sends a deposit back where it came from. If the available balance doesn't cover it, nothing is sent.

- **Bank deposit:** pass its `vbt_` ID. The deposit fee is returned, so the balance only has to cover the rest. Returns a `topup_reversal` row.
- **Card deposit:** pass its `pay_` ID. It's refunded to the card, and its fees aren't returned. Returns a `payment_refund` row.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.deposits.reverse(
        id: "vbt_xxxxxxxxxxxxxx",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — A bank deposit ID, prefixed `vbt_`, or a card deposit's payment ID, prefixed `pay_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ReverseDepositsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Dispute alerts
<details><summary><code>client.disputeAlerts.<a href="/Sources/Resources/DisputeAlerts/DisputeAlertsClient.swift">list</a>(accountId: String?, paymentId: String?, type: ListDisputeAlertsRequestType?, first: Int?, after: String?, last: Int?, before: String?, order: ListDisputeAlertsRequestOrder?, direction: ListDisputeAlertsRequestDirection?, createdBefore: String?, createdAfter: String?, requestOptions: RequestOptions?) -> ListDisputeAlertsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the dispute alerts and early fraud warnings across the accounts you can read.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.disputeAlerts.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Only alerts on this account's payments (`biz_` tag). Omit it to cover every account you can read.
    
</dd>
</dl>

<dl>
<dd>

**paymentId:** `String?` — Only alerts on this payment (`pay_` tag). A payment can carry several.
    
</dd>
</dl>

<dl>
<dd>

**type:** `ListDisputeAlertsRequestType?` — Only alerts of this kind. `early_fraud_warning` for issuer fraud reports, `dispute_alert` for pre-dispute notices, `rapid_dispute_resolution` for Visa RDR cases the network already closed.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListDisputeAlertsRequestOrder?` — The field to sort alerts by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListDisputeAlertsRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only alerts Whop received before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only alerts Whop received after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.disputeAlerts.<a href="/Sources/Resources/DisputeAlerts/DisputeAlertsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> DisputeAlert</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a single dispute alert or early fraud warning by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.disputeAlerts.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The dispute alert ID, prefixed `dspa_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Disputes
<details><summary><code>client.disputes.<a href="/Sources/Resources/Disputes/DisputesClient.swift">list</a>(accountId: String?, first: Int?, after: String?, last: Int?, before: String?, order: ListDisputesRequestOrder?, direction: ListDisputesRequestDirection?, status: [ListDisputesRequestStatusItem]?, currency: String?, createdBefore: String?, createdAfter: String?, query: String?, includeSubaccounts: Bool?, requestOptions: RequestOptions?) -> ListDisputesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the disputes across the accounts you can read.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.disputes.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Only disputes filed against this account (`biz_` tag). Omit it to cover every account you can read.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListDisputesRequestOrder?` — The field to sort disputes by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListDisputesRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**status:** `[ListDisputesRequestStatusItem]?` — Only disputes in these statuses. Repeat the parameter to pass several — one paginated list covers all of them. Inquiries match only the `warning_` statuses. A `needs_response` dispute whose evidence deadline has passed reports and filters as `under_review` instead.
    
</dd>
</dl>

<dl>
<dd>

**currency:** `String?` — Only disputes in this three-letter ISO currency.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only disputes opened before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only disputes opened after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Search disputes by dispute ID, payment ID, user ID, membership ID, user email, name, or username. Email filtering requires the member:email:read permission.
    
</dd>
</dl>

<dl>
<dd>

**includeSubaccounts:** `Bool?` — Also cover the account's subaccounts. Requires `account_id`, and is a 400 without it. Without `query`, covers the disputes of the account and every subaccount, in any order. The listing is cut off after 10 seconds; add a `query` to narrow it. With `query`, matches on dispute, payment, user or membership ID, buyer email, or a card's first 6 or 8 digits and last 4 separated by a space or dash (`424242 4242`); free-text queries such as a name search only the named account. Subaccounts' disputes are returned only for subaccounts you can read disputes on.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.disputes.<a href="/Sources/Resources/Disputes/DisputesClient.swift">summary</a>(groups: [SummaryDisputesRequestGroupsItem]?, accountId: String?, status: [SummaryDisputesRequestStatusItem]?, currency: String?, createdBefore: String?, createdAfter: String?, query: String?, includeSubaccounts: Bool?, requestOptions: RequestOptions?) -> SummaryDisputesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Totals up the same disputes the list returns, so you can build status tabs and totals without paging through them.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.disputes.summary()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**groups:** `[SummaryDisputesRequestGroupsItem]?` — Which breakdowns to return, keyed by these names under `groups`. Repeat the parameter to ask for several; omit it for all of them.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Only disputes filed against this account (`biz_` tag). Omit it to cover every account you can read.
    
</dd>
</dl>

<dl>
<dd>

**status:** `[SummaryDisputesRequestStatusItem]?` — Only disputes in these statuses. Repeat the parameter to pass several. A `needs_response` dispute whose evidence deadline has passed reports and filters as `under_review` instead.
    
</dd>
</dl>

<dl>
<dd>

**currency:** `String?` — Only disputes in this three-letter ISO currency.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only disputes opened before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only disputes opened after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Search disputes by dispute ID, payment ID, user ID, membership ID, user email, name, or username. Email filtering requires the member:email:read permission.
    
</dd>
</dl>

<dl>
<dd>

**includeSubaccounts:** `Bool?` — Also cover the account's subaccounts. Requires `account_id`, and is a 400 without it. Without `query`, covers the disputes of the account and every subaccount, in any order. The listing is cut off after 10 seconds; add a `query` to narrow it. With `query`, matches on dispute, payment, user or membership ID, buyer email, or a card's first 6 or 8 digits and last 4 separated by a space or dash (`424242 4242`); free-text queries such as a name search only the named account. Subaccounts' disputes are returned only for subaccounts you can read disputes on.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.disputes.<a href="/Sources/Resources/Disputes/DisputesClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Dispute</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a single dispute.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.disputes.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The dispute ID (`dspt_` tag).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.disputes.<a href="/Sources/Resources/Disputes/DisputesClient.swift">update</a>(id: String, request: Requests.UpdateDisputesRequest, requestOptions: RequestOptions?) -> Dispute</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Edits a dispute's evidence while it is still editable. When the evidence is ready, send it to the payment processor with `POST /disputes/:id/submit`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.disputes.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The dispute ID (`dspt_` tag).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateDisputesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.disputes.<a href="/Sources/Resources/Disputes/DisputesClient.swift">accept</a>(id: String, requestOptions: RequestOptions?) -> Dispute</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Accepts a chargeback, conceding it to the customer instead of contesting it. The payment processor closes the dispute as `lost`. This is final — the dispute cannot be contested afterwards. Only a dispute whose `acceptable` is true can be accepted.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.disputes.accept(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The dispute ID (`dspt_` tag).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.disputes.<a href="/Sources/Resources/Disputes/DisputesClient.swift">submit</a>(id: String, requestOptions: RequestOptions?) -> Dispute</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Sends a dispute's evidence to the payment processor. The packet is checked against the processor's limits first, so a file over a cap is refused here with the file and the limit named. Otherwise the dispute is returned as `generating_response` with its evidence locked and the filing completes in the background: the dispute moves to `under_review` with `evidence_submitted_at` set once the processor accepts it, or back to `needs_response` with `submission_failure_reason` set when the processor refuses it, so it can be fixed and sent again before `evidence_due_at`. Either move is sent as `dispute.updated`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.disputes.submit(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The dispute ID (`dspt_` tag).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.disputes.<a href="/Sources/Resources/Disputes/DisputesClient.swift">uploadEvidence</a>(id: String, request: Requests.UploadEvidenceDisputesRequest, requestOptions: RequestOptions?) -> Dispute</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Replaces the full set of uploaded evidence documents on a dispute, beyond the four fixed evidence slots. Prefer `PATCH /disputes/:id` with `evidence.documents`, which does the same replace alongside every other evidence field in one call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.disputes.uploadEvidence(
        id: "id",
        request: .init(documents: [
            UploadEvidenceDisputesRequestDocumentsItem(
                documentType: .returnPolicy
            )
        ])
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The dispute ID (`dspt_` tag).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UploadEvidenceDisputesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## DmChannels
<details><summary><code>client.dmChannels.<a href="/Sources/Resources/DmChannels/DmChannelsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, accountId: String?, requestOptions: RequestOptions?) -> ListDmChannelsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the authenticated user's DM channels, most recently active first.

Required permissions:
 - `dms:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.dmChannels.list(
        first: 42,
        last: 42,
        accountId: "biz_xxxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — The unique identifier of a company to filter DM channels by. Only returns channels scoped to this company.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.dmChannels.<a href="/Sources/Resources/DmChannels/DmChannelsClient.swift">create</a>(request: Requests.CreateDmChannelsRequest, requestOptions: RequestOptions?) -> DmChannel</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a DM channel between two or more users, optionally scoped to an account. Returns the existing channel if one already exists.

Required permissions:
 - `dms:channel:manage`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.dmChannels.create(request: .init(withUserIds: [
        "with_user_ids"
    ]))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateDmChannelsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.dmChannels.<a href="/Sources/Resources/DmChannels/DmChannelsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> DmChannel</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing DM channel.

Required permissions (one of):
 - `dms:read`
 - `support_chat:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.dmChannels.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the DM channel to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.dmChannels.<a href="/Sources/Resources/DmChannels/DmChannelsClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Permanently deletes a DM channel and all of its messages. Only a channel admin can delete it.

Required permissions (one of):
 - `dms:channel:manage`
 - `support_chat:create`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.dmChannels.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the DM channel to delete.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.dmChannels.<a href="/Sources/Resources/DmChannels/DmChannelsClient.swift">update</a>(id: String, request: Requests.UpdateDmChannelsRequest, requestOptions: RequestOptions?) -> DmChannel</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a DM channel's settings, such as its display name. Only a channel admin can update it.

Required permissions (one of):
 - `dms:channel:manage`
 - `support_chat:create`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.dmChannels.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the DM channel to update.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateDmChannelsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## DmMembers
<details><summary><code>client.dmMembers.<a href="/Sources/Resources/DmMembers/DmMembersClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, channelId: String, requestOptions: RequestOptions?) -> ListDmMembersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of members in a specific DM channel, sorted by the date they were added.

Required permissions (one of):
 - `dms:read`
 - `support_chat:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.dmMembers.list(
        first: 42,
        last: 42,
        channelId: "channel_id"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**channelId:** `String` — The unique identifier of the DM channel to list members for.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.dmMembers.<a href="/Sources/Resources/DmMembers/DmMembersClient.swift">create</a>(request: Requests.CreateDmMembersRequest, requestOptions: RequestOptions?) -> DmMember</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Add a new user to an existing DM channel. Only an admin of the channel can add members.

Required permissions (one of):
 - `dms:message:manage`
 - `support_chat:message:create`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.dmMembers.create(request: .init(
        channelId: "channel_id",
        userId: "user_xxxxxxxxxxxxx"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateDmMembersRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.dmMembers.<a href="/Sources/Resources/DmMembers/DmMembersClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> DmMember</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing DM member.

Required permissions (one of):
 - `dms:read`
 - `support_chat:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.dmMembers.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the DM channel member to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.dmMembers.<a href="/Sources/Resources/DmMembers/DmMembersClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove a user from a DM channel. An admin can remove any member, and a member can remove themselves.

Required permissions (one of):
 - `dms:read`
 - `support_chat:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.dmMembers.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the DM channel member to remove.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.dmMembers.<a href="/Sources/Resources/DmMembers/DmMembersClient.swift">update</a>(id: String, request: Requests.UpdateDmMembersRequest, requestOptions: RequestOptions?) -> DmMember</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a DM channel member's settings, such as their notification preferences or membership status.

Required permissions (one of):
 - `dms:read`
 - `support_chat:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.dmMembers.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the DM channel member to update.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateDmMembersRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Domains
<details><summary><code>client.domains.<a href="/Sources/Resources/Domains/DomainsClient.swift">list</a>(accountId: String?, appId: String?, status: ListDomainsRequestStatus?, order: ListDomainsRequestOrder?, direction: ListDomainsRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, search: String?, tlds: [String]?, domain: String?, verification: ListDomainsRequestVerification?, registration: ListDomainsRequestRegistration?, platform: ListDomainsRequestPlatform?, subdomain: ListDomainsRequestSubdomain?, website: ListDomainsRequestWebsite?, applePay: ListDomainsRequestApplePay?, pixel: ListDomainsRequestPixel?, email: ListDomainsRequestEmail?, transfer: ListDomainsRequestTransfer?, requestOptions: RequestOptions?) -> ListDomainsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists your domains. Filter by account, app, status, hostname, or the state of a capability.

Pass `search` to find domains to buy instead: the exact domain first, even when taken, then your name on popular extensions, then suggestions. Pass `tlds` to check only the extensions you choose. Results aren't reserved.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.domains.list(tlds: [
        "com"
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Only domains belonging to this account, prefixed biz_.
    
</dd>
</dl>

<dl>
<dd>

**appId:** `String?` — Only domains whose website serves this app, prefixed app_.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListDomainsRequestStatus?` — Only domains with this status: the most pressing state of their capabilities, or `idle` when they want nothing.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListDomainsRequestOrder?` — Field to sort by. Domains with the same value keep their creation order in the same direction.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListDomainsRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**search:** `String?` — A name or domain to find domains to buy, such as `example` or `example.com`; a subdomain or URL searches its registrable domain. Returns domains with `availability` instead of your domains, without other filters or pagination.
    
</dd>
</dl>

<dl>
<dd>

**tlds:** `[String]?` — With `search`, check only these extensions, such as `com` or `co.uk`, returned in this order. Repeat for several, up to 100.
    
</dd>
</dl>

<dl>
<dd>

**domain:** `String?` — Only your domain with this hostname, such as `example.com`.
    
</dd>
</dl>

<dl>
<dd>

**verification:** `ListDomainsRequestVerification?` — Only domains with verification in this state, such as `ready`, or `any` for every domain that has verification.
    
</dd>
</dl>

<dl>
<dd>

**registration:** `ListDomainsRequestRegistration?` — Only domains with registration in this state, such as `ready`, or `any` for every domain that has registration.
    
</dd>
</dl>

<dl>
<dd>

**platform:** `ListDomainsRequestPlatform?` — Only domains with platform in this state, such as `ready`, or `any` for every domain that has platform.
    
</dd>
</dl>

<dl>
<dd>

**subdomain:** `ListDomainsRequestSubdomain?` — Only domains with subdomain in this state, such as `ready`, or `any` for every domain that has subdomain.
    
</dd>
</dl>

<dl>
<dd>

**website:** `ListDomainsRequestWebsite?` — Only domains with website in this state, such as `ready`, or `any` for every domain that has website.
    
</dd>
</dl>

<dl>
<dd>

**applePay:** `ListDomainsRequestApplePay?` — Only domains with apple_pay in this state, such as `ready`, or `any` for every domain that has apple_pay.
    
</dd>
</dl>

<dl>
<dd>

**pixel:** `ListDomainsRequestPixel?` — Only domains with pixel in this state, such as `ready`, or `any` for every domain that has pixel.
    
</dd>
</dl>

<dl>
<dd>

**email:** `ListDomainsRequestEmail?` — Only domains with email in this state, such as `ready`, or `any` for every domain that has email.
    
</dd>
</dl>

<dl>
<dd>

**transfer:** `ListDomainsRequestTransfer?` — Only domains with transfer in this state, such as `ready`, or `any` for every domain that has transfer.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="/Sources/Resources/Domains/DomainsClient.swift">create</a>(request: Requests.CreateDomainsRequest, requestOptions: RequestOptions?) -> Domain</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds a domain to your account with the capabilities you want.

Pass `registration` to buy the domain through Whop; it's the default when you pass no capability. Pay its `amount_due` at `purchase_url`, or pass `registration.payment_method_id` to charge a saved card. Whop then registers it, runs its DNS, and renews it every year while `auto_renew` is on.

Pass `registration.auth_code` to transfer in a domain you own at another registrar. The transfer starts once its `amount_due` is paid, or at once when `amount_due` is `null`. While `registration.phase` is `transferring`, its `issues` say what the transfer needs from you.

Pass `verification` to connect a domain you registered elsewhere: its `issues` list the TXT and routing records to publish. A subdomain of a domain this account bought through Whop takes `subdomain` by default, and Whop publishes its DNS records itself. Pass `website` with an `app_id` to serve that app on the domain.

To change a domain you already have, update it instead. Adding a domain this account deleted revives it under its original ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.domains.create(request: .init(domain: "www.bought.com"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateDomainsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="/Sources/Resources/Domains/DomainsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Domain</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a domain by ID or hostname. Both return the same domain, shown as fully as you can see it: everything for your own accounts, and only who has it and what it serves for anyone else.

A hostname no domain on Whop has comes back with its `availability` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.domains.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Domain ID, prefixed `dom_`, or a hostname such as `example.com`; a bare name looks up `.com`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="/Sources/Resources/Domains/DomainsClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> Domain</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Removes the domain from your account and releases its capabilities in the background. Deleting an unpaid purchase cancels it, and deleting a transfer cancels it and refunds it while the current registrar can still stop it. A registered domain can't be deleted; turn off `auto_renew` and it's released after it expires. Adding the domain to this account again revives it under the same ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.domains.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Domain ID, prefixed `dom_`, or a hostname such as `example.com`; a bare name looks up `.com`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="/Sources/Resources/Domains/DomainsClient.swift">update</a>(id: String, request: Requests.UpdateDomainsRequest, requestOptions: RequestOptions?) -> Domain</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Changes a domain's capabilities or metadata. Pass a capability to add it or change its settings, or `null` to release it; capabilities you leave out don't change. Passing a capability that needs action again retries it. Releasing every capability keeps the domain, `idle`; delete it to remove it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.domains.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Domain ID, prefixed `dom_`, or a hostname such as `example.com`; a bare name looks up `.com`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateDomainsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.domains.<a href="/Sources/Resources/Domains/DomainsClient.swift">check</a>(id: String, requestOptions: RequestOptions?) -> Domain</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Checks the domain's DNS, payment, and provider state again now instead of at its next scheduled check. Returns the domain as saved; retrieve it again to see the result.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.domains.check(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Domain ID, prefixed `dom_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Economic Intelligence
<details><summary><code>client.economicIntelligence.<a href="/Sources/Resources/EconomicIntelligence/EconomicIntelligenceClient.swift">list</a>(accountId: String?, status: ListEconomicIntelligenceRequestStatus?, input: String?, hasRun: Bool?, order: ListEconomicIntelligenceRequestOrder?, direction: ListEconomicIntelligenceRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListEconomicIntelligenceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists an account's recommendations, newest first by default. `status: ready` is what the account can act on now. Any other listing is its history of runs. Executed recommendations and runs stay listed after Economic Intelligence turns off, but new recommendations are offered only to businesses it is written for. For visitor countries, page views, ad impressions and clicks, or payment volume over a time range, use `GET /stats/time_series/:metric`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.economicIntelligence.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Account ID, prefixed `biz_`. Defaults to the API key's own account. Omit with `has_run` for the runs on every account you can read.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListEconomicIntelligenceRequestStatus?` — `ready` lists the recommendations the account can run now. A run status lists only the runs in that state. `queued`, `pending` and `superseded` are no longer listed and answer nothing.
    
</dd>
</dl>

<dl>
<dd>

**input:** `String?` — No longer read: recommendations are written for the business as it changes. Up to 1000 characters.
    
</dd>
</dl>

<dl>
<dd>

**hasRun:** `Bool?` — When true, only recommendations someone has started running, by any user. Without `account_id`, covers every account you can read.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListEconomicIntelligenceRequestOrder?` — Sort field.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListEconomicIntelligenceRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.economicIntelligence.<a href="/Sources/Resources/EconomicIntelligence/EconomicIntelligenceClient.swift">update</a>(id: String, accountId: String?, request: Requests.UpdateEconomicIntelligenceRequest, requestOptions: RequestOptions?) -> EconomicIntelligence</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a recommendation status, records feedback, or both. Send `sentiment` to rate it. Include `status: superseded` to retire a ready recommendation. A rating alone leaves its status unchanged. To run a recommendation yourself, send `status: running` to start. Send `status: executed` when it is carried out, or `status: incomplete` if the run ended without carrying it out. With `executed`, name what changed in `result_id` or where the run worked in `result_page`, and the result links there. Whop AI reports its own runs the same way. Send `status: acknowledged` once an executed run's result has been seen.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.economicIntelligence.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Recommendation ID, prefixed `reca_`.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Account ID, prefixed `biz_`. Defaults to the API key's own account.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateEconomicIntelligenceRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Email addresses
<details><summary><code>client.emailAddresses.<a href="/Sources/Resources/EmailAddresses/EmailAddressesClient.swift">list</a>(accountId: String?, order: ListEmailAddressesRequestOrder?, direction: ListEmailAddressesRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListEmailAddressesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the email addresses of the accounts you can read, and the mailboxes you own. A password is included only for mailboxes you can use.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.emailAddresses.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Only addresses belonging to this account, prefixed biz_.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListEmailAddressesRequestOrder?` — Field to sort by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListEmailAddressesRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.emailAddresses.<a href="/Sources/Resources/EmailAddresses/EmailAddressesClient.swift">create</a>(request: Requests.CreateEmailAddressesRequest, requestOptions: RequestOptions?) -> EmailAddress</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a mailbox on one of the account's domains. The domain needs the `email` capability turned on. The address can be created and signed in to while email is still setting up, and it can send once email is `ready`. Give it to a team member with `user_id`, or leave it out to share the mailbox with the account. Creating an address this account deleted brings the mailbox back, with its mail and a new password.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.emailAddresses.create(request: .init(address: "marcus@shinetime.example"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateEmailAddressesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.emailAddresses.<a href="/Sources/Resources/EmailAddresses/EmailAddressesClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> EmailAddress</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves an email address. Its owner can always retrieve it; anyone else needs `email:read`. The password is included only if you can use the mailbox.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.emailAddresses.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Email address ID, prefixed `emaddr_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.emailAddresses.<a href="/Sources/Resources/EmailAddresses/EmailAddressesClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> EmailAddress</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes the address. Mail apps signed in to it lose access, and mail sent to it is no longer received. Its mail is kept, and creating the address again in this account brings the mailbox back.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.emailAddresses.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Email address ID, prefixed `emaddr_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.emailAddresses.<a href="/Sources/Resources/EmailAddresses/EmailAddressesClient.swift">update</a>(id: String, request: Requests.UpdateEmailAddressesRequest, requestOptions: RequestOptions?) -> EmailAddress</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gives the mailbox to a team member, or shares it with the account, under a new password. A mailbox that had an owner starts empty, because its earlier mail is private to that owner; mail apps sync it again from the start.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.emailAddresses.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Email address ID, prefixed `emaddr_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateEmailAddressesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.emailAddresses.<a href="/Sources/Resources/EmailAddresses/EmailAddressesClient.swift">mobileconfig</a>(id: String, requestOptions: RequestOptions?) -> Data</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Downloads an Apple configuration profile that adds the mailbox to Mail on a Mac, iPhone or iPad, signed in and ready to send. Only the owner can download it for an owned mailbox; a shared one needs `email:read` and `email:send`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.emailAddresses.mobileconfig(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Email address ID, prefixed `emaddr_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.emailAddresses.<a href="/Sources/Resources/EmailAddresses/EmailAddressesClient.swift">resetPassword</a>(id: String, requestOptions: RequestOptions?) -> EmailAddress</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Gives the mailbox a new password. Every mail app signed in with the old one loses access. Only the owner can reset an owned mailbox; a shared one needs `email:read` and `email:send`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.emailAddresses.resetPassword(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Email address ID, prefixed `emaddr_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Events
<details><summary><code>client.events.<a href="/Sources/Resources/Events/EventsClient.swift">list</a>(identifier: String?, accountId: String?, from: Date?, to: Date?, first: Int?, after: String?, before: String?, direction: ListEventsRequestDirection?, event: String?, source: String?, attributionModel: ListEventsRequestAttributionModel?, country: String?, city: String?, device: String?, browser: String?, os: String?, utmSource: String?, hostname: String?, page: String?, requestOptions: RequestOptions?) -> ListEventsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists identity-linked events, most recent first by default. Pass `identifier` for one person's journey, or omit it to list an account's events within a time range. Events have the same shape as the `POST /events` intake: attribution in `context`, identity in `user`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.events.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**identifier:** `String?` — Any hard identifier of the person: a person ID (prsn_*), user ID, email, phone number, or a tracking cookie value (wuid, anonymous ID, fbp/fbc/ttp/ga). Omit to list recent events for the account.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Account ID, prefixed `biz_`. Optional for account API keys; required for credentials that can access multiple accounts.
    
</dd>
</dl>

<dl>
<dd>

**from:** `Date?` — Start of the time range as an ISO 8601 timestamp. Required when identifier is omitted.
    
</dd>
</dl>

<dl>
<dd>

**to:** `Date?` — End of the time range as an ISO 8601 timestamp. Required when identifier is omitted; otherwise defaults to now.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListEventsRequestDirection?` — The order events are returned in by time. Defaults to desc (most recent first); asc reads a journey forwards from where it starts. after and before always page forwards and backwards through that order.
    
</dd>
</dl>

<dl>
<dd>

**event:** `String?` — Full event names to filter by, comma-separated (payment.completed, pixel.lead, pixel.page, pixel.custom:<name>) — the same vocabulary the events / people metrics use.
    
</dd>
</dl>

<dl>
<dd>

**source:** `String?` — Canonical source path, exact or with a trailing :* prefix (whop:<campaign>:*, ext:meta:*, referrer:<domain>, direct, unknown). Selects conversions credited to this source.
    
</dd>
</dl>

<dl>
<dd>

**attributionModel:** `ListEventsRequestAttributionModel?` — Attribution model for the source filter (defaults to last_touch).
    
</dd>
</dl>

<dl>
<dd>

**country:** `String?` — Country codes to filter by, comma-separated.
    
</dd>
</dl>

<dl>
<dd>

**city:** `String?` — Cities to filter by, comma-separated.
    
</dd>
</dl>

<dl>
<dd>

**device:** `String?` — Device families to filter by, comma-separated (e.g. iPhone, Mac).
    
</dd>
</dl>

<dl>
<dd>

**browser:** `String?` — Browser families to filter by, comma-separated (e.g. Chrome, Mobile Safari).
    
</dd>
</dl>

<dl>
<dd>

**os:** `String?` — Operating system families to filter by, comma-separated (e.g. iOS, Windows).
    
</dd>
</dl>

<dl>
<dd>

**utmSource:** `String?` — utm_source values to filter by, comma-separated.
    
</dd>
</dl>

<dl>
<dd>

**hostname:** `String?` — Page hostnames to filter by, comma-separated.
    
</dd>
</dl>

<dl>
<dd>

**page:** `String?` — Page paths to filter by, comma-separated.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.events.<a href="/Sources/Resources/Events/EventsClient.swift">create</a>(request: Requests.CreateEventsRequest, requestOptions: RequestOptions?) -> CreateEventsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Tracks a conversion or engagement event for an account, such as a lead or a sign-up, so it can be attributed to the ads and links that drove it. Send server-side events with an API key that has `event:create`; the browser pixel calls this without authentication.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.events.create(request: .init(
        accountId: "biz_xxxxxxxxxxxxxx",
        eventName: "coating_deposit_paid"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateEventsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.events.<a href="/Sources/Resources/Events/EventsClient.swift">pulse</a>(event: String?, first: Int?, after: String?, before: String?, requestOptions: RequestOptions?) -> PulseEventsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a fully anonymized feed of recent money movement across Whop, most recent first, such as purchases, card spend, and transfers between accounts. Each item carries only its `type`, a USD amount, a coarse location, and a timestamp coarsened to the minute. The payload is identical for every caller and requires no authentication.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.events.pulse()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**event:** `String?` — Filter to one or more types, comma separated — for example `purchase,card_spend`. These are the item's `type`, not its `event_name`: several types share the `ledger_line.created` event name. Omit for every type in the feed. Values outside the feed's own set are rejected.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.events.<a href="/Sources/Resources/Events/EventsClient.swift">validatePixel</a>(request: Requests.ValidatePixelEventsRequest, requestOptions: RequestOptions?) -> PixelValidation</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Checks whether the Whop pixel is installed for an account, or on one page when you pass a `url`. Use it before launching an ad to confirm its destination is tracked, or in a setup flow to tell a merchant whether their install is live.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.events.validatePixel(request: .init())
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.ValidatePixelEventsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Experiences
<details><summary><code>client.experiences.<a href="/Sources/Resources/Experiences/ExperiencesClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, productId: String?, appId: String?, createdBefore: Date?, createdAfter: Date?, accountId: String, requestOptions: RequestOptions?) -> ListExperiencesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the experiences in an account, optionally filtered to those attached to one product or powered by one app.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.experiences.list(
        first: 42,
        last: 42,
        productId: "prod_xxxxxxxxxxxxx",
        appId: "app_xxxxxxxxxxxxxx",
        createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        accountId: "biz_xxxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**productId:** `String?` — Filter to only experiences attached to this product identifier.
    
</dd>
</dl>

<dl>
<dd>

**appId:** `String?` — Filter to only experiences powered by this app identifier.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Only return experiences created before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Only return experiences created after this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String` — The unique identifier of the company to list experiences for.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.experiences.<a href="/Sources/Resources/Experiences/ExperiencesClient.swift">create</a>(request: Requests.CreateExperiencesRequest, requestOptions: RequestOptions?) -> Experience</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates an experience for an account, powered by an app such as courses, forums, or chat. Attach it to a product with `POST /experiences/:id/attach` to give that product's customers access.

Required permissions:
 - `experience:create`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.experiences.create(request: .init(
        accountId: "biz_xxxxxxxxxxxxxx",
        appId: "app_xxxxxxxxxxxxxx"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateExperiencesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.experiences.<a href="/Sources/Resources/Experiences/ExperiencesClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Experience</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing experience.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.experiences.retrieve(id: "exp_xxxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the experience.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.experiences.<a href="/Sources/Resources/Experiences/ExperiencesClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes an experience and detaches it from every product, removing customer access to it. Returns `true` on success.

Required permissions:
 - `experience:delete`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.experiences.delete(id: "exp_xxxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the experience to delete.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.experiences.<a href="/Sources/Resources/Experiences/ExperiencesClient.swift">update</a>(id: String, request: Requests.UpdateExperiencesRequest, requestOptions: RequestOptions?) -> Experience</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an experience's name, logo, visibility, or notification setting, or moves it to another section or position.

Required permissions:
 - `experience:update`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.experiences.update(
        id: "exp_xxxxxxxxxxxxxx",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the experience to update.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateExperiencesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.experiences.<a href="/Sources/Resources/Experiences/ExperiencesClient.swift">attach</a>(id: String, request: Requests.AttachExperiencesRequest, requestOptions: RequestOptions?) -> Experience</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Attaches an experience to a product, giving the product's customers access to it.

Required permissions:
 - `experience:attach`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.experiences.attach(
        id: "exp_xxxxxxxxxxxxxx",
        request: .init(productId: "prod_xxxxxxxxxxxxx")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the experience to attach.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.AttachExperiencesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.experiences.<a href="/Sources/Resources/Experiences/ExperiencesClient.swift">detach</a>(id: String, request: Requests.DetachExperiencesRequest, requestOptions: RequestOptions?) -> Experience</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Detaches an experience from a product, removing customer access to it through that product.

Required permissions:
 - `experience:detach`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.experiences.detach(
        id: "exp_xxxxxxxxxxxxxx",
        request: .init(productId: "prod_xxxxxxxxxxxxx")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the experience to detach.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.DetachExperiencesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.experiences.<a href="/Sources/Resources/Experiences/ExperiencesClient.swift">duplicate</a>(id: String, request: Requests.DuplicateExperiencesRequest, requestOptions: RequestOptions?) -> Experience</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Duplicates an experience and attaches the copy to the same products as the original. Forum and chat copies keep the original's settings, such as who can post or comment. No content, such as posts, messages, or lessons, is copied.

Required permissions:
 - `experience:create`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.experiences.duplicate(
        id: "exp_xxxxxxxxxxxxxx",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the experience to duplicate.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.DuplicateExperiencesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Experiments
<details><summary><code>client.experiments.<a href="/Sources/Resources/Experiments/ExperimentsClient.swift">list</a>(accountId: String?, relatedResource: ExperimentResourceReference?, status: ListExperimentsRequestStatus?, first: Int?, after: String?, last: Int?, before: String?, order: ListExperimentsRequestOrder?, direction: ListExperimentsRequestDirection?, requestOptions: RequestOptions?) -> ListExperimentsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the experiments and feature flags owned by an account. Requires `experiment:read` on the account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.experiments.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Owning account ID.
    
</dd>
</dl>

<dl>
<dd>

**relatedResource:** `ExperimentResourceReference?` — Filter by related resource; requires account_id.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListExperimentsRequestStatus?` — Only experiments with this status.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListExperimentsRequestOrder?` — The field to sort experiments by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListExperimentsRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.experiments.<a href="/Sources/Resources/Experiments/ExperimentsClient.swift">create</a>(request: Requests.CreateExperimentsRequest, requestOptions: RequestOptions?) -> Experiment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates an experiment or feature flag in `draft` status for an account. Nothing is served until you activate it with `POST /experiments/:id/activate`, which needs Economic Intelligence on for the account. Requires `experiment:manage` on the account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.experiments.create(request: .init(
        accountId: "biz_xxxxxxxxxxxxxx",
        flagKey: "checkout_redesign_v2"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateExperimentsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.experiments.<a href="/Sources/Resources/Experiments/ExperimentsClient.swift">exposures</a>(subject: ExposuresExperimentsRequestSubject?, relatedResource: ExperimentResourceReference?, flagKey: String?, accountId: String?, properties: String?, logExposure: Bool?, requestOptions: RequestOptions?) -> ExposuresExperimentsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Evaluates experiments and feature flags for a subject and records an exposure. Pass `flag_key` to evaluate one flag, or omit it to evaluate every active flag in the account and related resource scope. Requires no authentication; when a credential resolves, its authentication method, API key ID, and signed-in user ID are recorded on the exposure event.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.experiments.exposures()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**subject:** `ExposuresExperimentsRequestSubject?` — Bucketing subject: the user, account, or anonymous ID the experiment's `bucket_by` assigns on. Only the identity matching `bucket_by` is used; when it is missing, evaluating a single flag fails and a batch omits that experiment. Subjects outside every treatment range receive `control`. `subject[account_id]` also enables account-level targeting rules. Experiment ownership comes from the top-level `account_id`.
    
</dd>
</dl>

<dl>
<dd>

**relatedResource:** `ExperimentResourceReference?` — Restricts batch evaluation to this related resource; omitted batches contain only unbound experiments.
    
</dd>
</dl>

<dl>
<dd>

**flagKey:** `String?` — Flag or experiment to evaluate — the flag_key handle or the `expt_` id. Omit to return all flags the caller qualifies for.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Owning account ID. Required when evaluating by flag_key or in a batch; optional for an expt_ ID.
    
</dd>
</dl>

<dl>
<dd>

**properties:** `String?` — JSON-encoded scalar values that property targeting conditions match against. Numeric and boolean strings are coerced. Nested query keys such as properties[variant]=pro remain accepted for existing callers.
    
</dd>
</dl>

<dl>
<dd>

**logExposure:** `Bool?` — Set `false` to read an assignment without recording an exposure, such as when a client caches assignments up front and records the exposure when the arm is rendered. Omitted records the exposure.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.experiments.<a href="/Sources/Resources/Experiments/ExperimentsClient.swift">retrieve</a>(id: String, accountId: String?, requestOptions: RequestOptions?) -> Experiment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves an experiment or feature flag by its `expt_` ID or `flag_key` handle. Requires `experiment:read` on the owning account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.experiments.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The experiment identifier — the `expt_` id or the flag_key handle.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Owning account ID. Required when id is a flag key; optional for an expt_ ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.experiments.<a href="/Sources/Resources/Experiments/ExperimentsClient.swift">update</a>(id: String, accountId: String?, request: Requests.UpdateExperimentsRequest, requestOptions: RequestOptions?) -> Experiment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the targeting rules, treatment allocation, or hypothesis of an existing experiment or feature flag. To change its lifecycle, use the `activate`, `pause`, and `end` endpoints instead. Requires `experiment:manage` on the owning account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.experiments.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The experiment identifier — the `expt_` id or the flag_key handle.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Owning account ID. Required when id is a flag key; optional for an expt_ ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateExperimentsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.experiments.<a href="/Sources/Resources/Experiments/ExperimentsClient.swift">activate</a>(id: String, accountId: String?, request: Requests.ActivateExperimentsRequest, requestOptions: RequestOptions?) -> Experiment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Starts (or resumes) an experiment or feature flag so evaluation begins serving it. Activating a draft stamps `started_at`; resuming a paused experiment keeps the original start. Only drafts and paused experiments can be activated. Requires `experiment:manage` on the owning account. Activating needs Economic Intelligence on for the owning account: while the account's `economic_intelligence` is `false`, this returns a `403` and the experiment keeps its status. Turn it on with `PATCH /accounts/:account_id/preferences`. Creating, editing, pausing and ending an experiment don't need it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.experiments.activate(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The experiment identifier — the `expt_` id or the flag_key handle.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Owning account ID. Required when id is a flag key; optional for an expt_ ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ActivateExperimentsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.experiments.<a href="/Sources/Resources/Experiments/ExperimentsClient.swift">end</a>(id: String, accountId: String?, request: Requests.EndExperimentsRequest, requestOptions: RequestOptions?) -> Experiment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Concludes the experiment and records required `findings`. Pass `winning_arm` to serve the winning treatment to everyone; omit it when control won. Ended experiments cannot restart, but may be ended again to correct the winner. Requires `experiment:manage` on the owning account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.experiments.end(
        id: "id",
        request: .init(findings: "Treatment lifted signups 12%, shipping it to everyone.")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The experiment identifier — the `expt_` id or the flag_key handle.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Owning account ID. Required when id is a flag key; optional for an expt_ ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.EndExperimentsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.experiments.<a href="/Sources/Resources/Experiments/ExperimentsClient.swift">pause</a>(id: String, accountId: String?, requestOptions: RequestOptions?) -> Experiment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Pauses an active experiment or feature flag: evaluation stops serving it and exposures stop flowing. Assignments are keyed on stable identity, so users return to their original arm when the experiment resumes. Requires `experiment:manage` on the owning account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.experiments.pause(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The experiment identifier — the `expt_` id or the flag_key handle.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Owning account ID. Required when id is a flag key; optional for an expt_ ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Exports
<details><summary><code>client.exports.<a href="/Sources/Resources/Exports/ExportsClient.swift">list</a>(accountId: String?, resource: ListExportsRequestResource?, status: ListExportsRequestStatus?, createdAfter: String?, createdBefore: String?, order: ListExportsRequestOrder?, direction: ListExportsRequestDirection?, requestOptions: RequestOptions?) -> ListExportsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the exports requested for an account, newest first. Only exports of resources the credential is allowed to export are returned.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.exports.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — The account to list exports for, prefixed `biz_`. Defaults to the credential's account.
    
</dd>
</dl>

<dl>
<dd>

**resource:** `ListExportsRequestResource?` — Only return exports of this resource.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListExportsRequestStatus?` — Only return exports in this status.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only return exports created at or after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only return exports created at or before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListExportsRequestOrder?` — The field to sort by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListExportsRequestDirection?` — The sort direction.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.exports.<a href="/Sources/Resources/Exports/ExportsClient.swift">create</a>(request: Requests.CreateExportsRequest, requestOptions: RequestOptions?) -> Export</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Starts an asynchronous export of a resource for an account. Returns the export in `pending`; poll `GET /exports/:id` until `download_url` is set.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.exports.create(request: .init(resource: .adCampaigns))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateExportsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.exports.<a href="/Sources/Resources/Exports/ExportsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Export</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Fetches an export's status and, once complete, its download link.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.exports.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The export ID, prefixed `exprt_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## External Accounts
<details><summary><code>client.externalAccounts.<a href="/Sources/Resources/ExternalAccounts/ExternalAccountsClient.swift">list</a>(accountId: String?, userId: String?, platform: ListExternalAccountsRequestPlatform?, trustLevel: ListExternalAccountsRequestTrustLevel?, verified: Bool?, scopes: [ListExternalAccountsRequestScopesItem]?, first: Int?, after: String?, last: Int?, before: String?, order: ListExternalAccountsRequestOrder?, direction: ListExternalAccountsRequestDirection?, requestOptions: RequestOptions?) -> ListExternalAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the external accounts linked to an account or user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.externalAccounts.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — The Account that the external accounts are connected to. Provide either this or user_id.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — The User that the external accounts are connected to. Provide either this or account_id.
    
</dd>
</dl>

<dl>
<dd>

**platform:** `ListExternalAccountsRequestPlatform?` — Only return external accounts for the platform that is specified. An `aimerce` account is returned only with this filter, which requires the `company:manage_checkout` scope instead of `social_account:read`.
    
</dd>
</dl>

<dl>
<dd>

**trustLevel:** `ListExternalAccountsRequestTrustLevel?` — Only return external accounts linked with this trust level, such as `oauth` for accounts connected through OAuth.
    
</dd>
</dl>

<dl>
<dd>

**verified:** `Bool?` — Only return external accounts that are verified on the platform.
    
</dd>
</dl>

<dl>
<dd>

**scopes:** `[ListExternalAccountsRequestScopesItem]?` — Only return external accounts that have these scopes.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListExternalAccountsRequestOrder?` — The field to sort external accounts by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListExternalAccountsRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.externalAccounts.<a href="/Sources/Resources/ExternalAccounts/ExternalAccountsClient.swift">create</a>(request: CreateExternalAccountsRequestBody, requestOptions: RequestOptions?) -> ExternalAccount</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates or returns a Whop-managed TikTok account for an account, or connects the account's existing Klaviyo account with a private API key. Whop no longer creates Facebook pages.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.externalAccounts.create(request: CreateExternalAccountsRequestBody.facebook(
        CreateExternalAccountsRequestBodyFacebook(

        )
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `CreateExternalAccountsRequestBody` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.externalAccounts.<a href="/Sources/Resources/ExternalAccounts/ExternalAccountsClient.swift">connect</a>(request: Requests.ConnectExternalAccountsRequest, requestOptions: RequestOptions?) -> ConnectExternalAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Starts an OAuth connection flow and returns an `authorize_url` to send the user to, where they connect an external account. Personal profile connections must be completed in a browser signed in as the Whop user who started the flow.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.externalAccounts.connect(request: .init(
        platform: .tiktok,
        redirectUrl: "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/settings"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.ConnectExternalAccountsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.externalAccounts.<a href="/Sources/Resources/ExternalAccounts/ExternalAccountsClient.swift">delete</a>(id: String, accountId: String?, userId: String?, requestOptions: RequestOptions?) -> DeleteExternalAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Disconnects an external account from an account or user without deleting the underlying platform account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.externalAccounts.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the external account to disconnect.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — The Account that the external account is connected to. Provide either this or user_id.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — The User that the external account is connected to. Provide either this or account_id.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.externalAccounts.<a href="/Sources/Resources/ExternalAccounts/ExternalAccountsClient.swift">refresh</a>(id: String, request: Requests.RefreshExternalAccountsRequest, requestOptions: RequestOptions?) -> ExternalAccount</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Refreshes the state of an external account. Use it to clear an `error` that has been resolved.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.externalAccounts.refresh(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The external account (a sacc_ identifier) to refresh.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.RefreshExternalAccountsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## FeeMarkups
<details><summary><code>client.feeMarkups.<a href="/Sources/Resources/FeeMarkups/FeeMarkupsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, accountId: String, requestOptions: RequestOptions?) -> ListFeeMarkupsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the fee markups configured for an account. For a platform account, returns the platform's default markups.

Required permissions:
 - `company:update_child_fees`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.feeMarkups.list(
        first: 42,
        last: 42,
        accountId: "biz_xxxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String` — The unique identifier of the company to list fee markups for. Pass a platform account identifier to retrieve platform default markups.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.feeMarkups.<a href="/Sources/Resources/FeeMarkups/FeeMarkupsClient.swift">create</a>(request: Requests.CreateFeeMarkupsRequest, requestOptions: RequestOptions?) -> FeeMarkup</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates or updates an account's markup for one fee type. If the account already has a markup for that `fee_type`, it is updated with the new values.

Required permissions:
 - `company:update_child_fees`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.feeMarkups.create(request: .init(
        accountId: "biz_xxxxxxxxxxxxxx",
        feeType: .cryptoWithdrawalMarkup
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateFeeMarkupsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.feeMarkups.<a href="/Sources/Resources/FeeMarkups/FeeMarkupsClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a fee markup, removing the custom fee override so the account reverts to its parent account's default fees.

Required permissions:
 - `company:update_child_fees`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.feeMarkups.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the fee markup to delete.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## FeedbackSubmissions
<details><summary><code>client.feedbackSubmissions.<a href="/Sources/Resources/FeedbackSubmissions/FeedbackSubmissionsClient.swift">create</a>(request: Requests.CreateFeedbackSubmissionsRequest, requestOptions: RequestOptions?) -> CreateFeedbackSubmissionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Submits an issue or an unanswered question to Whop for review, recorded under the authenticated user, account, or app. Returns a receipt once the submission is accepted; processing is asynchronous and no reply is sent.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.feedbackSubmissions.create(request: .init(
        content: "The docs omit the required permission",
        source: .mcpReportFeedback
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateFeedbackSubmissionsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Files
<details><summary><code>client.files.<a href="/Sources/Resources/Files/FilesClient.swift">list</a>(fileIds: [String]?, order: ListFilesRequestOrder?, direction: ListFilesRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListFilesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the files with the given IDs, newest first — fetch a batch in one request instead of retrieving each file individually. Only files you created are returned; IDs that do not exist, or that another credential created, are omitted. For a batch larger than one page, follow `page_info` with the same `file_ids` to walk the rest.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.files.list(fileIds: [
        "file_xxxxxxxxxxxxx"
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**fileIds:** `[String]?` — The files to return, each prefixed `file_`. Repeat the parameter to pass several, up to 250 per request. Batches of up to 100 answer in one page by default; larger batches page at up to 100 per response.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListFilesRequestOrder?` — The field to sort by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListFilesRequestDirection?` — The sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.files.<a href="/Sources/Resources/Files/FilesClient.swift">create</a>(request: Requests.CreateFilesRequest, requestOptions: RequestOptions?) -> File</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a file and returns a presigned destination to upload its bytes to. PUT the bytes to `upload_url` (single-part), or to each of `multipart_upload_urls` and then call Complete File Multipart Upload. Once the bytes land the file becomes `ready`, and its ID can be attached wherever a file is accepted — account legal documents, dispute evidence documents. For a step-by-step walkthrough of single-part and multipart uploads, see the [direct file uploads guide](/developer/guides/direct-file-uploads).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.files.create(request: .init(filename: "terms.pdf"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateFilesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.files.<a href="/Sources/Resources/Files/FilesClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> File</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a file you uploaded — poll it after uploading the bytes to see `upload_status` become `ready`. Only the creator can retrieve a file this way; a file attached to another resource is read through that resource.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.files.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the file, prefixed `file_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.files.<a href="/Sources/Resources/Files/FilesClient.swift">complete</a>(id: String, request: Requests.CompleteFilesRequest, requestOptions: RequestOptions?) -> File</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Assembles the parts of a multipart upload after every part has been PUT to its presigned URL. Pass the `multipart_upload_id` from Create File and each part's `ETag` response header. For a step-by-step walkthrough of multipart uploads, see the [direct file uploads guide](/developer/guides/direct-file-uploads).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.files.complete(
        id: "id",
        request: .init(
            multipartParts: [
                CompleteFilesRequestMultipartPartsItem(
                    etag: "etag-1",
                    partNumber: 1
                )
            ],
            multipartUploadId: "upload-id"
        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the file, prefixed `file_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.CompleteFilesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## FinancialActivity
<details><summary><code>client.financialActivity.<a href="/Sources/Resources/FinancialActivity/FinancialActivityClient.swift">list</a>(accountId: String?, userId: String?, includeOwnedAccounts: Bool?, includeResource: Bool?, lineTypes: [ListFinancialActivityRequestLineTypesItem]?, direction: ListFinancialActivityRequestDirection?, resourceId: String?, paymentId: String?, activityId: String?, excludeInternalMovements: Bool?, balanceType: ListFinancialActivityRequestBalanceType?, withdrawalId: String?, currency: String?, postedAfter: Date?, postedBefore: Date?, availableAfter: CalendarDate?, availableBefore: CalendarDate?, limit: Int?, cursor: String?, requestOptions: RequestOptions?) -> ListFinancialActivityResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns an account's or user's activity feed: every movement of money in or out.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.financialActivity.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — The owning account ID (a biz_ identifier). Provide this or user_id.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — The owning user ID (a user_ identifier). Provide this or account_id.
    
</dd>
</dl>

<dl>
<dd>

**includeOwnedAccounts:** `Bool?` — When true, aggregates the authenticated user's personal ledger with the businesses they own (owner role with balance read) into one feed. Requires user_id to be the authenticated user; cannot be combined with account_id or the settlement-date filters. Each returned row includes the owning `account`.
    
</dd>
</dl>

<dl>
<dd>

**includeResource:** `Bool?` — Whether to include the `resource` field in the response or not. Consider passing `false` if you need a fast response without as many rich details.
    
</dd>
</dl>

<dl>
<dd>

**lineTypes:** `[ListFinancialActivityRequestLineTypesItem]?` — Optional ledger line categories to include. Some categories (for example `onchain_deposit`, which covers inbound crypto deposits such as MoonPay onramps) are only returned when explicitly requested here.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListFinancialActivityRequestDirection?` — Optional direction filter. `money_in` returns positive activity and `money_out` returns negative activity.
    
</dd>
</dl>

<dl>
<dd>

**resourceId:** `String?` — Optional prefixed resource ID. Returns activity associated with that resource.
    
</dd>
</dl>

<dl>
<dd>

**paymentId:** `String?` — Filter activity by payment ID (pay_), including related refunds, disputes, and fees. Combines with resource_id and other filters within the selected accounts. Unknown payments return an empty list.
    
</dd>
</dl>

<dl>
<dd>

**activityId:** `String?` — Optional ledger activity ID (for example `line_3`). Returns at most that one activity.
    
</dd>
</dl>

<dl>
<dd>

**excludeInternalMovements:** `Bool?` — Whether to exclude balance reservations and balanced movements between the account's own balances.
    
</dd>
</dl>

<dl>
<dd>

**balanceType:** `ListFinancialActivityRequestBalanceType?` — Which balance the activity changes. `total` includes available, pending, and reserved funds. `available` includes only movements into or out of available funds, including reservations, releases, and fees. Movements within the selected balance are omitted. Omit to preserve the existing activity feed. Requires account_id or user_id; cannot be combined with available_after or available_before.
    
</dd>
</dl>

<dl>
<dd>

**withdrawalId:** `String?` — Withdrawal ID (wdrl_). With balance_type=available, selects the same period as its statement, after the previous withdrawal and through this withdrawal, excluding this withdrawal and its fee. Requires a single account. Overrides currency and posted-date filters.
    
</dd>
</dl>

<dl>
<dd>

**currency:** `String?` — Optional currency code filter, for example `usd`.
    
</dd>
</dl>

<dl>
<dd>

**postedAfter:** `Date?` — Only include rows posted after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**postedBefore:** `Date?` — Only include rows posted before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**availableAfter:** `CalendarDate?` — Only include balance credits and debits available on or after this `YYYY-MM-DD` date (UTC), distinct from posted_at. Requires currency.
    
</dd>
</dl>

<dl>
<dd>

**availableBefore:** `CalendarDate?` — Only include balance credits and debits available on or before this `YYYY-MM-DD` date (UTC). Set equal to available_after for a single day. Requires currency.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Int?` — Maximum number of rows to return.
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String?` — Cursor returned by the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## FinancialReports
<details><summary><code>client.financialReports.<a href="/Sources/Resources/FinancialReports/FinancialReportsClient.swift">retrieve</a>(accountId: String, reportType: RetrieveFinancialReportsRequestReportType, currency: String?, inCurrency: String?, from: Date?, to: Date?, groupBy: RetrieveFinancialReportsRequestGroupBy?, timezone: String?, lineTypes: [RetrieveFinancialReportsRequestLineTypesItem]?, direction: RetrieveFinancialReportsRequestDirection?, includePaymentFeeBreakdown: Bool?, periodOnlyCurrencies: Bool?, requestOptions: RequestOptions?) -> RetrieveFinancialReportsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a financial report — balance activity, income statement, or balance summary — for an account over a date range.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.financialReports.retrieve(
        accountId: "account_id",
        reportType: .balanceSummary
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — The account that owns the report, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**reportType:** `RetrieveFinancialReportsRequestReportType` — The type of financial report to generate.
    
</dd>
</dl>

<dl>
<dd>

**currency:** `String?` — Filter rows to this currency, for example `usd`. Defaults to `usd` unless `in_currency` is provided.
    
</dd>
</dl>

<dl>
<dd>

**inCurrency:** `String?` — Aggregate all activity into this display currency via FX conversion.
    
</dd>
</dl>

<dl>
<dd>

**from:** `Date?` — Start of the report window as an ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**to:** `Date?` — Exclusive end of the report window as an ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**groupBy:** `RetrieveFinancialReportsRequestGroupBy?` — Grouping granularity for report rows. Hourly grouping is supported for account-level balance activity reports only; hourly periods are timestamps in the requested timezone.
    
</dd>
</dl>

<dl>
<dd>

**timezone:** `String?` — IANA timezone (for example `America/New_York`) used to bucket report periods. Defaults to UTC. `from` and `to` remain exact instants.
    
</dd>
</dl>

<dl>
<dd>

**lineTypes:** `[RetrieveFinancialReportsRequestLineTypesItem]?` — Account-level balance activity only: ledger line categories to include.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `RetrieveFinancialReportsRequestDirection?` — Account-level balance activity only: include money moving in or money moving out.
    
</dd>
</dl>

<dl>
<dd>

**includePaymentFeeBreakdown:** `Bool?` — Balance activity only: include payment costs grouped by payment method and provider.
    
</dd>
</dl>

<dl>
<dd>

**periodOnlyCurrencies:** `Bool?` — Account-level balance activity only: return only currencies with cashflow in the exact requested window. Requires `from` and `to`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Financing Applications
<details><summary><code>client.financingApplications.<a href="/Sources/Resources/FinancingApplications/FinancingApplicationsClient.swift">list</a>(accountId: String?, status: ListFinancingApplicationsRequestStatus?, createdBefore: String?, createdAfter: String?, order: ListFinancingApplicationsRequestOrder?, direction: ListFinancingApplicationsRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListFinancingApplicationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists payment-financing applications. Without `account_id`, an account credential lists its own account and its direct subaccounts, but not deeper descendants, and a user credential lists every account it can read applications for.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.financingApplications.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Only applications for this account, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListFinancingApplicationsRequestStatus?` — Only applications in this review state.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Applications created at or before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Applications created at or after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListFinancingApplicationsRequestOrder?` — Field to sort by. Defaults to created_at.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListFinancingApplicationsRequestDirection?` — Sort direction. Defaults to desc.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.financingApplications.<a href="/Sources/Resources/FinancingApplications/FinancingApplicationsClient.swift">create</a>(request: Requests.CreateFinancingApplicationsRequest, requestOptions: RequestOptions?) -> FinancingApplication</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Starts an application for payment-financing approval, or returns the account's open one: an application in `awaiting_review` takes precedence over one in `requires_collection`, and the open application is reused across different `Idempotency-Key` values. Creating an application does not submit it for review. The account must have a Whop balance set up, and accounts in restricted industries cannot apply. Once an application closes, the account can apply again.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.financingApplications.create(request: .init())
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateFinancingApplicationsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.financingApplications.<a href="/Sources/Resources/FinancingApplications/FinancingApplicationsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> FinancingApplication</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a payment-financing application with its review state, requirements, saved answers, documents, current terms, and review feedback. Requires read access to the account that owns it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.financingApplications.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Financing application ID, prefixed `inrq_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.financingApplications.<a href="/Sources/Resources/FinancingApplications/FinancingApplicationsClient.swift">update</a>(id: String, request: Requests.UpdateFinancingApplicationsRequest, requestOptions: RequestOptions?) -> FinancingApplication</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Saves merchant answers to an application in `requires_collection`. The batch is atomic: if any answer is rejected, none are saved. Omitted requirements and answer fields are left unchanged. Saving answers does not submit the application; call Submit Financing Application when it is complete.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.financingApplications.update(
        id: "id",
        request: .init(answers: [
            UpdateFinancingApplicationsRequestAnswersItem(
                requirementId: "inrqi_xxxxxxxxxxxxxx"
            )
        ])
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Financing application ID, prefixed `inrq_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateFinancingApplicationsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.financingApplications.<a href="/Sources/Resources/FinancingApplications/FinancingApplicationsClient.swift">submit</a>(id: String, request: Requests.SubmitFinancingApplicationsRequest, requestOptions: RequestOptions?) -> FinancingApplication</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Submits a complete application for financing review, recording the merchant's acceptance, who submitted, and when, then moving it to `awaiting_review`. Before calling, present the application's `terms.content`, policies, and disclosure to the merchant and collect affirmative acceptance; every resubmission needs acceptance again. Only an application in `requires_collection` can be submitted, including after a reviewer requests more information. Retry with the same `Idempotency-Key`: submitting an application already in review without a replay returns an error. Approval does not by itself enable financing payment methods.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.financingApplications.submit(
        id: "id",
        request: .init(merchantAcceptance: SubmitFinancingApplicationsRequestMerchantAcceptance(
            accepted: true,
            termsVersion: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
        ))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Financing application ID, prefixed `inrq_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.SubmitFinancingApplicationsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## ForumPosts
<details><summary><code>client.forumPosts.<a href="/Sources/Resources/ForumPosts/ForumPostsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, experienceId: String, includeBountyAnchors: Bool?, parentId: String?, pinned: Bool?, requestOptions: RequestOptions?) -> ListForumPostsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of forum posts within a specific experience, with optional filtering by parent post or pinned status.

Required permissions:
 - `forum:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.forumPosts.list(
        first: 42,
        last: 42,
        experienceId: "exp_xxxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**experienceId:** `String` — The unique identifier of the experience to list forum posts for.
    
</dd>
</dl>

<dl>
<dd>

**includeBountyAnchors:** `Bool?` — Whether to include top-level bounty discussion anchors as rich forum items.
    
</dd>
</dl>

<dl>
<dd>

**parentId:** `String?` — The unique identifier of a parent post to list comments for. When set, returns replies to that post.
    
</dd>
</dl>

<dl>
<dd>

**pinned:** `Bool?` — Whether to filter for only pinned posts. Set to true to return only pinned posts.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.forumPosts.<a href="/Sources/Resources/ForumPosts/ForumPostsClient.swift">create</a>(request: Requests.CreateForumPostsRequest, requestOptions: RequestOptions?) -> ForumPost</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new forum post or comment within an experience. Supports text content, attachments, polls, paywalling, and pinning.

Required permissions:
 - `forum:post:create`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.forumPosts.create(request: .init(experienceId: "exp_xxxxxxxxxxxxxx"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateForumPostsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.forumPosts.<a href="/Sources/Resources/ForumPosts/ForumPostsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> ForumPost</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing forum post.

Required permissions:
 - `forum:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.forumPosts.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the forum post to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.forumPosts.<a href="/Sources/Resources/ForumPosts/ForumPostsClient.swift">update</a>(id: String, request: Requests.UpdateForumPostsRequest, requestOptions: RequestOptions?) -> ForumPost</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Edit the content, attachments, pinned status, or visibility of an existing forum post or comment.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.forumPosts.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the forum post to update.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateForumPostsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Forums
<details><summary><code>client.forums.<a href="/Sources/Resources/Forums/ForumsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, productId: String?, accountId: String, requestOptions: RequestOptions?) -> ListForumsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of forums for an account, with optional filtering by product.

Required permissions:
 - `forum:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.forums.list(
        first: 42,
        last: 42,
        productId: "prod_xxxxxxxxxxxxx",
        accountId: "biz_xxxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**productId:** `String?` — The unique identifier of a product to filter by. When set, only forums connected to this product are returned.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String` — The unique identifier of the company to list forums for.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.forums.<a href="/Sources/Resources/Forums/ForumsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Forum</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing forum.

Required permissions:
 - `forum:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.forums.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the forum or experience to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.forums.<a href="/Sources/Resources/Forums/ForumsClient.swift">update</a>(id: String, request: Requests.UpdateForumsRequest, requestOptions: RequestOptions?) -> Forum</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update moderation and notification settings for a forum, such as who can post, who can comment, and email notification preferences.

Required permissions:
 - `forum:moderate`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.forums.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the forum to update. Accepts either an experience ID (e.g. 'exp_xxxxx') or a forum ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateForumsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## IdentityProfiles
<details><summary><code>client.identityProfiles.<a href="/Sources/Resources/IdentityProfiles/IdentityProfilesClient.swift">listIdentityProfile</a>(after: String?, before: String?, first: Int?, last: Int?, profileType: IdentityProfileKinds?, status: IdentityProfileStatuses?, accountId: String?, requestOptions: RequestOptions?) -> ListIdentityProfileResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the identity profiles currently linked to an account, or to every account you can read when `account_id` is omitted.

Required permissions:
 - `identity:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.identityProfiles.listIdentityProfile(
        first: 42,
        last: 42,
        accountId: "biz_xxxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**profileType:** `IdentityProfileKinds?` 
    
</dd>
</dl>

<dl>
<dd>

**status:** `IdentityProfileStatuses?` 
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Account to list identity profiles for, prefixed `biz_`. Omit to list profiles across every account you can read, including child accounts under a parent and, with a user credential, your own user.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.identityProfiles.<a href="/Sources/Resources/IdentityProfiles/IdentityProfilesClient.swift">retrieveIdentityProfile</a>(id: String, requestOptions: RequestOptions?) -> IdentityProfile</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing identity profile.

Required permissions:
 - `identity:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.identityProfiles.retrieveIdentityProfile(id: "idpf_xxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the identity profile (idpf_xxx).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.identityProfiles.<a href="/Sources/Resources/IdentityProfiles/IdentityProfilesClient.swift">unlinkIdentityProfile</a>(id: String, ledgerAccountId: String, requestOptions: RequestOptions?) -> IdentityProfile</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Unlinks an identity profile from the account or user that owns `ledger_account_id`. Requires `identity:write` on that account or user.

Required permissions:
 - `identity:write`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.identityProfiles.unlinkIdentityProfile(
        id: "idpf_xxxxxxxxxxxxx",
        ledgerAccountId: "ldgr_xxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the IdentityProfile to unlink.
    
</dd>
</dl>

<dl>
<dd>

**ledgerAccountId:** `String` — The ID of the LedgerAccount to unlink the identity profile from.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.identityProfiles.<a href="/Sources/Resources/IdentityProfiles/IdentityProfilesClient.swift">listVerificationsIdentityProfile</a>(id: String, after: String?, before: String?, first: Int?, last: Int?, requestOptions: RequestOptions?) -> ListVerificationsIdentityProfileResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a list of verifications attached to an identity profile, ordered by most recent first.

Required permissions:
 - `identity:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.identityProfiles.listVerificationsIdentityProfile(
        id: "idpf_xxxxxxxxxxxxx",
        first: 42,
        last: 42
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the identity profile (idpf_xxx).
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Invoices
<details><summary><code>client.invoices.<a href="/Sources/Resources/Invoices/InvoicesClient.swift">list</a>(accountId: String?, status: ListInvoicesRequestStatus?, overdue: Bool?, scheduled: Bool?, memberId: String?, productId: String?, createdAfter: Date?, createdBefore: Date?, order: ListInvoicesRequestOrder?, direction: ListInvoicesRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, includeTotalCount: Bool?, requestOptions: RequestOptions?) -> ListInvoicesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists receipt-backed invoices for accounts the caller can read. Legacy invoices are excluded.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.invoices.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListInvoicesRequestStatus?` 
    
</dd>
</dl>

<dl>
<dd>

**overdue:** `Bool?` 
    
</dd>
</dl>

<dl>
<dd>

**scheduled:** `Bool?` — Set to `true` for drafts with a scheduled send, which are the invoices with a `scheduled_send_at`. Set to `false` for every other invoice. Only a `draft` can be scheduled. An `open` invoice is not scheduled, even with a `scheduled_charge_at`. A draft that sends on its due date (`sends_on_due_date`) is not scheduled. Omit to include both.
    
</dd>
</dl>

<dl>
<dd>

**memberId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**productId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` 
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` 
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListInvoicesRequestOrder?` — Field to sort by. Sorting by `due_at` or `scheduled_send_at` puts invoices without that date last in both directions.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListInvoicesRequestDirection?` 
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**includeTotalCount:** `Bool?` — Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.invoices.<a href="/Sources/Resources/Invoices/InvoicesClient.swift">create</a>(request: Requests.CreateInvoicesRequest, requestOptions: RequestOptions?) -> Invoice</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a draft invoice backed by a receipt, with saved items, quantities, prices, and recipients. Issue the draft to resolve final tax and open the invoice. The pay_ ID stays the same when paid. Needs `invoice:create` or `payment:charge`; a `payment_method_id` needs `payment:charge`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.invoices.create(request: .init(
        accountId: "biz_xxxxxxxxxxxxxx",
        items: [
            CreateInvoicesRequestItemsItem(

            )
        ]
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateInvoicesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.invoices.<a href="/Sources/Resources/Invoices/InvoicesClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Invoice</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a receipt-backed invoice by its pay_ ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.invoices.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The invoice's pay_ ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.invoices.<a href="/Sources/Resources/Invoices/InvoicesClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> DeleteInvoicesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a draft or void invoice. A deleted invoice no longer appears in invoice or payment lists, and its ID returns a `404`. Deleting can't be undone. Void an open invoice before you delete it. A draft with a scheduled send or charge must be unscheduled first. A draft renewal invoice can't be deleted, and neither can a void invoice that collected money or still awaits a bank wire. The invoice's `deletable` field is `true` when this call can delete it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.invoices.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The invoice's pay_ ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.invoices.<a href="/Sources/Resources/Invoices/InvoicesClient.swift">update</a>(id: String, request: Requests.UpdateInvoicesRequest, requestOptions: RequestOptions?) -> Invoice</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates draft invoice items and billing fields. Updates of only `recipient_emails` and `memo` are also allowed on unpaid invoices. The customer is set when the draft is created and can't change. To bill someone else, first void the draft. Then create a new invoice. Edit customer contact details through the member API. A draft with no saved payment method and no scheduled send needs `invoice:update`, `invoice:create`, or `payment:charge`; every other update, and setting `payment_method_id`, needs `payment:charge`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.invoices.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The invoice's pay_ ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateInvoicesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.invoices.<a href="/Sources/Resources/Invoices/InvoicesClient.swift">charge</a>(id: String, request: Requests.ChargeInvoicesRequest, requestOptions: RequestOptions?) -> Invoice</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Charges an open invoice now to one of its customer's saved payment methods, canceling any charge scheduled for later. The charge completes asynchronously: the invoice becomes `paid`, or, if declined, stays `open` and its recipients are emailed the `checkout_link`. Refused for drafts and while another payment is in progress.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.invoices.charge(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The invoice's pay_ ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ChargeInvoicesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.invoices.<a href="/Sources/Resources/Invoices/InvoicesClient.swift">generatePdf</a>(id: String, request: Requests.GeneratePdfInvoicesRequest, requestOptions: RequestOptions?) -> InvoicePdf</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Generates the invoice as a PDF and returns a short-lived link to download it. A draft shows its estimated totals. The buyer's name and email need `member:basic:read` and `member:email:read`, and the Pay now link on an open invoice needs `payment:charge`, or `invoice:create` or `invoice:update` when it has no `payment_method_id`. Each call generates a new file and link, so this endpoint does not replay `Idempotency-Key` responses.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.invoices.generatePdf(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The invoice's pay_ ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.GeneratePdfInvoicesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.invoices.<a href="/Sources/Resources/Invoices/InvoicesClient.swift">issue</a>(id: String, request: Requests.IssueInvoicesRequest, requestOptions: RequestOptions?) -> Invoice</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Resolves final tax and opens a draft invoice without emailing it. An invoice with a `payment_method_id` is charged to it off-session, as `POST /payments` charges a saved payment method: at `charge_at` if given, otherwise on `due_at` while it is still ahead, otherwise right away (see `scheduled_charge_at`). With a future `due_at` and no `charge_at`, the customer is charged on the due date without being emailed first. Issuing an open invoice again retains its totals and charges nothing.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.invoices.issue(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The invoice's pay_ ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.IssueInvoicesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.invoices.<a href="/Sources/Resources/Invoices/InvoicesClient.swift">markUncollectible</a>(id: String, requestOptions: RequestOptions?) -> Invoice</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Marks an open invoice as uncollectible. Its checkout link stops working.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.invoices.markUncollectible(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The invoice's pay_ ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.invoices.<a href="/Sources/Resources/Invoices/InvoicesClient.swift">send</a>(id: String, request: Requests.SendInvoicesRequest, requestOptions: RequestOptions?) -> Invoice</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Issues a draft and emails it to its recipients, with reminders after the due date. A draft with no `payment_method_id` needs `invoice:update`, `invoice:create`, or `payment:charge`, and is never charged. A draft with a `payment_method_id` needs `payment:charge`: with a `charge_at`, or when its `due_at` is still ahead, it is emailed now and charged to that method at that time (see `scheduled_charge_at`); otherwise it is charged right away instead of emailed. Voiding the invoice, marking it uncollectible, or paying it first cancels the scheduled charge, and its recipients get the payment link if a charge fails. Sending an open invoice needs `payment:charge` and emails it again, up to three emails a day including the first send. With `send_at`, the draft is sent at that time instead, and cannot be edited, except its recipients, until it is sent or unscheduled. Each email, reminders included, is sent separately to the customer email shown on the invoice and to each address in `recipient_emails`, so recipients never see each other's addresses.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.invoices.send(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The invoice's pay_ ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.SendInvoicesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.invoices.<a href="/Sources/Resources/Invoices/InvoicesClient.swift">unschedule</a>(id: String, requestOptions: RequestOptions?) -> Invoice</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cancels a draft's scheduled send, so it can be edited again. An invoice with no scheduled send is returned unchanged. A draft with no `payment_method_id` needs `invoice:update`, `invoice:create`, or `payment:charge`; any other invoice needs `payment:charge`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.invoices.unschedule(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The invoice's pay_ ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.invoices.<a href="/Sources/Resources/Invoices/InvoicesClient.swift">void</a>(id: String, requestOptions: RequestOptions?) -> Invoice</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Voids a draft or unpaid invoice.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.invoices.void(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The invoice's pay_ ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## LedgerAccounts
<details><summary><code>client.ledgerAccounts.<a href="/Sources/Resources/LedgerAccounts/LedgerAccountsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> LedgerAccount</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing ledger account.

Required permissions:
 - `company:balance:read`
 - `payout:account:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.ledgerAccounts.retrieve(id: "ldgr_xxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The identifier to look up the ledger account. Accepts a user ID ('user_xxx'), company ID ('biz_xxx'), or ledger account ID ('ldgr_xxx').
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Livestreams
<details><summary><code>client.livestreams.<a href="/Sources/Resources/Livestreams/LivestreamsClient.swift">list</a>(experienceId: String, pinned: Bool?, recorded: Bool?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListLivestreamsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the livestreams in an experience, live and ended, newest first.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.livestreams.list(experienceId: "experience_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**experienceId:** `String` — ID of a livestreams experience, prefixed `exp_`.
    
</dd>
</dl>

<dl>
<dd>

**pinned:** `Bool?` — When `true`, only pinned livestreams, most recently pinned first. When `false`, only livestreams that are not pinned.
    
</dd>
</dl>

<dl>
<dd>

**recorded:** `Bool?` — When `true`, only ended livestreams that were recorded, including recordings still processing. `false` or omitted lists every livestream.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.livestreams.<a href="/Sources/Resources/Livestreams/LivestreamsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Livestream</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a livestream by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.livestreams.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Livestream ID, prefixed `lfeed_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.livestreams.<a href="/Sources/Resources/Livestreams/LivestreamsClient.swift">pin</a>(id: String, requestOptions: RequestOptions?) -> Livestream</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Pins an ended livestream's recording so everyone in the experience sees it featured. Pinning it again keeps the original `pinned_at`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.livestreams.pin(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Livestream ID, prefixed `lfeed_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.livestreams.<a href="/Sources/Resources/Livestreams/LivestreamsClient.swift">unpin</a>(id: String, requestOptions: RequestOptions?) -> Livestream</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Unpins a livestream's recording so it is no longer featured in the experience.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.livestreams.unpin(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Livestream ID, prefixed `lfeed_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Media
<details><summary><code>client.media.<a href="/Sources/Resources/Media/MediaClient.swift">generate</a>(request: Requests.GenerateMediaRequest, requestOptions: RequestOptions?) -> MediaAsset</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Starts an AI media generation job billed from the account's balance. Generation is asynchronous — poll `GET /media/{id}` until the asset is `ready`, then use `file.id` anywhere attachments are accepted.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.media.generate(request: .init(
        prompt: "A 9:16 product showcase of a cordless power scrubber",
        type: .video
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.GenerateMediaRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.media.<a href="/Sources/Resources/Media/MediaClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> MediaAsset</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a media asset by ID. Poll this while the asset is `processing`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.media.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Media asset ID, prefixed `media_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Members
<details><summary><code>client.members.<a href="/Sources/Resources/Members/MembersClient.swift">list</a>(accountId: String?, accessLevel: ListMembersRequestAccessLevel?, status: ListMembersRequestStatus?, userIds: [String]?, mostRecentActions: [ListMembersRequestMostRecentActionsItem]?, membershipStatus: ListMembersRequestMembershipStatus?, productIds: [String]?, variantIds: [String]?, promoCodeIds: [String]?, query: String?, createdAfter: String?, createdBefore: String?, order: ListMembersRequestOrder?, direction: ListMembersRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, includeTotalCount: Bool?, requestOptions: RequestOptions?) -> ListMembersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the members of an account. A member is one buyer's relationship with the account, regardless of how many memberships they hold.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.members.list(
        userIds: [
            "user_xxxxxxxxxxxxxx"
        ],
        productIds: [
            "prod_xxxxxxxxxxxxx"
        ],
        variantIds: [
            "plan_xxxxxxxxxxxxx"
        ],
        promoCodeIds: [
            "promo_xxxxxxxxxxxx"
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — The account to list members for (`biz_` tag). Defaults to the account the credential acts as.
    
</dd>
</dl>

<dl>
<dd>

**accessLevel:** `ListMembersRequestAccessLevel?` — Filter by what the member can reach on the account.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListMembersRequestStatus?` — Filter by whether the member is still part of the account.
    
</dd>
</dl>

<dl>
<dd>

**userIds:** `[String]?` — Only return members whose users match these `user_` identifiers.
    
</dd>
</dl>

<dl>
<dd>

**mostRecentActions:** `[ListMembersRequestMostRecentActionsItem]?` — Only return members whose `most_recent_action` is one of these values.
    
</dd>
</dl>

<dl>
<dd>

**membershipStatus:** `ListMembersRequestMembershipStatus?` — `active` returns members holding at least one membership that currently grants access; `inactive` returns members holding at least one membership that does not. Combined with `product_ids`, `variant_ids`, or `promo_code_ids`, one membership must match all of them.
    
</dd>
</dl>

<dl>
<dd>

**productIds:** `[String]?` — Only return members holding a membership to one of these products, prefixed `prod_`. Unknown IDs match nothing.
    
</dd>
</dl>

<dl>
<dd>

**variantIds:** `[String]?` — Only return members holding a membership on one of these variants, prefixed `plan_`. Unknown IDs match nothing.
    
</dd>
</dl>

<dl>
<dd>

**promoCodeIds:** `[String]?` — Only return members holding a membership bought with one of these promo codes, prefixed `promo_`. Unknown IDs match nothing.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Search members by name or username. An exact email address also matches when the credential holds the member:email:read scope.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only members who joined after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only members who joined before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListMembersRequestOrder?` — Sort field. `most_recent_action_at` and `last_activity_at` place members without one first when ascending and last when descending.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListMembersRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**includeTotalCount:** `Bool?` — Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.members.<a href="/Sources/Resources/Members/MembersClient.swift">create</a>(request: Requests.CreateMembersRequest, requestOptions: RequestOptions?) -> Member</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds a person to an account as a member. If the person is already a member of the account, that member is returned unchanged.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.members.create(request: .init(email: "jane@example.com"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateMembersRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.members.<a href="/Sources/Resources/Members/MembersClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Member</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a member by ID. Accessible to the account and to the member's own user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.members.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Member ID (`mber_` tag).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.members.<a href="/Sources/Resources/Members/MembersClient.swift">update</a>(id: String, request: Requests.UpdateMembersRequest, requestOptions: RequestOptions?) -> Member</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a member.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.members.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Member ID (`mber_` tag).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateMembersRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.members.<a href="/Sources/Resources/Members/MembersClient.swift">unsubscribe</a>(id: String, token: String, requestOptions: RequestOptions?) -> Void</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Unsubscribes a member from the account's marketing communications with the token from their unsubscribe link. Inboxes post here directly for one-click unsubscribe (RFC 8058).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.members.unsubscribe(
        id: "id",
        token: "token"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The member to unsubscribe, prefixed `mber_`.
    
</dd>
</dl>

<dl>
<dd>

**token:** `String` — The token from the member's unsubscribe link.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Memberships
<details><summary><code>client.memberships.<a href="/Sources/Resources/Memberships/MembershipsClient.swift">list</a>(accountId: String?, userId: String?, memberId: String?, externalAccount: String?, status: ListMembershipsRequestStatus?, statuses: [ListMembershipsRequestStatusesItem]?, productId: String?, productIds: [String]?, variantId: String?, variantIds: [String]?, promoCodeIds: [String]?, createdAfter: String?, createdBefore: String?, order: ListMembershipsRequestOrder?, direction: ListMembershipsRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, includeTotalCount: Bool?, requestOptions: RequestOptions?) -> ListMembershipsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists every membership the caller can read: an account API key its account's; a user credential their own plus those of every account they manage. `account_id` and `user_id` only narrow that list — values outside the caller's reach return fewer results, not an error.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.memberships.list(
        externalAccount: "discord_123456789012345678",
        productIds: [
            "prod_xxxxxxxxxxxxx"
        ],
        variantIds: [
            "plan_xxxxxxxxxxxxx"
        ],
        promoCodeIds: [
            "promo_xxxxxxxxxxxxxx"
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Narrow to one account (`biz_` tag). With read access to the account this lists all of its memberships; without, only the caller's own memberships in it.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — Narrow to one user's memberships (`user_` tag, or `me` for the caller). A user outside the caller's visible set returns an empty list.
    
</dd>
</dl>

<dl>
<dd>

**memberId:** `String?` — Narrow to one member's memberships (`mber_` tag), including memberships bought by another business. A member outside the caller's visible set returns an empty list.
    
</dd>
</dl>

<dl>
<dd>

**externalAccount:** `String?` — Narrow to memberships linked to one Discord or Telegram account, given as the platform's user ID prefixed with `discord_` or `telegram_`. Discord matches include memberships imported with that Discord ID. Any other format is a 400.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListMembershipsRequestStatus?` — Filter by billing state. `trialing`, `active`, `past_due`, `completed`, `canceled`, and `expired` match the membership's `status`; `active`, `trialing`, and `past_due` exclude memberships set to cancel at period end. The other values are derived buckets that never appear as a `status`: `canceling` matches memberships set to cancel at period end; `paused` matches memberships with payment collection paused; `expiring` matches one-time purchases that have not yet expired; `one_time` matches one-time purchases that never expire; `unclaimed` matches memberships with no buyer user, including memberships bought by another business; `banned` matches memberships whose buyer is banned from the account.
    
</dd>
</dl>

<dl>
<dd>

**statuses:** `[ListMembershipsRequestStatusesItem]?` — Filter to memberships matching any of these billing states, with the same meanings as `status`. Repeat the parameter to pass several. Combined with `status` when both are sent.
    
</dd>
</dl>

<dl>
<dd>

**productId:** `String?` — Filter to memberships of this product (`prod_` tag).
    
</dd>
</dl>

<dl>
<dd>

**productIds:** `[String]?` — Filter to memberships of any of these products, each prefixed `prod_`. Repeat the parameter to pass several.
    
</dd>
</dl>

<dl>
<dd>

**variantId:** `String?` — Filter to memberships of this variant (`plan_` tag).
    
</dd>
</dl>

<dl>
<dd>

**variantIds:** `[String]?` — Filter to memberships of any of these variants, each prefixed `plan_`. Repeat the parameter to pass several.
    
</dd>
</dl>

<dl>
<dd>

**promoCodeIds:** `[String]?` — Filter to memberships discounted by any of these promo codes, each prefixed `promo_`. Repeat the parameter to pass several.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only memberships created after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only memberships created before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListMembershipsRequestOrder?` — Sort field.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListMembershipsRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**includeTotalCount:** `Bool?` — Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.memberships.<a href="/Sources/Resources/Memberships/MembershipsClient.swift">invite</a>(request: Requests.InviteMembershipsRequest, requestOptions: RequestOptions?) -> InviteMembershipsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Emails one recipient an invitation to a free variant's membership. The invitation is bound to that recipient; after signing in, accepting it immediately grants the membership without checkout. This Experimental endpoint is available only to accounts enabled for membership invitations.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.memberships.invite(request: .init(variantId: "plan_xxxxxxxxxxxxxx"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.InviteMembershipsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.memberships.<a href="/Sources/Resources/Memberships/MembershipsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Membership</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a membership by ID or license key. Accessible to the account and to the membership's own user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.memberships.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Membership ID (`mem_` tag), or a software license key.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.memberships.<a href="/Sources/Resources/Memberships/MembershipsClient.swift">update</a>(id: String, request: Requests.UpdateMembershipsRequest, requestOptions: RequestOptions?) -> Membership</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a membership's metadata, scheduled cancellation, renewal payment method, renewal cadence, next renewal date, or renewal price.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.memberships.update(
        id: "id",
        request: .init(billingPeriodDays: 45)
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Membership ID (`mem_` tag), or a software license key.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateMembershipsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.memberships.<a href="/Sources/Resources/Memberships/MembershipsClient.swift">applyPromoCode</a>(id: String, request: Requests.ApplyPromoCodeMembershipsRequest, requestOptions: RequestOptions?) -> Membership</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Applies a promo code to an `active` or `trialing` membership that does not already have one and has exactly one recurring item, for Stripe-billed memberships and memberships billed by Whop's billing engine. The discount lands on the next invoice and follows the code's duration (`once`, `repeating`, or `forever`).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.memberships.applyPromoCode(
        id: "id",
        request: .init(promoCode: "SAVE20")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Membership ID (`mem_` tag).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ApplyPromoCodeMembershipsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.memberships.<a href="/Sources/Resources/Memberships/MembershipsClient.swift">assignAffiliate</a>(id: String, request: Requests.AssignAffiliateMembershipsRequest, requestOptions: RequestOptions?) -> Membership</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Assigns an affiliate to a membership and pays them the commission you set on its future payments; past payments are not recalculated. A user who is not yet an affiliate of your account becomes one, which also requires `affiliate:create`. Send a new `commission_type` or `commission_value` for the membership's current affiliate to change their commission; a membership that already has a different affiliate returns a conflict. Works for active or trialing memberships with one recurring variant that bill through Stripe or Whop's billing engine, and not for marketplace memberships, paused payments, or a scheduled cancellation. You cannot assign yourself.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.memberships.assignAffiliate(
        id: "id",
        request: .init(
            commissionType: .flatFee,
            commissionValue: 5,
            email: "affiliate@example.com"
        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Membership ID (`mem_` tag).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.AssignAffiliateMembershipsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.memberships.<a href="/Sources/Resources/Memberships/MembershipsClient.swift">cancel</a>(id: String, request: Requests.CancelMembershipsRequest, requestOptions: RequestOptions?) -> Membership</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cancels a membership, either immediately or at the end of the current billing period. Buyers cannot cancel buy-now-pay-later (`splitit`, `sezzle`) or non-trial split-pay memberships.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.memberships.cancel(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Membership ID (`mem_` tag).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.CancelMembershipsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.memberships.<a href="/Sources/Resources/Memberships/MembershipsClient.swift">extend</a>(id: String, request: Requests.ExtendMembershipsRequest, requestOptions: RequestOptions?) -> Membership</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds free days to a membership, extending its current billing period, expiration date, or trial depending on the plan type.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.memberships.extend(
        id: "id",
        request: .init(days: 7)
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Membership ID (`mem_` tag).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ExtendMembershipsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.memberships.<a href="/Sources/Resources/Memberships/MembershipsClient.swift">pause</a>(id: String, request: Requests.PauseMembershipsRequest, requestOptions: RequestOptions?) -> Membership</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Pauses a membership's recurring payment collection. The customer keeps access but is not charged until the membership is resumed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.memberships.pause(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Membership ID (`mem_` tag).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PauseMembershipsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.memberships.<a href="/Sources/Resources/Memberships/MembershipsClient.swift">reactivate</a>(id: String, request: Requests.ReactivateMembershipsRequest, requestOptions: RequestOptions?) -> Membership</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Restores access to a `canceled` or `expired` membership that contains only one-time purchases and sets its `status` to `completed`. Lifetime memberships regain lifetime access; for memberships with an expiration, `days` sets the new `current_period_end`. Active and recurring memberships cannot be reactivated.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.memberships.reactivate(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Membership ID (`mem_` tag).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ReactivateMembershipsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.memberships.<a href="/Sources/Resources/Memberships/MembershipsClient.swift">resume</a>(id: String, requestOptions: RequestOptions?) -> Membership</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Resumes a previously paused membership's recurring payment collection. Billing resumes on the next cycle.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.memberships.resume(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Membership ID (`mem_` tag).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.memberships.<a href="/Sources/Resources/Memberships/MembershipsClient.swift">resyncAccess</a>(id: String, requestOptions: RequestOptions?) -> Membership</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Re-runs access fulfillment for a membership: recomputes the member's content access on Whop, re-validates their Discord link (re-adding them to the server and re-assigning roles if needed), and re-fulfills TradingView indicator access. Telegram access is invite-based and is not resynced. The work runs in the background and the outcome is written to the membership's logs.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.memberships.resyncAccess(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Membership ID (`mem_` tag).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.memberships.<a href="/Sources/Resources/Memberships/MembershipsClient.swift">transfer</a>(id: String, requestOptions: RequestOptions?) -> TransferMembershipsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a one-use transfer URL for a membership. Opening the URL while logged into a different Whop account claims the membership onto that account. The membership's buyer can generate a link for their own membership with `membership:transfer` when the product allows transfers and the membership is `trialing`, `active`, or `completed`. An account credential with `membership:update` bypasses both restrictions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.memberships.transfer(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Membership ID (`mem_` tag).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Messages
<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">list</a>(channelId: String, replyingToMessageId: String?, pinned: Bool?, includeDeleted: Bool?, createdAfter: String?, createdBefore: String?, updatedAfter: String?, beforeMessageId: String?, afterMessageId: String?, aroundMessageId: String?, aroundTimestamp: String?, order: ListMessagesRequestOrder?, direction: ListMessagesRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListMessagesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists messages in a channel. Existing public message and channel IDs are preserved. For reconnect synchronization, use inclusive updated_after with include_deleted=true; results use ascending change order. Follow the returned cursors and replace cached messages by ID, including when updated_at is unchanged. The returned updated_at is the stored message update time; reaction changes only affect synchronization ordering. Deleted entries contain identity and timestamps with their content redacted. To jump into history, specify channel_id and one around anchor; results use ascending creation-time order. For older messages in chronological order, use before_message_id with last and direction=asc; for newer messages, use after_message_id with first and direction=asc. Do not supply order or direction with updated_after or an around anchor. Keep message-ID filters when continuing with cursors. For around queries, omit the around anchor and continue with direction=asc.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.messages.list(channelId: "channel_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**channelId:** `String` — Filter by public channel ID. An experience ID is also accepted for experience chat.
    
</dd>
</dl>

<dl>
<dd>

**replyingToMessageId:** `String?` — Return replies to this message.
    
</dd>
</dl>

<dl>
<dd>

**pinned:** `Bool?` — Filter by message pin state.
    
</dd>
</dl>

<dl>
<dd>

**includeDeleted:** `Bool?` — Include redacted deletion entries for cache synchronization.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Return messages created strictly after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Return messages created strictly before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**updatedAfter:** `String?` — Return messages changed at or after this ISO 8601 timestamp in ascending change order. Cannot be combined with history filters, around anchors, order, or direction.
    
</dd>
</dl>

<dl>
<dd>

**beforeMessageId:** `String?` — Filter messages strictly before this message in channel_id by creation time and message ID. Deleted anchors are accepted; missing or other-channel IDs return 404. Cannot be combined with around anchors or updated_after.
    
</dd>
</dl>

<dl>
<dd>

**afterMessageId:** `String?` — Filter messages strictly after this message in channel_id by creation time and message ID. Deleted anchors are accepted; missing or other-channel IDs return 404. Cannot be combined with around anchors or updated_after.
    
</dd>
</dl>

<dl>
<dd>

**aroundMessageId:** `String?` — Center the first page around this live message in the selected channel.
    
</dd>
</dl>

<dl>
<dd>

**aroundTimestamp:** `String?` — Center the first page around this ISO 8601 timestamp in the selected channel.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListMessagesRequestOrder?` — History sort field. Defaults to created_at. Cannot be supplied with updated_after or around anchors.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListMessagesRequestDirection?` — History sort direction. Defaults to desc. Cannot be supplied with updated_after or around anchors.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">create</a>(request: Requests.CreateMessagesRequest, requestOptions: RequestOptions?) -> ChatMessage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Sends a Markdown message as the authenticated user or app agent. Channel access, posting restrictions, moderation, and delivery follow the existing chat services. Use Idempotency-Key to safely retry a send. The response and realtime message use the same message ID. Custom author presentation and embeds are read-only. With email_address, the message's text is also emailed to the customer of a support chat with that address's account, if they're a member with an email address. The email answers the email behind replying_to_message_id, or else continues the chat's latest email. The message is posted even when it isn't emailed. Files, GIFs and polls stay in the chat and are left out of the email, and a message with no text isn't emailed. Sending needs member:email:read, and the address's owner or, for a shared address, email:read and email:send.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.messages.create(request: .init(
        channelId: "feed_xxxxxxxxxxxxxxxxxxxxxx",
        content: "New **message**"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateMessagesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> ChatMessage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a live message from an accessible channel. Use list synchronization to retrieve deletion entries.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.messages.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Existing public message ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> Void</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a message as its author or a permitted moderator. Deleted messages remain available as redacted entries through list synchronization.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.messages.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Existing public message ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">update</a>(id: String, request: Requests.UpdateMessagesRequest, requestOptions: RequestOptions?) -> ChatMessage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the author's message. Use the pin and unpin actions to change its pin state. Omitted fields are preserved; attachment and preview collections replace their previous values.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.messages.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Existing public message ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateMessagesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">pin</a>(id: String, requestOptions: RequestOptions?) -> ChatMessage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Pins a message in its channel. Requires the channel's pin permission.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.messages.pin(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The message to pin.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">react</a>(id: String, request: Requests.ReactMessagesRequest, requestOptions: RequestOptions?) -> ChatMessage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Add your emoji reaction to a message. Reacting again with the same emoji changes nothing.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.messages.react(
        id: "id",
        request: .init(emoji: "❤️")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the message to react to.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ReactMessagesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">listReactions</a>(id: String, first: Int?, after: String?, last: Int?, before: String?, emoji: String?, requestOptions: RequestOptions?) -> ListReactionsMessagesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

List who reacted to a message, newest first. Optionally filter by emoji.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.messages.listReactions(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the message.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**emoji:** `String?` — Only return reactions with this emoji, as a Unicode emoji or a supported shortcode.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">unpin</a>(id: String, requestOptions: RequestOptions?) -> ChatMessage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Unpins a message in its channel. Requires the channel's pin permission.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.messages.unpin(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The message to unpin.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">unreact</a>(id: String, request: Requests.UnreactMessagesRequest, requestOptions: RequestOptions?) -> ChatMessage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove your emoji reaction from a message. Removing a reaction you have not added changes nothing.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.messages.unreact(
        id: "id",
        request: .init(emoji: "❤️")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the message to remove your reaction from.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UnreactMessagesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">vote</a>(id: String, request: Requests.VoteMessagesRequest, requestOptions: RequestOptions?) -> ChatMessage</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Vote for one option on a message poll. Each user can vote once per poll.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.messages.vote(
        id: "id",
        request: .init(pollOptionId: "2")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the message containing the poll.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.VoteMessagesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Notifications
<details><summary><code>client.notifications.<a href="/Sources/Resources/Notifications/NotificationsClient.swift">list</a>(unread: Bool?, experienceId: String?, accountId: String?, mentions: Bool?, first: Int?, after: String?, requestOptions: RequestOptions?) -> ListNotificationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the authenticated user's notifications, newest first. Without filters the feed spans every experience the user belongs to plus the teams they are a member of. Requires a user credential — an account API key has no notification feed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.notifications.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**unread:** `Bool?` — Only return notifications created since the user last viewed their source.
    
</dd>
</dl>

<dl>
<dd>

**experienceId:** `String?` — Only return notifications from this experience (`exp_` tag).
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Only return team notifications for this account (`biz_` tag).
    
</dd>
</dl>

<dl>
<dd>

**mentions:** `Bool?` — Only return notifications that mention the user directly.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.notifications.<a href="/Sources/Resources/Notifications/NotificationsClient.swift">create</a>(request: Requests.CreateNotificationsRequest, requestOptions: RequestOptions?) -> CreateNotificationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Queues a notification to every user of an experience or to an account's team, processed asynchronously. Every send is attributed to an app: use an app API key, or a credential acting on behalf of an app. Narrow the audience with `user_ids` to send a mention.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.notifications.create(request: .init(
        content: "Drop off at 4180 Burnet Rd. Plan on two days for the full coating.",
        title: "Your ceramic coating is booked"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateNotificationsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.notifications.<a href="/Sources/Resources/Notifications/NotificationsClient.swift">badges</a>(experienceIds: [String]?, lastFetchedAt: String?, requestOptions: RequestOptions?) -> BadgesNotificationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the authenticated user's per-experience unread badge state. Requires a user credential. Returns one row per experience the user belongs to (or per requested experience).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.notifications.badges(experienceIds: [
        "exp_xxxxxxxxxxxxxx"
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**experienceIds:** `[String]?` — Only return badges for these experiences (`exp_` tags).
    
</dd>
</dl>

<dl>
<dd>

**lastFetchedAt:** `String?` — The client's last fetched-at ISO 8601 timestamp, used to partially refresh badges after a websocket message.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.notifications.<a href="/Sources/Resources/Notifications/NotificationsClient.swift">markRead</a>(request: Requests.MarkReadNotificationsRequest, requestOptions: RequestOptions?) -> MarkReadNotificationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Marks the authenticated user's notifications as read, for one experience or all of them, and returns the refreshed badge rows for that scope. Requires a user credential.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.notifications.markRead(request: .init())
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.MarkReadNotificationsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.notifications.<a href="/Sources/Resources/Notifications/NotificationsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Notification</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a single notification, from the feed or from a push or websocket event. Requires a user credential.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.notifications.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — A notification `id` from List Notifications, or the ephemeral id delivered with a push or websocket event.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Partner Referral Requests
<details><summary><code>client.partnerReferralRequests.<a href="/Sources/Resources/PartnerReferralRequests/PartnerReferralRequestsClient.swift">list</a>(accountId: String?, targetUserId: String?, partnerId: String?, referringAccountId: String?, status: ListPartnerReferralRequestsRequestStatus?, requestType: ListPartnerReferralRequestsRequestRequestType?, authorizedUserId: String?, memberId: String?, personal: Bool?, order: ListPartnerReferralRequestsRequestOrder?, direction: ListPartnerReferralRequestsRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListPartnerReferralRequestsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists your referral links and attribution requests, including incoming requests for you or businesses you own, with filters for recipient, partner, type, and status.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.partnerReferralRequests.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Only requests for this business ID, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**targetUserId:** `String?` — Only requests received by this user ID, prefixed `user_`.
    
</dd>
</dl>

<dl>
<dd>

**partnerId:** `String?` — Only requests sent by this partner's user ID, prefixed `user_`.
    
</dd>
</dl>

<dl>
<dd>

**referringAccountId:** `String?` — Only the referral links created for memberships on this business's team, prefixed `biz_`. Needs read access to the business: its owner sees every member's links, a manager the links of the people reporting to them, and other members only their own.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListPartnerReferralRequestsRequestStatus?` — Only requests with this approval status.
    
</dd>
</dl>

<dl>
<dd>

**requestType:** `ListPartnerReferralRequestsRequestRequestType?` — Only requests initiated in this way.
    
</dd>
</dl>

<dl>
<dd>

**authorizedUserId:** `String?` — Only requests created for this team membership, prefixed `ausr_`.
    
</dd>
</dl>

<dl>
<dd>

**memberId:** `String?` — Only requests that credit this member record, prefixed `mber_`. A request created for a team membership also credits its holder's member record.
    
</dd>
</dl>

<dl>
<dd>

**personal:** `Bool?` — When true, only personal requests, created for neither a team membership nor a member record. When false, only requests created for one.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListPartnerReferralRequestsRequestOrder?` — Field used to sort requests.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListPartnerReferralRequestsRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partnerReferralRequests.<a href="/Sources/Resources/PartnerReferralRequests/PartnerReferralRequestsClient.swift">create</a>(request: CreatePartnerReferralRequestsRequestBody, requestOptions: RequestOptions?) -> PartnerReferralRequest</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a referral link, or sends an attribution request to an existing business or user for approval. Links require an enrolled partner who is not suspended; attribution requests require an enrolled, verified partner. Recipients do not need to join the partner program.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.partnerReferralRequests.create(request: CreatePartnerReferralRequestsRequestBody.createPartnerReferralRequestsRequestBodyAccountId(
        CreatePartnerReferralRequestsRequestBodyAccountId(
            accountId: "biz_xxxxxxxxxxxxxx"
        )
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `CreatePartnerReferralRequestsRequestBody` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partnerReferralRequests.<a href="/Sources/Resources/PartnerReferralRequests/PartnerReferralRequestsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> PartnerReferralRequest</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a referral link or attribution request by ID, including its partner, recipient, approval status, and referral code when present.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.partnerReferralRequests.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Partner referral request ID, prefixed `prfr_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partnerReferralRequests.<a href="/Sources/Resources/PartnerReferralRequests/PartnerReferralRequestsClient.swift">accept</a>(id: String, requestOptions: RequestOptions?) -> PartnerReferralRequest</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Accepts a pending attribution request as the receiving user or business owner, assigning the requesting partner as that user's or business's referrer.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.partnerReferralRequests.accept(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Partner referral request ID, prefixed `prfr_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partnerReferralRequests.<a href="/Sources/Resources/PartnerReferralRequests/PartnerReferralRequestsClient.swift">cancel</a>(id: String, requestOptions: RequestOptions?) -> PartnerReferralRequest</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cancels a pending attribution request you sent so the recipient can no longer accept it, and returns the cancelled request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.partnerReferralRequests.cancel(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Partner referral request ID, prefixed `prfr_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partnerReferralRequests.<a href="/Sources/Resources/PartnerReferralRequests/PartnerReferralRequestsClient.swift">decline</a>(id: String, requestOptions: RequestOptions?) -> PartnerReferralRequest</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Declines a pending attribution request for you or a business you own, marking it as denied without assigning the requesting partner as a referrer.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.partnerReferralRequests.decline(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Partner referral request ID, prefixed `prfr_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Partners
<details><summary><code>client.partners.<a href="/Sources/Resources/Partners/PartnersClient.swift">create</a>(requestOptions: RequestOptions?) -> CreatePartnersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Enrolls the calling user in the Whop partner program, making their partner businesses eligible for earnings. Idempotent — enrolling again keeps the original enrollment time.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.partners.create()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partners.<a href="/Sources/Resources/Partners/PartnersClient.swift">feeOptions</a>(requestOptions: RequestOptions?) -> FeeOptionsPartnersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists, per income stream, the fee a business the caller refers would be charged, how low the caller may price it, and the commission the caller earns on that stream. Answers for a referral that does not exist yet, so a referral flow can price the deal before the business is created. Requires `partner:fees:update`, since the floors a partner may price down to are only for a credential that can set them.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.partners.feeOptions()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partners.<a href="/Sources/Resources/Partners/PartnersClient.swift">leaderboard</a>(period: LeaderboardPartnersRequestPeriod?, requestOptions: RequestOptions?) -> LeaderboardPartnersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Ranks referrers by partner business earnings over the chosen `period`, all-time by default. Authentication is optional: authenticated callers also get their own standing, anonymous callers get the rankings alone.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.partners.leaderboard()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**period:** `LeaderboardPartnersRequestPeriod?` — Time window for the rankings. `day`, `month`, and `year` count earnings since the start of the current calendar day, month, or year; `last_30_days` counts earnings over the trailing 30 days; `all_time` ranks lifetime earnings.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partners.<a href="/Sources/Resources/Partners/PartnersClient.swift">referredUsers</a>(earningPartnerId: String?, earningPartnerUsername: String?, referringAccountId: String?, query: String?, hasBusinesses: Bool?, hasEarningBusinesses: Bool?, order: ReferredUsersPartnersRequestOrder?, direction: ReferredUsersPartnersRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ReferredUsersPartnersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the users the caller referred onto Whop, newest first by default, each with the caller's total affiliate earnings from that user across all tiers. Deprecated: this list is retired and no longer appears in the API reference. It keeps responding for existing integrations and has no replacement.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.partners.referredUsers()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**earningPartnerId:** `String?` — The selected referring partner's user_ ID. Requires user_id=global; cannot be combined with earning_partner_username.
    
</dd>
</dl>

<dl>
<dd>

**earningPartnerUsername:** `String?` — The selected referring partner's exact username. Requires user_id=global; cannot be combined with earning_partner_id.
    
</dd>
</dl>

<dl>
<dd>

**referringAccountId:** `String?` — List the users this business's team members referred, past members included, instead of the caller's own. Requires company:basic:read on that business, which every team member holds, and cannot be combined with user_id. The owner role reads every team member's referrals; anyone else reads only their own and those of the people under them in the org chart. earning_partner_id or earning_partner_username then narrows to one team member.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Search referred users by name or username. In global mode, matches the beginning of usernames only.
    
</dd>
</dl>

<dl>
<dd>

**hasBusinesses:** `Bool?` — When true, only referred users who brought at least one business onto Whop.
    
</dd>
</dl>

<dl>
<dd>

**hasEarningBusinesses:** `Bool?` — When true, only referred users with at least one business that has generated earnings.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ReferredUsersPartnersRequestOrder?` — The field to sort by. created_at uses the user's signup date; earnings_usd uses the current primary referrer's cached total affiliate earnings from that user.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ReferredUsersPartnersRequestDirection?` — The direction to sort results.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partners.<a href="/Sources/Resources/Partners/PartnersClient.swift">retrieve</a>(id: String, accountId: String?, requestOptions: RequestOptions?) -> Partner</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the authenticated user's partner profile: enrollment and verification status, certification completion, active direct business referral count, and default payout rates. Other users' profiles are not accessible. To create and manage referral links, use `/partner_referral_requests`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.partners.retrieve(id: "me")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The authenticated partner's user ID, prefixed user_, or me. Other users' profiles are not accessible.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Return `payout_rates` for this business, prefixed `biz_`, instead of the caller's own: the business's rate rows, else the platform defaults. Requires company:basic:read on that business, which every team member holds. The rest of the profile stays the caller's.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Payment Method Domains
<details><summary><code>client.paymentMethodDomains.<a href="/Sources/Resources/PaymentMethodDomains/PaymentMethodDomainsClient.swift">list</a>(accountId: String?, hostname: String?, status: ListPaymentMethodDomainsRequestStatus?, provider: ListPaymentMethodDomainsRequestProvider?, createdBefore: Date?, createdAfter: Date?, order: ListPaymentMethodDomainsRequestOrder?, direction: ListPaymentMethodDomainsRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListPaymentMethodDomainsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the payment method domains registered for your account and its subaccounts. Deprecated: list domains with `GET /domains` and the `apple_pay` filter instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.paymentMethodDomains.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Only domains registered for this account (`biz_` tag). Defaults to the caller's account plus its subaccounts.
    
</dd>
</dl>

<dl>
<dd>

**hostname:** `String?` — Only the domain with this exact hostname.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListPaymentMethodDomainsRequestStatus?` — Only domains with this verification status.
    
</dd>
</dl>

<dl>
<dd>

**provider:** `ListPaymentMethodDomainsRequestProvider?` — Only domains registered with this wallet provider.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Only domains created before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Only domains created after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListPaymentMethodDomainsRequestOrder?` — Sort field.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListPaymentMethodDomainsRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.paymentMethodDomains.<a href="/Sources/Resources/PaymentMethodDomains/PaymentMethodDomainsClient.swift">create</a>(request: Requests.CreatePaymentMethodDomainsRequest, requestOptions: RequestOptions?) -> PaymentMethodDomain</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Registers a hostname with the wallet provider and attempts verification inline. Returns `verified` when the provider fetched the domain-association file (for Apple Pay, `/.well-known/apple-developer-merchantid-domain-association`), or `pending` when it could not: host the file, then retry with `POST /payment_method_domains/:id/verify`. Deprecated: add Apple Pay with `POST /domains` and `apple_pay: {}` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.paymentMethodDomains.create(request: .init(hostname: "pending.shinetime.com"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreatePaymentMethodDomainsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.paymentMethodDomains.<a href="/Sources/Resources/PaymentMethodDomains/PaymentMethodDomainsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> PaymentMethodDomain</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a payment method domain to check its verification status. Deprecated: retrieve the domain with `GET /domains/{id}` instead, using the same ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.paymentMethodDomains.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the payment method domain, prefixed `pmd_` or `dom_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.paymentMethodDomains.<a href="/Sources/Resources/PaymentMethodDomains/PaymentMethodDomainsClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> DeletePaymentMethodDomainsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Unregisters a payment method domain so its wallet payment methods stop rendering there. Deprecated: remove Apple Pay with `PATCH /domains/{id}` and `apple_pay: null` instead. `DELETE /domains/{id}` removes the whole domain, including any website on it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.paymentMethodDomains.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the payment method domain, prefixed `pmd_` or `dom_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.paymentMethodDomains.<a href="/Sources/Resources/PaymentMethodDomains/PaymentMethodDomainsClient.swift">verify</a>(id: String, requestOptions: RequestOptions?) -> PaymentMethodDomain</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Re-attempts provider verification of a pending domain once the association file is hosted. Fails with a `bad_request` explaining what to fix; verifying an already `verified` domain is a no-op. Deprecated: check the domain with `POST /domains/{id}/check` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.paymentMethodDomains.verify(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the payment method domain, prefixed `pmd_` or `dom_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PaymentMethods
<details><summary><code>client.paymentMethods.<a href="/Sources/Resources/PaymentMethods/PaymentMethodsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, memberId: String?, direction: Direction?, createdBefore: Date?, createdAfter: Date?, futureUsage: FutureUsageTypes?, paymentMethodTypes: [PaymentMethodTypes]?, cardBrands: [CardBrands]?, cardFundingTypes: [CardFundingTypes]?, hasPayerDocument: Bool?, expired: Bool?, broken: Bool?, accountId: String?, requestOptions: RequestOptions?) -> ListPaymentMethodsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of saved payment methods for a member or account, or for the authenticated user when you pass neither.

Required permissions:
 - `member:payment_methods:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.paymentMethods.list(
        first: 42,
        last: 42,
        memberId: "mber_xxxxxxxxxxxxx",
        createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        accountId: "biz_xxxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**memberId:** `String?` — The unique identifier of the member to list payment methods for. Omit this and account_id to list your own saved payment methods.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `Direction?` 
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Only return payment methods created before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Only return payment methods created after this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**futureUsage:** `FutureUsageTypes?` 
    
</dd>
</dl>

<dl>
<dd>

**paymentMethodTypes:** `[PaymentMethodTypes]?` — Only return payment methods of these types. Pass the eligible `type` values from the payment method types catalogue so the list holds nothing the purchase cannot take. An empty list returns no payment methods.
    
</dd>
</dl>

<dl>
<dd>

**cardBrands:** `[CardBrands]?` — Only return cards on these networks, such as the networks the seller accepts. Payment methods that are not cards are unaffected.
    
</dd>
</dl>

<dl>
<dd>

**cardFundingTypes:** `[CardFundingTypes]?` — Only return cards funded this way. A card whose funding could not be determined is excluded, and payment methods that are not cards are unaffected.
    
</dd>
</dl>

<dl>
<dd>

**hasPayerDocument:** `Bool?` — Filter cards by whether they carry the payer identity document their payment provider requires. Payment methods that are not cards are unaffected.
    
</dd>
</dl>

<dl>
<dd>

**expired:** `Bool?` — Filter by expiry. Only a card can expire, so `false` keeps every payment method that is not past its expiration month and `true` returns expired cards alone.
    
</dd>
</dl>

<dl>
<dd>

**broken:** `Bool?` — Filter by whether the stored credential has permanently stopped charging, such as a vault entry its provider closed.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — The unique identifier of the company. Provide either this or member_id, not both. Omit both to address your own saved payment methods.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.paymentMethods.<a href="/Sources/Resources/PaymentMethods/PaymentMethodsClient.swift">retrieve</a>(id: String, memberId: String?, accountId: String?, requestOptions: RequestOptions?) -> PaymentMethod</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a saved payment method from a member's wallet when you pass `member_id` or `account_id`, or from your own otherwise.

Required permissions:
 - `member:payment_methods:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.paymentMethods.retrieve(
        id: "payt_xxxxxxxxxxxxx",
        memberId: "mber_xxxxxxxxxxxxx",
        accountId: "biz_xxxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the payment method.
    
</dd>
</dl>

<dl>
<dd>

**memberId:** `String?` — The unique identifier of the member. Provide either this or account_id, not both. Omit both to address your own saved payment methods.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — The unique identifier of the company. Provide either this or member_id, not both. Omit both to address your own saved payment methods.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.paymentMethods.<a href="/Sources/Resources/PaymentMethods/PaymentMethodsClient.swift">deletePaymentMethod</a>(id: String, memberId: String?, accountId: String?, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a saved payment method. Cannot delete a payment method attached to an active subscription.

Required permissions:
 - `member:payment_methods:manage`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.paymentMethods.deletePaymentMethod(
        id: "payt_xxxxxxxxxxxxx",
        memberId: "mber_xxxxxxxxxxxxx",
        accountId: "biz_xxxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the payment method to delete.
    
</dd>
</dl>

<dl>
<dd>

**memberId:** `String?` — The unique identifier of the member. Provide either this or account_id, not both. Omit both to address your own saved payment methods.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — The unique identifier of the company. Provide either this or member_id, not both. Omit both to address your own saved payment methods.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Payment Quotes
<details><summary><code>client.paymentQuotes.<a href="/Sources/Resources/PaymentQuotes/PaymentQuotesClient.swift">create</a>(request: Requests.CreatePaymentQuotesRequest, requestOptions: RequestOptions?) -> PaymentQuote</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Prices a purchase the way a payment for it will be charged. The body is the `PaymentInput` a payment takes plus where the buyer is, which a seller that collects no tax on the purchase can leave out. The purchase is priced from exactly what you send: no buyer is looked up, so no stored registration or purchase history applies. Pass the quote's `id` as `quote_id` when you create the payment to charge exactly the purchase, promo code, and tax shown here. A quote is priced once and may be consumed by one payment before `expires_at`. Cart entries must name existing variants with `variant_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.paymentQuotes.create(request: .init(accountId: "biz_xxxxxxxxxxxxxx"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreatePaymentQuotesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.paymentQuotes.<a href="/Sources/Resources/PaymentQuotes/PaymentQuotesClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> PaymentQuote</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a payment quote. Use it to check which payment holds the quote, through `payment_id`, and when it expires.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.paymentQuotes.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The payment quote ID, prefixed `pq_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Payment Rules
<details><summary><code>client.paymentRules.<a href="/Sources/Resources/PaymentRules/PaymentRulesClient.swift">list</a>(accountId: String?, status: ListPaymentRulesRequestStatus?, action: ListPaymentRulesRequestAction?, order: ListPaymentRulesRequestOrder?, direction: ListPaymentRulesRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListPaymentRulesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the payment rules on an account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.paymentRules.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Only return rules belonging to this account. Defaults to the account the request is acting for.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListPaymentRulesRequestStatus?` — Only return rules with this status.
    
</dd>
</dl>

<dl>
<dd>

**action:** `ListPaymentRulesRequestAction?` — Only return rules that take this action.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListPaymentRulesRequestOrder?` — The field to sort by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListPaymentRulesRequestDirection?` — The sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.paymentRules.<a href="/Sources/Resources/PaymentRules/PaymentRulesClient.swift">create</a>(request: Requests.CreatePaymentRulesRequest, requestOptions: RequestOptions?) -> PaymentRule</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a payment rule. It is created `active` and applies its `action` to new payments that match all of its `conditions`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.paymentRules.create(request: .init(
        action: .allow,
        conditions: CreatePaymentRulesRequestConditions(
            all: [
                CreatePaymentRulesRequestConditionsAllItem(
                    field: .riskScore,
                    operator: .gte,
                    value: PaymentRuleConditionValue.double(
                        70
                    )
                )
            ]
        ),
        name: "Review risky cards"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreatePaymentRulesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.paymentRules.<a href="/Sources/Resources/PaymentRules/PaymentRulesClient.swift">listFields</a>(requestOptions: RequestOptions?) -> ListFieldsPaymentRulesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the payment attributes a rule condition can read, with the operators and values each one accepts. Small and returned in full on one page.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.paymentRules.listFields()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.paymentRules.<a href="/Sources/Resources/PaymentRules/PaymentRulesClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> PaymentRule</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a payment rule.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.paymentRules.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The payment rule ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.paymentRules.<a href="/Sources/Resources/PaymentRules/PaymentRulesClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> Void</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a payment rule. It stops applying to new payments but is kept, so the payments it already decided still name it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.paymentRules.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The payment rule ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.paymentRules.<a href="/Sources/Resources/PaymentRules/PaymentRulesClient.swift">update</a>(id: String, request: Requests.UpdatePaymentRulesRequest, requestOptions: RequestOptions?) -> PaymentRule</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a payment rule's name or metadata, keeping its ID and everything recorded against it. A rule's `action` and `conditions` are fixed once created, so the payments it decided keep naming the rule that decided them; use `POST /payment_rules/:id/replace` to change them.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.paymentRules.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The payment rule ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdatePaymentRulesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.paymentRules.<a href="/Sources/Resources/PaymentRules/PaymentRulesClient.swift">activate</a>(id: String, requestOptions: RequestOptions?) -> PaymentRule</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Activates an inactive payment rule so it applies to new payments again. A deleted rule cannot be activated.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.paymentRules.activate(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The payment rule ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.paymentRules.<a href="/Sources/Resources/PaymentRules/PaymentRulesClient.swift">deactivate</a>(id: String, requestOptions: RequestOptions?) -> PaymentRule</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deactivates a payment rule so it stops applying to new payments. It keeps its ID and can be activated again.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.paymentRules.deactivate(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The payment rule ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.paymentRules.<a href="/Sources/Resources/PaymentRules/PaymentRulesClient.swift">replace</a>(id: String, request: Requests.ReplacePaymentRulesRequest, requestOptions: RequestOptions?) -> PaymentRule</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Changes a payment rule's `action` and `conditions` by deleting it and creating its successor in one step. The successor has a new ID and keeps the replaced rule's name, metadata, and `active` or `inactive` status.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.paymentRules.replace(
        id: "id",
        request: .init(
            action: .allow,
            conditions: ReplacePaymentRulesRequestConditions(
                all: [
                    ReplacePaymentRulesRequestConditionsAllItem(
                        field: .riskScore,
                        operator: .gte,
                        value: PaymentRuleConditionValue.double(
                            70
                        )
                    )
                ]
            )
        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The payment rule ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ReplacePaymentRulesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Payments
<details><summary><code>client.payments.<a href="/Sources/Resources/Payments/PaymentsClient.swift">list</a>(mode: ListPaymentsRequestMode?, accountId: String?, status: ListPaymentsRequestStatus?, trackingStatus: ListPaymentsRequestTrackingStatus?, billingReason: ListPaymentsRequestBillingReason?, currency: String?, userId: String?, query: String?, includeSubaccounts: Bool?, memberId: String?, membershipId: String?, productId: String?, variantId: String?, createdBefore: Date?, createdAfter: Date?, statuses: [ListPaymentsRequestStatusesItem]?, substatuses: [ListPaymentsRequestSubstatusesItem]?, billingReasons: [ListPaymentsRequestBillingReasonsItem]?, currencies: [String]?, minAmount: Double?, maxAmount: Double?, variantIds: [String]?, productIds: [String]?, paymentMethods: [ListPaymentsRequestPaymentMethodsItem]?, trackingStates: [ListPaymentsRequestTrackingStatesItem]?, refundedAfter: Date?, refundedBefore: Date?, disputeAlertedAfter: Date?, disputeAlertedBefore: Date?, disputeCreatedAfter: Date?, disputeCreatedBefore: Date?, order: ListPaymentsRequestOrder?, direction: ListPaymentsRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, includeTotalCount: Bool?, requestOptions: RequestOptions?) -> ListPaymentsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists payments, newest first. By default, returns sales for the accounts your credential can read: an account credential's own account, or every account a user can read payments for. Set `mode` to `user_sales` to list the sales the signed-in user received personally, outside any account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payments.list(
        currencies: [
            "eur"
        ],
        minAmount: 995,
        maxAmount: 995,
        variantIds: [
            "plan_xxxxxxxxxxxxx"
        ],
        productIds: [
            "prod_xxxxxxxxxxxxx"
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**mode:** `ListPaymentsRequestMode?` — Which sales to list. `account_sales` returns sales for the accounts the caller can read. `user_sales` returns only sales the signed-in user received personally, outside any account; it requires the user's own Whop login session and cannot be combined with `account_id`.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Only payments charged by this account, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListPaymentsRequestStatus?` — Only payments in this lifecycle state.
    
</dd>
</dl>

<dl>
<dd>

**trackingStatus:** `ListPaymentsRequestTrackingStatus?` — Only payments whose most recently attached kept shipment is in this tracking state. `missing_tracking` selects paid payments with a captured shipping address and no kept shipment, excluding fully refunded payments. `needs_tracking` selects payments with an open pre-shipment funds hold and no kept shipment. Shipment states do not imply a payment or refund state. Requires `shipment:basic:read` as well as `payment:basic:read`; user-wide lists include only accounts readable under both scopes. Only supported with `mode=account_sales`.
    
</dd>
</dl>

<dl>
<dd>

**billingReason:** `ListPaymentsRequestBillingReason?` — Only payments charged for this reason. `subscription_cycle` also matches renewals recorded as `subscription_update`.
    
</dd>
</dl>

<dl>
<dd>

**currency:** `String?` — Only payments presented in this three-letter currency, such as `usd`.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — Only payments made by this buyer, prefixed `user_`. This filters sales the caller can read, so `me` is not accepted; list the caller's own purchases with `GET /memberships?user_id=me`.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Search payments by payment ID, dispute ID, user ID, membership ID, user email, name, or username. Email filtering requires the member:email:read permission.
    
</dd>
</dl>

<dl>
<dd>

**includeSubaccounts:** `Bool?` — Also cover the account's subaccounts. Requires `account_id`, and is a 400 without it. Without `query`, lists the payments of the account and every subaccount, newest first by `created_at` only; another `order` is a 400. The listing is cut off after 10 seconds, which a rare filter on an account with little recent activity can reach; add a `query` to narrow it. With `query`, matches on payment, dispute, user or membership ID, buyer email, or a card's first 6 or 8 digits and last 4 separated by a space or dash (`424242 4242`); free-text queries such as a name search only the named account. Subaccounts' payments are returned only for subaccounts you can read payments on.
    
</dd>
</dl>

<dl>
<dd>

**memberId:** `String?` — Only payments made by this member, prefixed `mber_`.
    
</dd>
</dl>

<dl>
<dd>

**membershipId:** `String?` — Only payments billed under this membership, prefixed `mem_`.
    
</dd>
</dl>

<dl>
<dd>

**productId:** `String?` — Only payments for this product, prefixed `prod_`.
    
</dd>
</dl>

<dl>
<dd>

**variantId:** `String?` — Only payments priced by this variant, prefixed `plan_`.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Only payments created before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Only payments created after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**statuses:** `[ListPaymentsRequestStatusesItem]?` — Only payments in any of these lifecycle states, with the same meanings as `status`. Repeat the parameter to pass several. Combined with `status` when both are sent.
    
</dd>
</dl>

<dl>
<dd>

**substatuses:** `[ListPaymentsRequestSubstatusesItem]?` — Only payments whose `substatus` is any of these. Repeat the parameter to pass several. `incomplete` also matches payments that report `incomplete` because no finer status was recorded.
    
</dd>
</dl>

<dl>
<dd>

**billingReasons:** `[ListPaymentsRequestBillingReasonsItem]?` — Only payments charged for any of these reasons, with the same meanings as `billing_reason`. Repeat the parameter to pass several. Combined with `billing_reason` when both are sent.
    
</dd>
</dl>

<dl>
<dd>

**currencies:** `[String]?` — Only payments presented in any of these three-letter currencies. Repeat the parameter to pass several. Combined with `currency` when both are sent.
    
</dd>
</dl>

<dl>
<dd>

**minAmount:** `Double?` — Only payments charged at least this amount: what the buyer was charged after discounts and including tax, in the currency each payment was presented in, the same amount `order=amount` sorts by. Where tax is added on top of the price (`tax_behavior` is `exclusive`), that is the price plus the tax, so a 995 price with tax added does not match `995`: match a range instead. A failed payment that charged nothing matches 0, not its price. Inclusive and compared to the cent. Pair it with `currencies` when the account sells in several. Send the same value as `max_amount` to match one exact amount.
    
</dd>
</dl>

<dl>
<dd>

**maxAmount:** `Double?` — Only payments charged at most this amount, measured like `min_amount`: after discounts and including tax, in the currency each payment was presented in. Inclusive and compared to the cent. Must not be less than `min_amount`.
    
</dd>
</dl>

<dl>
<dd>

**variantIds:** `[String]?` — Only payments priced by any of these variants, each prefixed `plan_`. Repeat the parameter to pass several. Combined with `variant_id` when both are sent.
    
</dd>
</dl>

<dl>
<dd>

**productIds:** `[String]?` — Only payments for any of these products, each prefixed `prod_`. Repeat the parameter to pass several. Combined with `product_id` when both are sent.
    
</dd>
</dl>

<dl>
<dd>

**paymentMethods:** `[ListPaymentsRequestPaymentMethodsItem]?` — Only payments paid with any of these methods: a card brand such as `amex`, a wallet such as `apple_pay`, or a payment method type such as `paypal`. Repeat the parameter to pass several.
    
</dd>
</dl>

<dl>
<dd>

**trackingStates:** `[ListPaymentsRequestTrackingStatesItem]?` — Only payments whose shipment is in any of these tracking states, or that still need a tracking number (`needs_tracking`). Repeat the parameter to pass several. Requires `account_id` and the shipment:basic:read permission.
    
</dd>
</dl>

<dl>
<dd>

**refundedAfter:** `Date?` — Only payments refunded after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**refundedBefore:** `Date?` — Only payments refunded before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**disputeAlertedAfter:** `Date?` — Only payments with a dispute alert after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**disputeAlertedBefore:** `Date?` — Only payments with a dispute alert before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**disputeCreatedAfter:** `Date?` — Only payments with a dispute opened after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**disputeCreatedBefore:** `Date?` — Only payments with a dispute opened before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListPaymentsRequestOrder?` — The field to sort by. `amount` sorts by the amount charged, in the currency it was charged in.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListPaymentsRequestDirection?` — The sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**includeTotalCount:** `Bool?` — Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payments.<a href="/Sources/Resources/Payments/PaymentsClient.swift">create</a>(request: Requests.CreatePaymentsRequest, requestOptions: RequestOptions?) -> Payment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Charges a buyer for one or more variants with a payment method already on file (`member_id` and `payment_method_id`), or with a `confirmation_token` for a method the buyer just supplied. Collection runs in the background, so the response is the payment as created, not its outcome: poll Retrieve payment status for how far it has got and what the buyer must still do.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payments.create(request: .init(accountId: "biz_xxxxxxxxxxxxxx"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreatePaymentsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payments.<a href="/Sources/Resources/Payments/PaymentsClient.swift">summary</a>(groups: [SummaryPaymentsRequestGroupsItem]?, accountId: String?, statuses: [SummaryPaymentsRequestStatusesItem]?, substatuses: [SummaryPaymentsRequestSubstatusesItem]?, billingReasons: [SummaryPaymentsRequestBillingReasonsItem]?, currencies: [String]?, minAmount: Double?, maxAmount: Double?, variantIds: [String]?, productIds: [String]?, paymentMethods: [SummaryPaymentsRequestPaymentMethodsItem]?, trackingStates: [SummaryPaymentsRequestTrackingStatesItem]?, createdAfter: Date?, createdBefore: Date?, refundedAfter: Date?, refundedBefore: Date?, disputeAlertedAfter: Date?, disputeAlertedBefore: Date?, disputeCreatedAfter: Date?, disputeCreatedBefore: Date?, query: String?, includeSubaccounts: Bool?, requestOptions: RequestOptions?) -> SummaryPaymentsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Totals up the same payments the list returns, so you can build status tabs and filter options without paging through them. Takes the same filters as List Payments.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payments.summary(
        currencies: [
            "usd"
        ],
        minAmount: 995,
        maxAmount: 995,
        variantIds: [
            "plan_xxxxxxxxxxxxx"
        ],
        productIds: [
            "prod_xxxxxxxxxxxxx"
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**groups:** `[SummaryPaymentsRequestGroupsItem]?` — Which breakdowns to return, keyed by these names under `groups`. Repeat the parameter to ask for several; omit it for all of them.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Only payments charged by this account, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**statuses:** `[SummaryPaymentsRequestStatusesItem]?` — Only payments in any of these lifecycle states. Repeat the parameter to pass several.
    
</dd>
</dl>

<dl>
<dd>

**substatuses:** `[SummaryPaymentsRequestSubstatusesItem]?` — Only payments whose `substatus` is any of these. Repeat the parameter to pass several.
    
</dd>
</dl>

<dl>
<dd>

**billingReasons:** `[SummaryPaymentsRequestBillingReasonsItem]?` — Only payments charged for any of these reasons. Repeat the parameter to pass several.
    
</dd>
</dl>

<dl>
<dd>

**currencies:** `[String]?` — Only payments presented in any of these three-letter currencies. Repeat the parameter to pass several.
    
</dd>
</dl>

<dl>
<dd>

**minAmount:** `Double?` — Only payments charged at least this amount: what the buyer was charged after discounts and including tax, in the currency each payment was presented in. Where tax is added on top of the price (`tax_behavior` is `exclusive`), that is the price plus the tax. A failed payment that charged nothing counts as 0. Inclusive and compared to the cent.
    
</dd>
</dl>

<dl>
<dd>

**maxAmount:** `Double?` — Only payments charged at most this amount, measured like `min_amount`: after discounts and including tax. Inclusive and compared to the cent. Must not be less than `min_amount`.
    
</dd>
</dl>

<dl>
<dd>

**variantIds:** `[String]?` — Only payments priced by any of these variants, each prefixed `plan_`. Repeat the parameter to pass several.
    
</dd>
</dl>

<dl>
<dd>

**productIds:** `[String]?` — Only payments for any of these products, each prefixed `prod_`. Repeat the parameter to pass several.
    
</dd>
</dl>

<dl>
<dd>

**paymentMethods:** `[SummaryPaymentsRequestPaymentMethodsItem]?` — Only payments paid with any of these methods. Repeat the parameter to pass several.
    
</dd>
</dl>

<dl>
<dd>

**trackingStates:** `[SummaryPaymentsRequestTrackingStatesItem]?` — Only payments in any of these tracking states. Requires `account_id` and the shipment:basic:read permission.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Only payments created after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Only payments created before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**refundedAfter:** `Date?` — Only payments refunded after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**refundedBefore:** `Date?` — Only payments refunded before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**disputeAlertedAfter:** `Date?` — Only payments with a dispute alert after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**disputeAlertedBefore:** `Date?` — Only payments with a dispute alert before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**disputeCreatedAfter:** `Date?` — Only payments with a dispute opened after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**disputeCreatedBefore:** `Date?` — Only payments with a dispute opened before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Search payments by payment ID, dispute ID, user ID, membership ID, user email, name, or username.
    
</dd>
</dl>

<dl>
<dd>

**includeSubaccounts:** `Bool?` — Only for searches: with `query`, also search the account's subaccounts. Requires `account_id` and `query`, and is a 400 without either; it never lists subaccounts' payments on its own. Matches on payment, dispute, user or membership ID, buyer email, or a card's first 6 or 8 digits and last 4 separated by a space or dash (`424242 4242`). Free-text queries such as a name search only the named account. Subaccounts' payments are returned only for subaccounts you can read payments on.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payments.<a href="/Sources/Resources/Payments/PaymentsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Payment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns one payment, including every purchased line item with its quantity and subtotal. Related records are ids — resolve a variant, membership, member or shipment on its own endpoint, and list this payment's refunds, disputes or Resolution Center cases with `?payment_id=`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payments.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The payment, prefixed `pay_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payments.<a href="/Sources/Resources/Payments/PaymentsClient.swift">update</a>(id: String, request: Requests.UpdatePaymentsRequest, requestOptions: RequestOptions?) -> Payment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a payment's `shipping_address` or `return_url`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payments.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The payment, prefixed `pay_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdatePaymentsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payments.<a href="/Sources/Resources/Payments/PaymentsClient.swift">capture</a>(id: String, requestOptions: RequestOptions?) -> PaymentStatus</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Captures the full amount of a card payment created with `capture: false`. The payment must still be in `requires_capture` before `capture_expires_at`. Partial capture, multiple captures, capturing more than the authorized amount, and tips are not supported.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payments.capture(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the payment.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payments.<a href="/Sources/Resources/Payments/PaymentsClient.swift">listFees</a>(id: String, requestOptions: RequestOptions?) -> ListFeesPaymentsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the fee breakdown of one payment — Whop's fee, processing, affiliate and other lines — each in the currency it was collected in and converted to the payment's settlement currency. The list is complete in one page.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payments.listFees(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The payment whose fees to list, prefixed `pay_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payments.<a href="/Sources/Resources/Payments/PaymentsClient.swift">generatePdf</a>(id: String, requestOptions: RequestOptions?) -> PaymentPdf</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Generates the payment's receipt (invoice) as a PDF and returns a short-lived link to download it. Each call generates a new file and link, so this endpoint does not replay `Idempotency-Key` responses.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payments.generatePdf(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The payment whose receipt to generate, prefixed `pay_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payments.<a href="/Sources/Resources/Payments/PaymentsClient.swift">refund</a>(id: String, request: Requests.RefundPaymentsRequest, requestOptions: RequestOptions?) -> Payment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Refunds all or part of a payment through the processor that charged it, and updates its membership to match. The buyer is emailed, the affiliate commission on the payment is clawed back, and any open Resolution Center case on the payment is closed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payments.refund(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The payment to refund, prefixed `pay_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.RefundPaymentsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payments.<a href="/Sources/Resources/Payments/PaymentsClient.swift">retry</a>(id: String, requestOptions: RequestOptions?) -> Payment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Charges an unpaid payment again with its original payment method and variant. A payment can typically be retried once, and only while its membership is active, trialing or past due, or when it is a membership's failed first payment.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payments.retry(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The payment to retry, prefixed `pay_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payments.<a href="/Sources/Resources/Payments/PaymentsClient.swift">void</a>(id: String, requestOptions: RequestOptions?) -> Payment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Voids or cancels an eligible payment. The request is rejected if the payment is no longer eligible. Some processors confirm the release of a card authorization asynchronously: the payment is then returned still `authorized`, and a `payment.canceled` webhook follows once the hold is released.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payments.void(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The payment to void, prefixed `pay_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payments.<a href="/Sources/Resources/Payments/PaymentsClient.swift">resume</a>(paymentId: String, request: Requests.ResumePaymentsRequest, requestOptions: RequestOptions?) -> PaymentStatus</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Charges the saved card again, with the buyer present, for a payment their bank declined until they authenticate (such as with 3DS). Retrieve the payment afterward to get the bank's challenge from `next_action`; once the buyer completes it, they land on `return_url`, or on Whop's hosted verification page if none was given. Only the buyer can call this, with the payment's `client_secret` in the body, an OAuth token for their own account with the `member:payment_methods:use` scope, or the token from a verified `payment` session intent. An API key gets a `403`. Has no effect on a payment that is not waiting on authentication.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payments.resume(
        paymentId: "payment_id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**paymentId:** `String` — The unique identifier of the payment.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ResumePaymentsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payments.<a href="/Sources/Resources/Payments/PaymentsClient.swift">updateReturnUrl</a>(paymentId: String, request: Requests.UpdateReturnUrlPaymentsRequest, requestOptions: RequestOptions?) -> PaymentStatus</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Changes where the buyer lands after completing an off-site step, up until they return. Accepts either a secret key or the payment's own `client_secret` in the body, so the surface that knows the final destination can set it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payments.updateReturnUrl(
        paymentId: "payment_id",
        request: .init(returnUrl: "https://shinetime.example/checkout/thanks")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**paymentId:** `String` — The unique identifier of the payment.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateReturnUrlPaymentsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payments.<a href="/Sources/Resources/Payments/PaymentsClient.swift">retrieveStatus</a>(paymentId: String, clientSecret: String?, requestOptions: RequestOptions?) -> PaymentStatus</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves how far a payment has got and what the buyer must do next, if anything. A payment is collected in the background, so poll this rather than reading the create response. Accepts either a secret key or the payment's own `client_secret` as a query parameter, so the surface collecting the payment can poll it directly.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payments.retrieveStatus(paymentId: "payment_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**paymentId:** `String` — The unique identifier of the payment.
    
</dd>
</dl>

<dl>
<dd>

**clientSecret:** `String?` — The payment's own `client_secret`, for a caller without a secret key.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PayoutAccounts
<details><summary><code>client.payoutAccounts.<a href="/Sources/Resources/PayoutAccounts/PayoutAccountsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> PayoutAccount</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing payout account.

Required permissions:
 - `payout:account:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payoutAccounts.retrieve(id: "poact_xxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the payout account to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## PayoutMethods
<details><summary><code>client.payoutMethods.<a href="/Sources/Resources/PayoutMethods/PayoutMethodsClient.swift">listPayoutMethod</a>(after: String?, before: String?, first: Int?, last: Int?, accountId: String, requestOptions: RequestOptions?) -> ListPayoutMethodResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the active payout methods configured for an account, newest first.

Required permissions:
 - `payout:destination:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payoutMethods.listPayoutMethod(
        first: 42,
        last: 42,
        accountId: "biz_xxxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String` — The unique identifier of the company to list payout methods for.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payoutMethods.<a href="/Sources/Resources/PayoutMethods/PayoutMethodsClient.swift">retrievePayoutMethod</a>(id: String, requestOptions: RequestOptions?) -> PayoutMethod</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing payout method.

Required permissions:
 - `payout:destination:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payoutMethods.retrievePayoutMethod(id: "potk_xxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the payout method to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Payouts
<details><summary><code>client.payouts.<a href="/Sources/Resources/Payouts/PayoutsClient.swift">list</a>(accountId: String?, userId: String?, currency: String?, status: ListPayoutsRequestStatus?, source: ListPayoutsRequestSource?, payoutMethodId: String?, createdBefore: Date?, createdAfter: Date?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListPayoutsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists an account's or user's payouts, newest first.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payouts.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — The owning account ID (a biz_ identifier). Provide this or user_id.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — The owning user ID (a user_ identifier). Provide this or account_id.
    
</dd>
</dl>

<dl>
<dd>

**currency:** `String?` — Optional currency code filter, for example `usd`.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListPayoutsRequestStatus?` — Filter to payouts whose `status` reads this word, matching exactly what this version displays — `reversed` finds settled payouts the bank later returned. Requires Api-Version-Date 2026-08-21 or later.
    
</dd>
</dl>

<dl>
<dd>

**source:** `ListPayoutsRequestSource?` — Filter by how the payout was created. A payout with no recorded source never matches.
    
</dd>
</dl>

<dl>
<dd>

**payoutMethodId:** `String?` — Filter to payouts sent to one saved payout method (a pytk_ identifier). An unknown id matches nothing.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Only payouts created before this ISO 8601 time (exclusive).
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Only payouts created at or after this ISO 8601 time (inclusive).
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payouts.<a href="/Sources/Resources/Payouts/PayoutsClient.swift">create</a>(request: Requests.CreatePayoutsRequest, requestOptions: RequestOptions?) -> CreatePayoutsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Sends money from an account or user balance to a saved payout method for that owner. First create a quote with POST /payouts/quotes, then submit its quote_token with the same payout details before it expires.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payouts.create(request: .init(
        amount: 50,
        payoutMethodId: "potk_xxxxxxxxxxxxxx",
        quoteToken: "signed-payout-quote"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreatePayoutsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payouts.<a href="/Sources/Resources/Payouts/PayoutsClient.swift">createQuote</a>(request: Requests.CreateQuotePayoutsRequest, requestOptions: RequestOptions?) -> CreateQuotePayoutsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a short-lived, provider-backed quote of a payout's fee, exchange rate, and destination amount. No funds move until you submit the returned `quote_token` to `POST /payouts`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payouts.createQuote(request: .init(payoutMethodId: "potk_xxxxxxxxxxxxxx"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateQuotePayoutsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payouts.<a href="/Sources/Resources/Payouts/PayoutsClient.swift">retrieve</a>(id: String, accountId: String?, userId: String?, requestOptions: RequestOptions?) -> RetrievePayoutsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a payout by its `wdrl_` ID, or by the `cofr_` conversion request ID a payout carries as `payout_request_id`. Authentication is optional: anyone with the ID can view tracking details, including notes, trace code, exchange rate, and payout request ID, while accounting fields require `payout:withdrawal:read` on the account or user that owns the payout. A supplied invalid credential returns 401.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payouts.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Payout ID, prefixed `wdrl_` for a payout returned by `GET /payouts` or `cofr_` for the payout request returned by `POST /payouts`.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Optional owning account ID, prefixed `biz_`. The payout ID identifies its ledger. If supplied, this must match the owner and cannot be combined with `user_id`.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — Optional owning user ID, prefixed `user_`. The payout ID identifies its ledger. If supplied, this must match the owner and cannot be combined with `account_id`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payouts.<a href="/Sources/Resources/Payouts/PayoutsClient.swift">cancel</a>(id: String, accountId: String?, userId: String?, requestOptions: RequestOptions?) -> CancelPayoutsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cancels a payout before it is sent to the payout provider, or asks the provider to stop one already sent. While the payout is `in_review`, or `processing` with nothing sent yet (see `cancelable`), it is canceled and the funds, fees included, return to the balance. Once sent, the response is 202 with a `cancellation` object, and the payout reads `canceled` only if the provider confirms it stopped. A `requested` payout returns 409 until it reaches review, a payout the provider can no longer stop returns 409 with error type `not_cancelable`, and canceling an already-canceled payout returns it unchanged.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payouts.cancel(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Payout ID, prefixed `wdrl_`, or the `cofr_` payout request ID returned by `POST /payouts` — both cancel the same payout.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Owning account ID, prefixed `biz_`. Provide exactly one of `account_id` or `user_id`.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — Owning user ID, prefixed `user_`. Provide exactly one of `account_id` or `user_id`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## People
<details><summary><code>client.people.<a href="/Sources/Resources/People/PeopleClient.swift">list</a>(accountId: String?, query: String?, source: [String]?, attributionModel: ListPeopleRequestAttributionModel?, eventName: [String]?, customEvent: String?, eventWithinDays: Int?, from: Date?, to: Date?, eventFrom: Date?, eventTo: Date?, audienceId: String?, userId: String?, email: String?, phone: String?, country: String?, hasPurchased: Bool?, contactable: Bool?, firstSeenWithinDays: Int?, lastSeenWithinDays: Int?, firstSeenAfter: Date?, firstSeenBefore: Date?, lastSeenAfter: Date?, lastSeenBefore: Date?, ltvGt: Double?, ltvGte: Double?, ltvLt: Double?, ltvLte: Double?, aovGt: Double?, aovGte: Double?, aovLt: Double?, aovLte: Double?, purchaseCountGt: Double?, purchaseCountGte: Double?, purchaseCountLt: Double?, purchaseCountLte: Double?, eventCountGt: Double?, eventCountGte: Double?, eventCountLt: Double?, eventCountLte: Double?, first: Int?, after: String?, before: String?, order: ListPeopleRequestOrder?, direction: ListPeopleRequestDirection?, requestOptions: RequestOptions?) -> ListPeopleResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the people (visitors and customers) of an account: identity-linked profiles assembled from every pixel, payment, and platform event. Filter and sort them to segment an account's audience.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.people.list(
        source: [
            "direct"
        ],
        eventName: [
            "payment.completed"
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Account ID, prefixed `biz_`. Optional for account API keys; required for credentials that can access multiple accounts.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Search people by name, email, phone, or whop user ID (case-insensitive substring match).
    
</dd>
</dl>

<dl>
<dd>

**source:** `[String]?` — Only include people acquired from any of these sources — canonical paths (whop:<campaign>:<group>:<ad>, ext:<platform>:..., referrer:<domain>, direct, other), exact or with a trailing :* prefix. The same vocabulary the events / people metrics use.
    
</dd>
</dl>

<dl>
<dd>

**attributionModel:** `ListPeopleRequestAttributionModel?` — Attribution model the source filter matches against (defaults to last_touch).
    
</dd>
</dl>

<dl>
<dd>

**eventName:** `[String]?` — Only include people who fired any of these events, e.g. payment.completed or page.checkout.view.
    
</dd>
</dl>

<dl>
<dd>

**customEvent:** `String?` — Only include people who fired this custom pixel event.
    
</dd>
</dl>

<dl>
<dd>

**eventWithinDays:** `Int?` — Match activity within a rolling number of days. Cannot be combined with event_from/event_to.
    
</dd>
</dl>

<dl>
<dd>

**from:** `Date?` — Inclusive activity-window start. Alias for event_from.
    
</dd>
</dl>

<dl>
<dd>

**to:** `Date?` — Inclusive activity-window end. Alias for event_to.
    
</dd>
</dl>

<dl>
<dd>

**eventFrom:** `Date?` — The inclusive start of the matching activity window.
    
</dd>
</dl>

<dl>
<dd>

**eventTo:** `Date?` — The inclusive end of the matching activity window, for both stats drilldowns and saved audiences.
    
</dd>
</dl>

<dl>
<dd>

**audienceId:** `String?` — Only include people in this audience. An audience that keeps itself up to date resolves to the People filters that define it, so this always reflects who matches now; uploaded lists and point-in-time snapshots match their recorded members.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — Only include the person linked to this whop user ID.
    
</dd>
</dl>

<dl>
<dd>

**email:** `String?` — Only include the person linked to this email address.
    
</dd>
</dl>

<dl>
<dd>

**phone:** `String?` — Only include the person linked to this phone number.
    
</dd>
</dl>

<dl>
<dd>

**country:** `String?` — Only include people with activity from this ISO 3166-1 alpha-2 country code.
    
</dd>
</dl>

<dl>
<dd>

**hasPurchased:** `Bool?` — true for customers only, false for people who have never purchased.
    
</dd>
</dl>

<dl>
<dd>

**contactable:** `Bool?` — true for people who have an email address or phone number — the ones an ad platform can match.
    
</dd>
</dl>

<dl>
<dd>

**firstSeenWithinDays:** `Int?` — Only include people first seen within this many days, as a rolling window.
    
</dd>
</dl>

<dl>
<dd>

**lastSeenWithinDays:** `Int?` — Only include people last seen within this many days, as a rolling window.
    
</dd>
</dl>

<dl>
<dd>

**firstSeenAfter:** `Date?` — Only include people first seen at or after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**firstSeenBefore:** `Date?` — Only include people first seen before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**lastSeenAfter:** `Date?` — Only include people last seen at or after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**lastSeenBefore:** `Date?` — Only include people last seen before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**ltvGt:** `Double?` — Select people whose lifetime ltv is greater than this value. LTV and AOV are in USD.
    
</dd>
</dl>

<dl>
<dd>

**ltvGte:** `Double?` — Select people whose lifetime ltv is at least this value. LTV and AOV are in USD.
    
</dd>
</dl>

<dl>
<dd>

**ltvLt:** `Double?` — Select people whose lifetime ltv is less than this value. LTV and AOV are in USD.
    
</dd>
</dl>

<dl>
<dd>

**ltvLte:** `Double?` — Select people whose lifetime ltv is at most this value. LTV and AOV are in USD.
    
</dd>
</dl>

<dl>
<dd>

**aovGt:** `Double?` — Select people whose lifetime aov is greater than this value. LTV and AOV are in USD.
    
</dd>
</dl>

<dl>
<dd>

**aovGte:** `Double?` — Select people whose lifetime aov is at least this value. LTV and AOV are in USD.
    
</dd>
</dl>

<dl>
<dd>

**aovLt:** `Double?` — Select people whose lifetime aov is less than this value. LTV and AOV are in USD.
    
</dd>
</dl>

<dl>
<dd>

**aovLte:** `Double?` — Select people whose lifetime aov is at most this value. LTV and AOV are in USD.
    
</dd>
</dl>

<dl>
<dd>

**purchaseCountGt:** `Double?` — Select people whose lifetime purchase_count is greater than this value. LTV and AOV are in USD.
    
</dd>
</dl>

<dl>
<dd>

**purchaseCountGte:** `Double?` — Select people whose lifetime purchase_count is at least this value. LTV and AOV are in USD.
    
</dd>
</dl>

<dl>
<dd>

**purchaseCountLt:** `Double?` — Select people whose lifetime purchase_count is less than this value. LTV and AOV are in USD.
    
</dd>
</dl>

<dl>
<dd>

**purchaseCountLte:** `Double?` — Select people whose lifetime purchase_count is at most this value. LTV and AOV are in USD.
    
</dd>
</dl>

<dl>
<dd>

**eventCountGt:** `Double?` — Select people whose lifetime event_count is greater than this value. LTV and AOV are in USD.
    
</dd>
</dl>

<dl>
<dd>

**eventCountGte:** `Double?` — Select people whose lifetime event_count is at least this value. LTV and AOV are in USD.
    
</dd>
</dl>

<dl>
<dd>

**eventCountLt:** `Double?` — Select people whose lifetime event_count is less than this value. LTV and AOV are in USD.
    
</dd>
</dl>

<dl>
<dd>

**eventCountLte:** `Double?` — Select people whose lifetime event_count is at most this value. LTV and AOV are in USD.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListPeopleRequestOrder?` — Column to sort by. Defaults to last_seen_at.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListPeopleRequestDirection?` — Sort direction. Defaults to desc.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.people.<a href="/Sources/Resources/People/PeopleClient.swift">retrieve</a>(id: String, accountId: String?, requestOptions: RequestOptions?) -> RetrievePeopleResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves one person for an account, looked up by person ID, user ID, email address, or phone number.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.people.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The person ID (prefixed `prsn_`), user ID (prefixed `user_`), email address, or phone number to look up. A merged person resolves to the surviving profile.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Account ID, prefixed `biz_`. Optional for account API keys; required for credentials that can access multiple accounts.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Permissions
<details><summary><code>client.permissions.<a href="/Sources/Resources/Permissions/PermissionsClient.swift">list</a>(resourceId: String, actions: String?, requestOptions: RequestOptions?) -> ListPermissionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists permission actions and whether the calling credential is granted each one for a resource. Answers for whichever identity authenticated the request — a user session, an OAuth token, or an account or app API key — so it never describes who else can reach the resource.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.permissions.list(resourceId: "resource_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**resourceId:** `String` — Tag of the resource to check against: an account (`biz_`), product (`prod_`), experience (`exp_`), or app (`app_`). A resource the credential cannot see is reported as granted nothing rather than as an error.
    
</dd>
</dl>

<dl>
<dd>

**actions:** `String?` — Comma-separated permission actions to check, for example `stats:read,payment:basic:read`. Every action is returned when omitted.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Plans
<details><summary><code>client.plans.<a href="/Sources/Resources/Plans/PlansClient.swift">list</a>(accountId: String?, direction: ListPlansRequestDirection?, order: ListPlansRequestOrder?, releaseMethods: [String]?, visibilities: [String]?, billingTypes: [String]?, productIds: [String]?, createdBefore: String?, createdAfter: String?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListPlansResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deprecated compatibility endpoint. List variants with `GET /variants` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.plans.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListPlansRequestDirection?` 
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListPlansRequestOrder?` 
    
</dd>
</dl>

<dl>
<dd>

**releaseMethods:** `[String]?` 
    
</dd>
</dl>

<dl>
<dd>

**visibilities:** `[String]?` 
    
</dd>
</dl>

<dl>
<dd>

**billingTypes:** `[String]?` 
    
</dd>
</dl>

<dl>
<dd>

**productIds:** `[String]?` 
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.plans.<a href="/Sources/Resources/Plans/PlansClient.swift">create</a>(request: Requests.CreatePlansRequest, requestOptions: RequestOptions?) -> Plan</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deprecated compatibility endpoint. Create variants with `POST /variants` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.plans.create(request: .init())
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreatePlansRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.plans.<a href="/Sources/Resources/Plans/PlansClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Plan</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deprecated compatibility endpoint. Retrieve variants with `GET /variants/{id}` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.plans.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Variant ID, prefixed `plan_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.plans.<a href="/Sources/Resources/Plans/PlansClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> DeletePlansResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deprecated compatibility endpoint. Delete variants with `DELETE /variants/{id}` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.plans.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Variant ID, prefixed `plan_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.plans.<a href="/Sources/Resources/Plans/PlansClient.swift">update</a>(id: String, request: Requests.UpdatePlansRequest, requestOptions: RequestOptions?) -> Plan</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deprecated compatibility endpoint. Update variants with `PATCH /variants/{id}` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.plans.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Variant ID, prefixed `plan_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdatePlansRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.plans.<a href="/Sources/Resources/Plans/PlansClient.swift">calculateTax</a>(id: String, request: Requests.CalculateTaxPlansRequest, requestOptions: RequestOptions?) -> CalculateTaxPlansResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deprecated compatibility endpoint. Quote tax with `POST /payment_quotes` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.plans.calculateTax(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Variant ID, prefixed `plan_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.CalculateTaxPlansRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Product Affiliates
<details><summary><code>client.productAffiliates.<a href="/Sources/Resources/ProductAffiliates/ProductAffiliatesClient.swift">list</a>(accountId: String, query: String?, status: ListProductAffiliatesRequestStatus?, productIds: [String]?, createdAfter: Date?, createdBefore: Date?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListProductAffiliatesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists affiliate enrollments for an account's products, newest first, including affiliates who have not made a referral. Requires `affiliate:basic:read` on the account. Email addresses and email search also require `member:email:read`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.productAffiliates.list(
        accountId: "account_id",
        productIds: [
            "prod_xxxxxxxxxxxxxx"
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Account whose product affiliates are listed (`biz_` tag).
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Matches the start of the affiliate's username or of any word in their name, or their exact email (with `member:email:read`).
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListProductAffiliatesRequestStatus?` — Only product affiliates with this status.
    
</dd>
</dl>

<dl>
<dd>

**productIds:** `[String]?` — Only product affiliates of these products.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Only signups at or after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Only signups before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Products
<details><summary><code>client.products.<a href="/Sources/Resources/Products/ProductsClient.swift">list</a>(accountId: String?, query: String?, marketplaceCategoryRoute: String?, billingTypes: [ListProductsRequestBillingTypesItem]?, priceMinimum: Double?, priceMaximum: Double?, visibilities: [String]?, accessPassTypes: [String]?, labels: [String]?, direction: ListProductsRequestDirection?, order: ListProductsRequestOrder?, first: Int?, after: String?, last: Int?, before: String?, includeTotalCount: Bool?, createdAfter: String?, createdBefore: String?, requestOptions: RequestOptions?) -> ListProductsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists an account's products, or searches the public marketplace when you omit `account_id`. Without the `access_pass:basic:read` permission on the account, including when signed out, the list holds only the products its store page lists.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.products.list(
        visibilities: [
            "visible"
        ],
        accessPassTypes: [
            "regular"
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Account to list products for, prefixed `biz_`. Without the `access_pass:basic:read` permission on it, only the products its store page lists are returned. Omit to search the public marketplace.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Filters products by text. The public marketplace list searches product title, account name, headline and description, ranking products that match every word first and the closest partial matches after them; an account's own list is a plain substring match over title, headline and description. Omit to browse by recency.
    
</dd>
</dl>

<dl>
<dd>

**marketplaceCategoryRoute:** `String?` — Only return marketplace products assigned to this category route, such as `trading`.
    
</dd>
</dl>

<dl>
<dd>

**billingTypes:** `[ListProductsRequestBillingTypesItem]?` — Filter to products with a buyable variant of these billing models, such as `one_time` or `renewal`. On an account list, needs the `access_pass:basic:read` permission.
    
</dd>
</dl>

<dl>
<dd>

**priceMinimum:** `Double?` — Only return products whose advertised buyable variant has a displayed price of at least this amount. Recurring variants use renewal price. On an account list, needs the `access_pass:basic:read` permission.
    
</dd>
</dl>

<dl>
<dd>

**priceMaximum:** `Double?` — Only return products whose advertised buyable variant has a displayed price of at most this amount. Recurring variants use renewal price. On an account list, needs the `access_pass:basic:read` permission.
    
</dd>
</dl>

<dl>
<dd>

**visibilities:** `[String]?` — Filter to only products matching these visibility states. Ignored on the public marketplace list, which only returns visible products. Without the `access_pass:basic:read` permission on the account, only `visible` matches anything.
    
</dd>
</dl>

<dl>
<dd>

**accessPassTypes:** `[String]?` — Filter to only products matching these types.
    
</dd>
</dl>

<dl>
<dd>

**labels:** `[String]?` — Filter to only products carrying all of these labels. Labels are matched lowercased.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListProductsRequestDirection?` — The sort direction for results. Defaults to descending.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListProductsRequestOrder?` — Field to sort results by. Account lists default to `created_at`, and `position` with `direction` `asc` matches the order the store page shows. Without the `access_pass:basic:read` permission, an account list sorts only by `created_at` or `position`. Marketplace lists default to `discoverable_at`, accept only `created_at` or `discoverable_at`, and can't be combined with `query`.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**includeTotalCount:** `Bool?` — Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only return products created after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only return products created before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.products.<a href="/Sources/Resources/Products/ProductsClient.swift">create</a>(request: Requests.CreateProductsRequest, requestOptions: RequestOptions?) -> Product</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a new product for an account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.products.create(request: .init(title: "Interior Deep Clean"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateProductsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.products.<a href="/Sources/Resources/Products/ProductsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Product</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a product. Requires no authentication.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.products.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the product.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.products.<a href="/Sources/Resources/Products/ProductsClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> DeleteProductsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a product. Only products with no memberships, entries, reviews, or invoices can be deleted.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.products.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the product.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.products.<a href="/Sources/Resources/Products/ProductsClient.swift">update</a>(id: String, request: Requests.UpdateProductsRequest, requestOptions: RequestOptions?) -> Product</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an existing product.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.products.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the product.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateProductsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.products.<a href="/Sources/Resources/Products/ProductsClient.swift">publish</a>(id: String, requestOptions: RequestOptions?) -> Product</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Submits an App Store app's product for review. The product moves to `pending_review`; a Whop reviewer approves it before it goes live. Other products can no longer be listed on the whop.com marketplace, so the request fails with `discover_listing_discontinued`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.products.publish(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the product, prefixed `prod_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.products.<a href="/Sources/Resources/Products/ProductsClient.swift">unpublish</a>(id: String, requestOptions: RequestOptions?) -> Product</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Removes a product from the whop.com marketplace. The product moves to `not_available`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.products.unpublish(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the product, prefixed `prod_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Promo Codes
<details><summary><code>client.promoCodes.<a href="/Sources/Resources/PromoCodes/PromoCodesClient.swift">list</a>(accountId: String, status: ListPromoCodesRequestStatus?, productIds: [String]?, variantIds: [String]?, createdBefore: Date?, createdAfter: Date?, order: ListPromoCodesRequestOrder?, direction: ListPromoCodesRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, includeTotalCount: Bool?, requestOptions: RequestOptions?) -> ListPromoCodesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists an account's promo codes.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.promoCodes.list(
        accountId: "account_id",
        productIds: [
            "prod_xxxxxxxxxxxxxx"
        ],
        variantIds: [
            "plan_xxxxxxxxxxxxxx"
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Account whose promo codes are listed (`biz_` tag).
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListPromoCodesRequestStatus?` — Promo-code status. `expired` groups inactive and archived codes.
    
</dd>
</dl>

<dl>
<dd>

**productIds:** `[String]?` — Only promo codes scoped to these product IDs.
    
</dd>
</dl>

<dl>
<dd>

**variantIds:** `[String]?` — Only promo codes scoped to these variant IDs.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Only promo codes created before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Only promo codes created after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListPromoCodesRequestOrder?` — Sort field.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListPromoCodesRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**includeTotalCount:** `Bool?` — Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.promoCodes.<a href="/Sources/Resources/PromoCodes/PromoCodesClient.swift">create</a>(request: Requests.CreatePromoCodesRequest, requestOptions: RequestOptions?) -> PromoCode</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a promo code for an account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.promoCodes.create(request: .init(
        accountId: "biz_xxxxxxxxxxxxxx",
        amountOff: 25,
        baseCurrency: .usd,
        code: "AFFILIATE25",
        newUsersOnly: true,
        promoDurationMonths: 3,
        promoType: .percentage
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreatePromoCodesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.promoCodes.<a href="/Sources/Resources/PromoCodes/PromoCodesClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> PromoCode</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a promo code by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.promoCodes.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Promo code ID (`promo_` tag).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.promoCodes.<a href="/Sources/Resources/PromoCodes/PromoCodesClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> DeletePromoCodesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Archives a promo code so it cannot be used in future checkouts.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.promoCodes.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Promo code ID (`promo_` tag).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.promoCodes.<a href="/Sources/Resources/PromoCodes/PromoCodesClient.swift">activate</a>(id: String, requestOptions: RequestOptions?) -> PromoCode</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Turns an inactive promo code back on so it can be redeemed at checkout.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.promoCodes.activate(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Promo code ID (`promo_` tag).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.promoCodes.<a href="/Sources/Resources/PromoCodes/PromoCodesClient.swift">deactivate</a>(id: String, requestOptions: RequestOptions?) -> PromoCode</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Turns off an active promo code so it can no longer be redeemed at checkout.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.promoCodes.deactivate(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Promo code ID (`promo_` tag).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Reactions
<details><summary><code>client.reactions.<a href="/Sources/Resources/Reactions/ReactionsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, resourceId: String, requestOptions: RequestOptions?) -> ListReactionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of emoji reactions on a specific message or forum post, sorted by most recent.

Required permissions (one of):
 - `chat:read`
 - `dms:read`
 - `forum:read`
 - `livestream:chat:read`
 - `support_chat:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.reactions.list(
        first: 42,
        last: 42,
        resourceId: "resource_id"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**resourceId:** `String` — The unique identifier of the message or forum post to list reactions for.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.reactions.<a href="/Sources/Resources/Reactions/ReactionsClient.swift">create</a>(request: Requests.CreateReactionsRequest, requestOptions: RequestOptions?) -> Reaction</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Add an emoji reaction or poll vote to a message or forum post. In forums, the reaction is always a like.

Required permissions (one of):
 - `chat:read`
 - `dms:read`
 - `forum:read`
 - `livestream:chat:read`
 - `support_chat:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.reactions.create(request: .init(resourceId: "resource_id"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateReactionsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.reactions.<a href="/Sources/Resources/Reactions/ReactionsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Reaction</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing reaction.

Required permissions (one of):
 - `chat:read`
 - `dms:read`
 - `forum:read`
 - `livestream:chat:read`
 - `support_chat:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.reactions.retrieve(id: "reac_xxxxxxxxxxxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the reaction to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.reactions.<a href="/Sources/Resources/Reactions/ReactionsClient.swift">delete</a>(id: String, emoji: String?, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove an emoji reaction from a message or forum post. Only the reaction author or a channel admin can remove a reaction.

Required permissions (one of):
 - `chat:read`
 - `dms:read`
 - `forum:read`
 - `livestream:chat:read`
 - `support_chat:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.reactions.delete(id: "reac_xxxxxxxxxxxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the reaction to remove, or the identifier of the message or forum post to remove a reaction from. When passing a message or post ID, you must also provide the emoji argument.
    
</dd>
</dl>

<dl>
<dd>

**emoji:** `String?` — The emoji to remove, in shortcode or unicode format. For example, ':heart:' or a unicode emoji. Required when the id refers to a message or post instead of a reaction.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Refunds
<details><summary><code>client.refunds.<a href="/Sources/Resources/Refunds/RefundsClient.swift">list</a>(accountId: String?, paymentId: String?, userId: String?, createdBefore: Date?, createdAfter: Date?, order: ListRefundsRequestOrder?, direction: ListRefundsRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListRefundsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists refunds the caller can read, newest first. Filter by payment, account, or buyer to narrow the results.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.refunds.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Only refunds issued by this account, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**paymentId:** `String?` — Only refunds of this payment, prefixed `pay_`.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — Only refunds to this buyer, prefixed `user_`.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Only refunds requested before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Only refunds requested after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListRefundsRequestOrder?` — The field to sort by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListRefundsRequestDirection?` — The sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.refunds.<a href="/Sources/Resources/Refunds/RefundsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Refund</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns one refund.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.refunds.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The refund to retrieve, prefixed `rf_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Resolution Center Cases
<details><summary><code>client.resolutionCenterCases.<a href="/Sources/Resources/ResolutionCenterCases/ResolutionCenterCasesClient.swift">list</a>(accountId: String?, userId: String?, first: Int?, after: String?, last: Int?, before: String?, order: ListResolutionCenterCasesRequestOrder?, direction: ListResolutionCenterCasesRequestDirection?, status: [ListResolutionCenterCasesRequestStatusItem]?, reason: [ListResolutionCenterCasesRequestReasonItem]?, outcome: [ListResolutionCenterCasesRequestOutcomeItem]?, createdBefore: String?, createdAfter: String?, requestOptions: RequestOptions?) -> ListResolutionCenterCasesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists resolution center cases. Without `account_id` you get every case you can read — the ones you opened as a buyer and every account you are a team member of; the filters narrow that list.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.resolutionCenterCases.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Only cases filed against this account (`biz_` tag). With read access to the account this lists its whole queue; without, only the cases you opened against it.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — Only cases opened by this customer — a `user_` tag, or `me` for the calling user. It narrows what you can already read, so `me` lists the cases you opened without the ones on accounts you are a team member of.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListResolutionCenterCasesRequestOrder?` — The field to sort cases by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListResolutionCenterCasesRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**status:** `[ListResolutionCenterCasesRequestStatusItem]?` — Only cases in these statuses. Repeat the parameter to pass several — one paginated list covers all of them.
    
</dd>
</dl>

<dl>
<dd>

**reason:** `[ListResolutionCenterCasesRequestReasonItem]?` — Only cases opened for these reasons. Repeat the parameter to pass several.
    
</dd>
</dl>

<dl>
<dd>

**outcome:** `[ListResolutionCenterCasesRequestOutcomeItem]?` — Only closed cases that ended these ways. Repeat the parameter to pass several.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only cases created before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only cases created after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.resolutionCenterCases.<a href="/Sources/Resources/ResolutionCenterCases/ResolutionCenterCasesClient.swift">create</a>(request: Requests.CreateResolutionCenterCasesRequest, requestOptions: RequestOptions?) -> ResolutionCenterCase</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Opens a case, as the customer, against one of your own payments. Provide the payment (`receipt_id`), the `reason`, and a `message`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.resolutionCenterCases.create(request: .init(
        message: "The mobile detailer never showed up for the Ceramic Coating appointment.",
        reason: .fraudulent,
        receiptId: "pay_xxxxxxxxxxxxxx"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateResolutionCenterCasesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.resolutionCenterCases.<a href="/Sources/Resources/ResolutionCenterCases/ResolutionCenterCasesClient.swift">summary</a>(groups: [SummaryResolutionCenterCasesRequestGroupsItem]?, accountId: String?, userId: String?, status: [SummaryResolutionCenterCasesRequestStatusItem]?, reason: [SummaryResolutionCenterCasesRequestReasonItem]?, outcome: [SummaryResolutionCenterCasesRequestOutcomeItem]?, createdBefore: String?, createdAfter: String?, requestOptions: RequestOptions?) -> SummaryResolutionCenterCasesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Aggregates the same cases `GET /resolution_center_cases` lists, using the same filters. Use it to build status tabs and issue filters without paging the whole list.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.resolutionCenterCases.summary()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**groups:** `[SummaryResolutionCenterCasesRequestGroupsItem]?` — Which breakdowns to return, keyed by these names under `groups`. Repeat the parameter to ask for several; omit it for all of them.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — The account to summarize cases for (`biz_` tag).
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — Only cases opened by this customer — a `user_` tag, or `me` for the calling user.
    
</dd>
</dl>

<dl>
<dd>

**status:** `[SummaryResolutionCenterCasesRequestStatusItem]?` — Only cases in these statuses.
    
</dd>
</dl>

<dl>
<dd>

**reason:** `[SummaryResolutionCenterCasesRequestReasonItem]?` — Only cases opened for these reasons.
    
</dd>
</dl>

<dl>
<dd>

**outcome:** `[SummaryResolutionCenterCasesRequestOutcomeItem]?` — Only closed cases that ended these ways.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only count cases created before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only count cases created after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.resolutionCenterCases.<a href="/Sources/Resources/ResolutionCenterCases/ResolutionCenterCasesClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> ResolutionCenterCase</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a single resolution center case with its full event timeline.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.resolutionCenterCases.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The resolution center case ID (`reso_` tag).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.resolutionCenterCases.<a href="/Sources/Resources/ResolutionCenterCases/ResolutionCenterCasesClient.swift">accept</a>(id: String, request: Requests.AcceptResolutionCenterCasesRequest, requestOptions: RequestOptions?) -> ResolutionCenterCase</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Accepts the case in the customer's favor, as the merchant: refunds the payment in full and closes the case.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.resolutionCenterCases.accept(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The resolution center case ID (`reso_` tag).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.AcceptResolutionCenterCasesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.resolutionCenterCases.<a href="/Sources/Resources/ResolutionCenterCases/ResolutionCenterCasesClient.swift">appeal</a>(id: String, request: Requests.AppealResolutionCenterCasesRequest, requestOptions: RequestOptions?) -> ResolutionCenterCase</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Appeals a decision, as the customer, on a case that closed in the merchant's favor. Escalates the case to Whop for platform review. A case can be appealed once, within 7 days of the decision.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.resolutionCenterCases.appeal(
        id: "id",
        request: .init(message: "The coating is already flaking on the hood two weeks later.")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The resolution center case ID (`reso_` tag).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.AppealResolutionCenterCasesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.resolutionCenterCases.<a href="/Sources/Resources/ResolutionCenterCases/ResolutionCenterCasesClient.swift">deny</a>(id: String, request: Requests.DenyResolutionCenterCasesRequest, requestOptions: RequestOptions?) -> ResolutionCenterCase</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Denies the case, as the merchant: rejects the claim and closes the case with no refund.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.resolutionCenterCases.deny(
        id: "id",
        request: .init(message: "The ceramic coating was applied and the vehicle was collected on 2026-01-05.")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The resolution center case ID (`reso_` tag).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.DenyResolutionCenterCasesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.resolutionCenterCases.<a href="/Sources/Resources/ResolutionCenterCases/ResolutionCenterCasesClient.swift">events</a>(id: String, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> EventsResolutionCenterCasesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the case timeline, newest first. Events the viewer is not allowed to see are omitted — a customer reads the customer-visible timeline, the merchant reads the full one.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.resolutionCenterCases.events(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The resolution center case ID (`reso_` tag).
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.resolutionCenterCases.<a href="/Sources/Resources/ResolutionCenterCases/ResolutionCenterCasesClient.swift">reply</a>(id: String, request: Requests.ReplyResolutionCenterCasesRequest, requestOptions: RequestOptions?) -> ResolutionCenterCase</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Replies to an open request for information on the case. As the merchant this answers Whop's request (valid while the case awaits your information); as the customer it provides the information requested from you. The actor is resolved from the credential.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.resolutionCenterCases.reply(
        id: "id",
        request: .init(message: "Here are the before and after photos from the Burnet Rd bay.")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The resolution center case ID (`reso_` tag).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ReplyResolutionCenterCasesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.resolutionCenterCases.<a href="/Sources/Resources/ResolutionCenterCases/ResolutionCenterCasesClient.swift">requestInfo</a>(id: String, request: Requests.RequestInfoResolutionCenterCasesRequest, requestOptions: RequestOptions?) -> ResolutionCenterCase</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Asks the customer for more information, as the merchant. Allowed up to 3 times per case before you must accept or deny it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.resolutionCenterCases.requestInfo(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The resolution center case ID (`reso_` tag).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.RequestInfoResolutionCenterCasesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.resolutionCenterCases.<a href="/Sources/Resources/ResolutionCenterCases/ResolutionCenterCasesClient.swift">withdraw</a>(id: String, requestOptions: RequestOptions?) -> ResolutionCenterCase</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Withdraws (cancels) a case you opened, as the customer. Only possible while the case is still open.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.resolutionCenterCases.withdraw(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The resolution center case ID (`reso_` tag).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Review reports
<details><summary><code>client.reviewReports.<a href="/Sources/Resources/ReviewReports/ReviewReportsClient.swift">list</a>(accountId: String?, reviewId: String?, status: ListReviewReportsRequestStatus?, createdBefore: Date?, createdAfter: Date?, order: ListReviewReportsRequestOrder?, direction: ListReviewReportsRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListReviewReportsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the reports filed against customer reviews on the accounts you can moderate, newest first. Use it to check whether a review was reported and where the report stands. Omit `account_id` to cover every account you can moderate.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.reviewReports.list(
        accountId: "biz_xxxxxxxxxxxxxx",
        reviewId: "rev_xxxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Only reports on this account's reviews.
    
</dd>
</dl>

<dl>
<dd>

**reviewId:** `String?` — Only reports filed against this review.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListReviewReportsRequestStatus?` — Only reports in this status.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Only reports filed before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Only reports filed after this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListReviewReportsRequestOrder?` — The field to sort reports by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListReviewReportsRequestDirection?` — The sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Reviews
<details><summary><code>client.reviews.<a href="/Sources/Resources/Reviews/ReviewsClient.swift">list</a>(accountId: String?, productId: String?, minStars: Int?, maxStars: Int?, createdBefore: Date?, createdAfter: Date?, order: ListReviewsRequestOrder?, direction: ListReviewsRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, includeTotalCount: Bool?, requestOptions: RequestOptions?) -> ListReviewsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the published reviews for a product or account. Without `account_id` or `product_id`, a user lists the reviews they wrote, an account or app API key lists its account's reviews, and a request without credentials returns 400.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.reviews.list(
        accountId: "biz_xxxxxxxxxxxxxx",
        productId: "prod_xxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — The unique identifier of the account to list reviews for.
    
</dd>
</dl>

<dl>
<dd>

**productId:** `String?` — The unique identifier of the product to list reviews for.
    
</dd>
</dl>

<dl>
<dd>

**minStars:** `Int?` — The minimum star rating to include in results, from 1 to 5 inclusive.
    
</dd>
</dl>

<dl>
<dd>

**maxStars:** `Int?` — The maximum star rating to include in results, from 1 to 5 inclusive.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Only return reviews created before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Only return reviews created after this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListReviewsRequestOrder?` — The field to sort reviews by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListReviewsRequestDirection?` — The sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**includeTotalCount:** `Bool?` — Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.reviews.<a href="/Sources/Resources/Reviews/ReviewsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Review</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a published review. Reviews that are not published return 404.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.reviews.retrieve(id: "rev_xxxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the review.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.reviews.<a href="/Sources/Resources/Reviews/ReviewsClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> DeleteReviewsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a review the signed-in user wrote. Requires the `review:delete` scope, and returns 404 for a review another user wrote.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.reviews.delete(id: "rev_xxxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the review.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Search
<details><summary><code>client.search.<a href="/Sources/Resources/Search/SearchClient.swift">list</a>(query: String, types: [ListSearchRequestTypesItem]?, accountId: String, includeSubaccounts: Bool?, first: Int?, requestOptions: RequestOptions?) -> ListSearchResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Searches one account's records in one call. `account` rows are `account_id` itself and, when you send `include_subaccounts`, its subaccounts; every other row belongs to one of those accounts.

Each `object` needs its own read permission on the record's account, and rows you can't read are left out without an error: `account` (`biz_`, `company:basic:read`), `member` (`mber_`, `member:basic:read`), `membership` (`mem_`, `member:basic:read`), `payment` (`pay_`, `payment:basic:read`), `affiliate` (`aff_`, `affiliate:basic:read`), `review` (`rev_`, `company:basic:read`), `resolution_center_case` (`reso_`, `payment:resolution_center_case:read`) and `promo_code` (`promo_`, `promo_code:basic:read`). A query containing `@` also needs `member:email:read`, and a phone match `member:phone:read`. An invoice's number finds the invoice as its `payment`.

`query` is trimmed and has to be 2 to 250 characters; a full card number returns a `400`. `data` comes identifier matches first, such as a pasted ID, email address, card digits or invoice number, newest first within each kind of match. Every query of 3 or more characters is also ranked, and ranked rows follow, best match first. Each record appears once, and `match_reason` says why it matched. [Search](/api-reference/search/search) lists the query shapes and match reasons.

`first` caps the rows, 20 by default and up to 100. There is no cursor yet, so the response is a single page. Search ranks; to filter one resource or page through every match, use its list endpoint, such as `GET /payments?query=`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.search.list(
        query: "query",
        accountId: "account_id"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**query:** `String` — Text to search for, 2 to 250 characters.
    
</dd>
</dl>

<dl>
<dd>

**types:** `[ListSearchRequestTypesItem]?` — Kinds of records to search. Defaults to every kind. `account` rows are `account_id` itself and, with `include_subaccounts`, its subaccounts.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String` — The account to search, prefixed `biz_`. Records other than accounts belong to it, or with `include_subaccounts` to its subaccounts. Your credential needs read access to at least one kind of record on it that search returns, or the account is a 404.
    
</dd>
</dl>

<dl>
<dd>

**includeSubaccounts:** `Bool?` — `true` also searches the subaccounts of a platform `account_id`: an ID, an email, card digits or a phone number finds their records, and the subaccounts themselves are found as `account` rows by name, ID or store link, or by the email of their owner, a team member or a customer. Safe to send for any account: one without subaccounts is searched as if this were false.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Setup Intents
<details><summary><code>client.setupIntents.<a href="/Sources/Resources/SetupIntents/SetupIntentsClient.swift">list</a>(accountId: String?, status: ListSetupIntentsRequestStatus?, createdBefore: Date?, createdAfter: Date?, order: ListSetupIntentsRequestOrder?, direction: ListSetupIntentsRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListSetupIntentsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists setup intents newest first. An account API key lists its own account; a user token lists every account it can read, or one account with `account_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.setupIntents.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Only setup intents for this account, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListSetupIntentsRequestStatus?` — Only setup intents in this state.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Only setup intents created before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Only setup intents created after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListSetupIntentsRequestOrder?` — The field to sort by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListSetupIntentsRequestDirection?` — The sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.setupIntents.<a href="/Sources/Resources/SetupIntents/SetupIntentsClient.swift">create</a>(request: Requests.CreateSetupIntentsRequest, requestOptions: RequestOptions?) -> SetupIntent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Saves a buyer's payment method for later without charging it — one the buyer just supplied through the payment elements in setup mode, or one already on file to re-verify. The setup completes in the background, so the response is the setup intent as created, not its outcome: hand `client_secret` to the elements' `handleNextAction`, or poll Retrieve setup status. A buyer's own token holding `member:payment_methods:use` may create a setup intent for itself from a confirmation token.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.setupIntents.create(request: .init(accountId: "biz_xxxxxxxxxxxxxx"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateSetupIntentsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.setupIntents.<a href="/Sources/Resources/SetupIntents/SetupIntentsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> SetupIntent</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a setup intent. Once its `status` is `succeeded`, charge the saved method by its `payment_method_id`. The buyer's own token may retrieve a setup intent that belongs to it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.setupIntents.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The setup intent to retrieve, prefixed `sint_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.setupIntents.<a href="/Sources/Resources/SetupIntents/SetupIntentsClient.swift">updateReturnUrl</a>(setupIntentId: String, request: Requests.UpdateReturnUrlSetupIntentsRequest, requestOptions: RequestOptions?) -> SetupStatus</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Changes where the buyer lands after completing an off-site step, up until they return. Accepts either a secret key or the setup's own `client_secret` in the body, so the surface that knows the final destination can set it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.setupIntents.updateReturnUrl(
        setupIntentId: "setup_intent_id",
        request: .init(returnUrl: "https://shinetime.example/checkout/thanks")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**setupIntentId:** `String` — The unique identifier of the setup intent.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateReturnUrlSetupIntentsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.setupIntents.<a href="/Sources/Resources/SetupIntents/SetupIntentsClient.swift">retrieveStatus</a>(setupIntentId: String, clientSecret: String?, requestOptions: RequestOptions?) -> SetupStatus</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves how far a setup has got and what the buyer must do next, if anything. Collection runs in the background, so poll this rather than reading the create response. Accepts either a secret key or the setup's own `client_secret` as a query parameter, so the surface collecting the payment method can poll it directly.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.setupIntents.retrieveStatus(setupIntentId: "setup_intent_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**setupIntentId:** `String` — The unique identifier of the setup intent.
    
</dd>
</dl>

<dl>
<dd>

**clientSecret:** `String?` — The setup's own `client_secret`, for a caller without a secret key.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Shipments
<details><summary><code>client.shipments.<a href="/Sources/Resources/Shipments/ShipmentsClient.swift">list</a>(accountId: String?, status: ListShipmentsRequestStatus?, paymentId: [String]?, createdBefore: String?, createdAfter: String?, order: ListShipmentsRequestOrder?, direction: ListShipmentsRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListShipmentsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists an account's shipments.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.shipments.list(paymentId: [
        "pay_xxxxxxxxxxxxxx"
    ])
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — The account to list shipments for. Defaults to the acting account.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListShipmentsRequestStatus?` — Filter to shipments with this delivery status.
    
</dd>
</dl>

<dl>
<dd>

**paymentId:** `[String]?` — Only shipments fulfilling these payments, each prefixed `pay_`. Repeat the parameter to pass several, up to 100 per request — one paginated list covers all of them.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Return shipments created before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Return shipments created after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListShipmentsRequestOrder?` — The field to sort by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListShipmentsRequestDirection?` — The sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.shipments.<a href="/Sources/Resources/Shipments/ShipmentsClient.swift">create</a>(request: Requests.CreateShipmentsRequest, requestOptions: RequestOptions?) -> Shipment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Attaches a carrier tracking number to a payment and begins tracking it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.shipments.create(request: .init(
        paymentId: "pay_xxxxxxxxxxxxxx",
        trackingNumber: "1Z999AA10123456784"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateShipmentsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.shipments.<a href="/Sources/Resources/Shipments/ShipmentsClient.swift">lookup</a>(request: Requests.LookupShipmentsRequest, requestOptions: RequestOptions?) -> ShipmentLookup</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Finds the delivery for a purchase from an account with customer tracking turned on, using exactly one order or tracking number plus the buyer's current receipt email. No authentication is required and no sign-in or session is created. Email matching ignores case and surrounding whitespace, but dots and +tags must match. Every miss returns the same 404: an unknown account, tracking turned off, a wrong number or email, an unpaid order or a purchase with nothing to ship. `shipment` is `null` while a paid physical purchase has no tracking yet, unless it has been fully refunded. Limited to 10 attempts per hour per order or tracking number within the account, and 30 attempts per five minutes per client IP and per email within the account. Responses are never cached or replayed with Idempotency-Key.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.shipments.lookup(request: .init(
        accountId: "biz_xxxxxxxxxxxxxx",
        email: "marcus@shinetime.example"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.LookupShipmentsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.shipments.<a href="/Sources/Resources/Shipments/ShipmentsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Shipment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a shipment by its ID, or by the ID of the payment it fulfills.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.shipments.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The shipment id (`ship_`), or the payment id (`pay_`) it fulfills.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.shipments.<a href="/Sources/Resources/Shipments/ShipmentsClient.swift">update</a>(id: String, request: Requests.UpdateShipmentsRequest, requestOptions: RequestOptions?) -> Shipment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a shipment's tracking number and re-tracks it with the carrier.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.shipments.update(
        id: "id",
        request: .init(trackingNumber: "9400111899223456789012")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The shipment id (`ship_`), or the payment id (`pay_`) it fulfills.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateShipmentsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Social Accounts
<details><summary><code>client.socialAccounts.<a href="/Sources/Resources/SocialAccounts/SocialAccountsClient.swift">list</a>(accountId: String?, userId: String?, platform: ListSocialAccountsRequestPlatform?, trustLevel: ListSocialAccountsRequestTrustLevel?, verified: Bool?, scopes: [ListSocialAccountsRequestScopesItem]?, first: Int?, after: String?, last: Int?, before: String?, order: ListSocialAccountsRequestOrder?, direction: ListSocialAccountsRequestDirection?, requestOptions: RequestOptions?) -> ListSocialAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deprecated compatibility endpoint. List external accounts with `GET /external_accounts` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.socialAccounts.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — The Account that the external accounts are connected to. Provide either this or user_id.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — The User that the external accounts are connected to. Provide either this or account_id.
    
</dd>
</dl>

<dl>
<dd>

**platform:** `ListSocialAccountsRequestPlatform?` — Only return external accounts for the platform that is specified. An `aimerce` account is returned only with this filter, which requires the `company:manage_checkout` scope instead of `social_account:read`.
    
</dd>
</dl>

<dl>
<dd>

**trustLevel:** `ListSocialAccountsRequestTrustLevel?` — Only return external accounts linked with this trust level, such as `oauth` for accounts connected through OAuth.
    
</dd>
</dl>

<dl>
<dd>

**verified:** `Bool?` — Only return external accounts that are verified on the platform.
    
</dd>
</dl>

<dl>
<dd>

**scopes:** `[ListSocialAccountsRequestScopesItem]?` — Only return external accounts that have these scopes.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListSocialAccountsRequestOrder?` — The field to sort external accounts by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListSocialAccountsRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.socialAccounts.<a href="/Sources/Resources/SocialAccounts/SocialAccountsClient.swift">create</a>(request: CreateSocialAccountsRequestBody, requestOptions: RequestOptions?) -> SocialAccount</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deprecated compatibility endpoint. Create external accounts with `POST /external_accounts` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.socialAccounts.create(request: CreateSocialAccountsRequestBody.facebook(
        CreateSocialAccountsRequestBodyFacebook(

        )
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `CreateSocialAccountsRequestBody` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.socialAccounts.<a href="/Sources/Resources/SocialAccounts/SocialAccountsClient.swift">connect</a>(request: Requests.ConnectSocialAccountsRequest, requestOptions: RequestOptions?) -> ConnectSocialAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deprecated compatibility endpoint. Connect external accounts with `POST /external_accounts/connect` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.socialAccounts.connect(request: .init(
        platform: .tiktok,
        redirectUrl: "https://whop.com/dashboard/biz_xxxxxxxxxxxxxx/settings"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.ConnectSocialAccountsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.socialAccounts.<a href="/Sources/Resources/SocialAccounts/SocialAccountsClient.swift">delete</a>(id: String, accountId: String?, userId: String?, requestOptions: RequestOptions?) -> DeleteSocialAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deprecated compatibility endpoint. Disconnect external accounts with `DELETE /external_accounts/{id}` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.socialAccounts.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the social account to disconnect.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.socialAccounts.<a href="/Sources/Resources/SocialAccounts/SocialAccountsClient.swift">refresh</a>(id: String, request: Requests.RefreshSocialAccountsRequest, requestOptions: RequestOptions?) -> SocialAccount</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deprecated compatibility endpoint. Refresh external accounts with `POST /external_accounts/{id}/refresh` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.socialAccounts.refresh(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The social account (a sacc_ identifier) to refresh.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.RefreshSocialAccountsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Stats
<details><summary><code>client.stats.<a href="/Sources/Resources/Stats/StatsClient.swift">list</a>(requestOptions: RequestOptions?) -> ListStatsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deprecated. Lists every metric without saying which ones you can chart. List chartable metrics with `GET /stats/time_series`, and aggregates that are not bucketed over time with `GET /stats/reports`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.stats.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.stats.<a href="/Sources/Resources/Stats/StatsClient.swift">retrieve</a>(metric: String, accountId: String?, userId: String?, from: String, to: String, interval: RetrieveStatsRequestInterval?, breakdownBy: String?, convertTo: String?, currency: String?, timeZone: String?, paymentMethod: String?, cardNetwork: String?, disputeReason: String?, source: String?, hostname: String?, page: String?, deviceType: String?, countryCode: String?, eventName: String?, eventType: RetrieveStatsRequestEventType?, customName: String?, segment: String?, category: String?, merchant: String?, feeType: String?, product: String?, status: String?, accessLevel: String?, mostRecentAction: String?, referredUserId: String?, adCampaignIds: [String]?, adGroupIds: [String]?, adIds: [String]?, snapshotWindow: RetrieveStatsRequestSnapshotWindow?, event: String?, businessType: String?, industryType: String?, productCategory: String?, accountCountry: String?, issuer: String?, webhookId: String?, conversionWindow: String?, matureOnly: Bool?, steps: RetrieveStatsRequestSteps?, compareTo: String?, confidenceLevel: Double?, contactable: Bool?, hasPurchased: Bool?, firstSeenAfter: Date?, firstSeenBefore: Date?, lastSeenAfter: Date?, lastSeenBefore: Date?, firstSeenWithinDays: Int?, lastSeenWithinDays: Int?, known: Bool?, hasEmail: Bool?, hasPhone: Bool?, ltvGt: Double?, ltvGte: Double?, ltvLt: Double?, ltvLte: Double?, aovGt: Double?, aovGte: Double?, aovLt: Double?, aovLte: Double?, purchaseCountGt: Double?, purchaseCountGte: Double?, purchaseCountLt: Double?, purchaseCountLte: Double?, eventCountGt: Double?, eventCountGte: Double?, eventCountLt: Double?, eventCountLte: Double?, referringAccountId: String?, teamLeadId: String?, activity: RetrieveStatsRequestActivity?, breakdownLimit: Int?, requestOptions: RequestOptions?) -> RetrieveStatsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deprecated compatibility endpoint. Retrieve a metric's time series with `GET /stats/time_series/{metric}` instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.stats.retrieve(
        metric: "metric",
        from: "from",
        to: "to",
        adCampaignIds: [
            "adcamp_xxxxxxxxxxxxxx"
        ],
        adGroupIds: [
            "adgrp_xxxxxxxxxxxxxx"
        ],
        adIds: [
            "ad_xxxxxxxxxxxxxx"
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**metric:** `String` — The metric to retrieve, for example net_revenue.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Account this query concerns, prefixed `biz_`, or `platform` for all of Whop.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — The user this query concerns, for example user_AbC123. Available on metrics that support user subjects, such as account_balance.
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — Start of the range — a date (YYYY-MM-DD), expanded to the start of that day, or an ISO 8601 timestamp (for example 2026-07-16T16:37:00Z), used exactly.
    
</dd>
</dl>

<dl>
<dd>

**to:** `String` — End of the range — a date (YYYY-MM-DD), expanded to the end of that day, or an ISO 8601 timestamp (for example 2026-07-17T16:37:00Z), used exactly. Funnel entry ranges cannot exceed 90 days.
    
</dd>
</dl>

<dl>
<dd>

**interval:** `RetrieveStatsRequestInterval?` — How wide each point is. Defaults to day. Snapshot metrics are day-only. Funnels support at most 2,000 first-entry cohort buckets.
    
</dd>
</dl>

<dl>
<dd>

**breakdownBy:** `String?` — Split the metric out by one of its properties — each point gets a breakdown array. For example breakdown_by=currency returns an entry for usd, an entry for eur, and so on. Funnels use a property of the first matched event, with at most 300 groups. experiment_id and variant require an exposure as step 1. For funnel source breakdowns, steps[1][source]=whop:* groups by campaign, whop:<campaign>:* by ad group, and whop:<campaign>:<group>:* by ad. See the metric catalog for supported breakdowns.
    
</dd>
</dl>

<dl>
<dd>

**convertTo:** `String?` — Display currency for money metrics — every amount is converted into this ISO currency using the exchange rate on each period's date. Defaults to usd. For the ads metrics (ad_spend, ad_delivery), pass the account's ads reporting currency to match the ad entity endpoints. On transaction metrics, it is ignored when you filter or break down by currency (those report the original transaction currency, unconverted).
    
</dd>
</dl>

<dl>
<dd>

**currency:** `String?` — Select the source currency or asset on metrics that list currency. For transaction metrics, for example currency=eur, values are reported without conversion. For market_prices, use btc or xaut and convert_to=usd. Pair with breakdown_by=currency to split a metric by currency.
    
</dd>
</dl>

<dl>
<dd>

**timeZone:** `String?` — IANA time zone to bucket the series in, for example America/New_York. Defaults to UTC. Not accepted by snapshot metrics, which are UTC only.
    
</dd>
</dl>

<dl>
<dd>

**paymentMethod:** `String?` — Filter to a single payment method, for example card or crypto. Available on metrics that list payment_method.
    
</dd>
</dl>

<dl>
<dd>

**cardNetwork:** `String?` — Filter to a single card brand, for example visa. A refinement of payment_method=card. Available on metrics that list card_network.
    
</dd>
</dl>

<dl>
<dd>

**disputeReason:** `String?` — Filter disputes to a normalized reason, for example product_not_received. Pair with breakdown_by=dispute_reason to split dispute counts by reason.
    
</dd>
</dl>

<dl>
<dd>

**source:** `String?` — Filter to a single GMV source, for example payments — or, on the traffic metrics, a visit source (whop_ads, direct, or a utm_source value). Pair with breakdown_by=source to split by source. Available on metrics that list source.
    
</dd>
</dl>

<dl>
<dd>

**hostname:** `String?` — Filter traffic metrics to one website hostname, for example shop.example.com. On the events and people metrics, comma-separated hostnames match any listed hostname. Pair with breakdown_by=hostname to split by website.
    
</dd>
</dl>

<dl>
<dd>

**page:** `String?` — Filter traffic metrics to one page — a hostname plus normalized path, for example shop.example.com/pricing. Pair with breakdown_by=page to split by page.
    
</dd>
</dl>

<dl>
<dd>

**deviceType:** `String?` — Filter traffic metrics to one device type: desktop, mobile, tablet, or unknown. Pair with breakdown_by=device_type to split by device.
    
</dd>
</dl>

<dl>
<dd>

**countryCode:** `String?` — Filter traffic metrics to one visitor country (uppercase ISO 3166-1 alpha-2, for example US). Pair with breakdown_by=country_code to split by country.
    
</dd>
</dl>

<dl>
<dd>

**eventName:** `String?` — Filter the events metric to one tracked event name, for example pixel.page or pixel.custom. Pair with breakdown_by=event_name to split by event.
    
</dd>
</dl>

<dl>
<dd>

**eventType:** `RetrieveStatsRequestEventType?` — Filter the events metric to a canonical group of events: page_view (pixel page views plus whop.com store views), checkout_start (hosted and embedded checkout views), or other. Pair with breakdown_by=event_type to split by group.
    
</dd>
</dl>

<dl>
<dd>

**customName:** `String?` — Filter the events metric to one merchant-defined custom event name. Only valid alongside event_name=pixel.custom. Pair with breakdown_by=custom_name to split custom events by name.
    
</dd>
</dl>

<dl>
<dd>

**segment:** `String?` — Filter to a single wallet-balance segment, for example available. Pair with breakdown_by=segment to split the balance. Available on metrics that list segment.
    
</dd>
</dl>

<dl>
<dd>

**category:** `String?` — Filter to a single balance-activity category, for example payments. Pair with breakdown_by=category to split the activity. Available on metrics that list category.
    
</dd>
</dl>

<dl>
<dd>

**merchant:** `String?` — Filter to a single cashback merchant bucket, for example whop-ads. Pair with breakdown_by=merchant to split cashback by merchant. Available on metrics that list merchant.
    
</dd>
</dl>

<dl>
<dd>

**feeType:** `String?` — Filter to a single fee type. Pair with breakdown_by=fee_type to split fees by type. Available on metrics that list fee_type.
    
</dd>
</dl>

<dl>
<dd>

**product:** `String?` — Filter to a single product (access pass id), for example prod_AbC123. Pair with breakdown_by=product. Available on metrics that list product.
    
</dd>
</dl>

<dl>
<dd>

**status:** `String?` — Filter to a single membership status. Pair with breakdown_by=status. Available on metrics that list status.
    
</dd>
</dl>

<dl>
<dd>

**accessLevel:** `String?` — Filter to a single access level. Pair with breakdown_by=access_level. Available on metrics that list access_level.
    
</dd>
</dl>

<dl>
<dd>

**mostRecentAction:** `String?` — Filter to a single most-recent member action. Pair with breakdown_by=most_recent_action. Available on metrics that list most_recent_action.
    
</dd>
</dl>

<dl>
<dd>

**referredUserId:** `String?` — Filter a referral metric to the businesses attributed to one person you referred, for example user_AbC123. Available on metrics that list referred_user_id.
    
</dd>
</dl>

<dl>
<dd>

**adCampaignIds:** `[String]?` — Ad campaign ids (adcamp_...) to scope the report to; stats are summed across them. Available on metrics that list ad_campaign_ids.
    
</dd>
</dl>

<dl>
<dd>

**adGroupIds:** `[String]?` — Ad group ids (adgrp_...) to scope the report to; stats are summed across them. Available on metrics that list ad_group_ids.
    
</dd>
</dl>

<dl>
<dd>

**adIds:** `[String]?` — Ad ids (ad_...) to scope the report to; stats are summed across them. Available on metrics that list ad_ids.
    
</dd>
</dl>

<dl>
<dd>

**snapshotWindow:** `RetrieveStatsRequestSnapshotWindow?` — Window used by a snapshot metric. Ordinary snapshots accept 30d as their trailing activity window. Cohorted dispute metrics accept 7d or 28d as the sales-transaction pool; their attribution window is fixed in the metric name. Card network program metrics accept 7d, 14d, 28d, or 56d. Each metric lists its accepted values in the catalog.
    
</dd>
</dl>

<dl>
<dd>

**event:** `String?` — Filter the events metric to one or more full event names, for example payment.completed or pixel.lead. Comma-separated names match any listed event. Use group_by=event for separate groups. Available on metrics that list event.
    
</dd>
</dl>

<dl>
<dd>

**businessType:** `String?` — Filter to one business type, for example `education`. Pair with `breakdown_by=business_type` to split by business type. Available on metrics that list `business_type`.
    
</dd>
</dl>

<dl>
<dd>

**industryType:** `String?` — Filter to one industry type, for example `options_trading`. Pair with `breakdown_by=industry_type` to split by industry type. Available on metrics that list `industry_type`.
    
</dd>
</dl>

<dl>
<dd>

**productCategory:** `String?` — Filter to one product category, for example `algo_trading_course`. Pair with `breakdown_by=product_category` to split by product category. Available on metrics that list `product_category`.
    
</dd>
</dl>

<dl>
<dd>

**accountCountry:** `String?` — Filter to accounts located in one country, as an ISO 3166-1 alpha-2 code such as `US`. Pair with `breakdown_by=account_country` to split by account country. Available on metrics that list `account_country`.
    
</dd>
</dl>

<dl>
<dd>

**issuer:** `String?` — Filter to one card-issuing bank, named as the processor reports it, for example JPMORGAN CHASE BANK N A, or unknown for payments with no reported bank. Available on metrics that list issuer.
    
</dd>
</dl>

<dl>
<dd>

**webhookId:** `String?` — The webhook to count deliveries for, for example hook_AbC123. Required by webhook_deliveries, and must belong to account_id or one of its apps.
    
</dd>
</dl>

<dl>
<dd>

**conversionWindow:** `String?` — Funnel only. Time allowed from the first event to the final event: integer minutes, hours, or days, up to 30d.
    
</dd>
</dl>

<dl>
<dd>

**matureOnly:** `Bool?` — Funnel only. Include only entrants whose full conversion window has elapsed. Required for confidence intervals and comparisons.
    
</dd>
</dl>

<dl>
<dd>

**steps:** `RetrieveStatsRequestSteps?` — Funnel only. Required when metric=funnel. 2 to 10 ordered events per person, as consecutive one-based bracket parameters such as `steps[1][event]=pixel.page&steps[1][page]=/pricing*&steps[2][event]=payment.completed`. Values are scalar strings, never JSON. A person's first step 1 match inside `from`/`to` anchors their cohort, breakdown, and conversion window; later matches do not restart it. Other events may occur between steps, and conversions may land after `to`. For an experiment funnel, make `experiment.exposure` step 1 and pass `breakdown_by=variant`.
    
</dd>
</dl>

<dl>
<dd>

**compareTo:** `String?` — Funnel only. The breakdown value to use as baseline for whole-window final conversion. Requires breakdown_by and mature_only=true; defaults confidence_level to 0.95.
    
</dd>
</dl>

<dl>
<dd>

**confidenceLevel:** `Double?` — Funnel only. Confidence level for whole-window final conversion intervals, for example 0.95. Requires mature_only=true. Exposure steps must each filter one user- or visitor-randomized experiment.
    
</dd>
</dl>

<dl>
<dd>

**contactable:** `Bool?` — People metric only: contactable equals this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**hasPurchased:** `Bool?` — People metric only: has_purchased equals this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**firstSeenAfter:** `Date?` — People metric only: first_seen_at greater than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**firstSeenBefore:** `Date?` — People metric only: first_seen_at less than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**lastSeenAfter:** `Date?` — People metric only: last_seen_at greater than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**lastSeenBefore:** `Date?` — People metric only: last_seen_at less than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**firstSeenWithinDays:** `Int?` — People metric only: first_seen_at within this many days of now. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**lastSeenWithinDays:** `Int?` — People metric only: last_seen_at within this many days of now. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**known:** `Bool?` — People metric only: known equals this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**hasEmail:** `Bool?` — People metric only: has_email equals this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**hasPhone:** `Bool?` — People metric only: has_phone equals this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**ltvGt:** `Double?` — People metric only: ltv greater than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**ltvGte:** `Double?` — People metric only: ltv greater than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**ltvLt:** `Double?` — People metric only: ltv less than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**ltvLte:** `Double?` — People metric only: ltv less than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**aovGt:** `Double?` — People metric only: aov greater than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**aovGte:** `Double?` — People metric only: aov greater than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**aovLt:** `Double?` — People metric only: aov less than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**aovLte:** `Double?` — People metric only: aov less than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**purchaseCountGt:** `Double?` — People metric only: purchase_count greater than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**purchaseCountGte:** `Double?` — People metric only: purchase_count greater than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**purchaseCountLt:** `Double?` — People metric only: purchase_count less than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**purchaseCountLte:** `Double?` — People metric only: purchase_count less than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**eventCountGt:** `Double?` — People metric only: event_count greater than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**eventCountGte:** `Double?` — People metric only: event_count greater than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**eventCountLt:** `Double?` — People metric only: event_count less than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**eventCountLte:** `Double?` — People metric only: event_count less than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**referringAccountId:** `String?` — Read a referral metric for a business instead of the caller: the referrals its team members made, past members included, for example biz_AbC123. Requires company:basic:read on that business and cannot be combined with user_id. Available on metrics that list referring_account_id.
    
</dd>
</dl>

<dl>
<dd>

**teamLeadId:** `String?` — Read a partner metric for one team lead and everyone under them in today's org chart, for example user_AbC123. Needs referring_account_id or a global query. As breakdown_by=team_lead_id, figures sit under the highest lead above the partner who earned them, so each group matches that lead's team_lead_id filter and the groups add up to the total. With team_lead_id set, or for a caller who reads only their own team, the groups are the leads under that person, who keeps the rest. Anyone with no lead is in a null group. Available on metrics that list team_lead_id.
    
</dd>
</dl>

<dl>
<dd>

**activity:** `RetrieveStatsRequestActivity?` — On partner_reps, all counts the period's roster, earning counts those who earned in the period, and not_earning counts the roster minus them. On the other partner metrics, earning keeps the figures of the people partner_reps counts as earning over the whole range and not_earning keeps the figures of everyone else; those need referring_account_id or a global query. Defaults to all. Available on metrics that list activity.
    
</dd>
</dl>

<dl>
<dd>

**breakdownLimit:** `Int?` — With a single breakdown_by, keep the groups with the highest whole-range values, up to this many, and fold every other group into one entry named other. A rate or an average ranks its groups by the deals it divides by. The other entry is measured from the underlying rows, so a distinct count or a rate stays exact rather than being added up from groups. Available on partner metrics only.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## SupportChannels
<details><summary><code>client.supportChannels.<a href="/Sources/Resources/SupportChannels/SupportChannelsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, view: SupportChannelView?, open: Bool?, customerUserId: String?, customerUserIds: [String]?, participated: Bool?, includeLastMessage: Bool?, includeParticipated: Bool?, direction: Direction?, order: MessageChannelOrder?, accountId: String?, requestOptions: RequestOptions?) -> ListSupportChannelsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists support channels between an account's team and its customers, most recently active first by default. Pass `open=true` to find channels awaiting a support response.

Required permissions:
 - `support_chat:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.supportChannels.list(
        first: 42,
        last: 42,
        accountId: "biz_xxxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**view:** `SupportChannelView?` 
    
</dd>
</dl>

<dl>
<dd>

**open:** `Bool?` — Whether to filter by open or resolved support channels. Set to true to only return channels awaiting a response, or false for resolved channels.
    
</dd>
</dl>

<dl>
<dd>

**customerUserId:** `String?` — Only return support channels opened by this customer.
    
</dd>
</dl>

<dl>
<dd>

**customerUserIds:** `[String]?` — Only return support channels opened by any of these customers. Maximum 100 IDs per request.
    
</dd>
</dl>

<dl>
<dd>

**participated:** `Bool?` — Set to true to only return channels the authenticated user has joined as a participant. Requires a user.
    
</dd>
</dl>

<dl>
<dd>

**includeLastMessage:** `Bool?` — Set to true to return `last_message` and `unread` on each channel. Both are `null` otherwise, which keeps large lists fast.
    
</dd>
</dl>

<dl>
<dd>

**includeParticipated:** `Bool?` — Set to true to return `participated` on each channel. It is `null` otherwise, which keeps large lists fast.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `Direction?` 
    
</dd>
</dl>

<dl>
<dd>

**order:** `MessageChannelOrder?` 
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — The unique identifier of the company to list support channels for. Includes channels of child companies. When omitted, returns support channels across all companies the user has access to.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.supportChannels.<a href="/Sources/Resources/SupportChannels/SupportChannelsClient.swift">create</a>(request: Requests.CreateSupportChannelsRequest, requestOptions: RequestOptions?) -> SupportChannel</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Opens a support channel between an account's team and a customer. Returns the existing channel if that customer already has one.

Required permissions:
 - `support_chat:create`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.supportChannels.create(request: .init(
        accountId: "biz_xxxxxxxxxxxxxx",
        userId: "user_xxxxxxxxxxxxx"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateSupportChannelsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.supportChannels.<a href="/Sources/Resources/SupportChannels/SupportChannelsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> SupportChannel</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing support channel.

Required permissions:
 - `support_chat:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.supportChannels.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the support channel to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Swaps
<details><summary><code>client.swaps.<a href="/Sources/Resources/Swaps/SwapsClient.swift">list</a>(accountId: String?, userId: String?, requestOptions: RequestOptions?) -> ListSwapsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the completed or pending swaps for an account or user — currently only the most recent one.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.swaps.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Business account whose swaps to list, prefixed `biz_`. Provide this or `user_id`.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — The caller's own user ID, prefixed `user_`, to list swaps in their personal account. Provide this or `account_id`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.swaps.<a href="/Sources/Resources/Swaps/SwapsClient.swift">create</a>(request: Requests.CreateSwapsRequest, requestOptions: RequestOptions?) -> CreateSwapsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Swaps one token for another in an account or user's wallet, or converts between their fiat balances. Crypto swaps finish in the background — retrieve the swap to follow its status.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.swaps.create(request: .init(
        fromToken: "usd",
        toToken: "cad"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateSwapsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.swaps.<a href="/Sources/Resources/Swaps/SwapsClient.swift">createQuote</a>(request: Requests.CreateQuoteSwapsRequest, requestOptions: RequestOptions?) -> CreateQuoteSwapsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Previews the price of a swap before you create it. A fiat pair quotes the same rate creating the swap fills at; name the account with `account_id` or `user_id` to quote the rate for that account. No funds move, nothing is saved, and no authentication is required unless you name an account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.swaps.createQuote(request: .init(
        amount: "100",
        fromToken: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        toToken: "0x1b64b9025eebb9a6239575df9ea4b9ac46d4d193"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateQuoteSwapsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.swaps.<a href="/Sources/Resources/Swaps/SwapsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> RetrieveSwapsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a swap and its status. Poll it after creating a crypto swap, which finishes in the background.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.swaps.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Swap ID returned from POST /swaps.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Team Members
<details><summary><code>client.teamMembers.<a href="/Sources/Resources/TeamMembers/TeamMembersClient.swift">list</a>(accountId: String?, status: ListTeamMembersRequestStatus?, userId: String?, userIds: [String]?, role: ListTeamMembersRequestRole?, query: String?, reportsToId: String?, directReportsMin: Int?, directReportsMax: Int?, teamLeadId: String?, hasReferredBusinesses: Bool?, isPartner: Bool?, createdBefore: String?, createdAfter: String?, order: ListTeamMembersRequestOrder?, direction: ListTeamMembersRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListTeamMembersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists team members, including pending invites. Pass `account_id` to list one account's team. Without it, a signed-in user can pass `user_id=me` to list their own joined memberships across accounts. The list has one for each account they can read. An API key without `account_id` lists the team of its own account. With `company:basic:read`, a user can list their own joined membership on one account. To do this, pass `status=joined` and their own `user_id` with the account ID. The `bounty:create` scope also allows listing `role=workforce` members. A signed-in Partner without `company:authorized_user:read` lists only their own joined membership and the members who report up to them. A member others report to gets the same list. Neither of them sees pending invites. Members with the view-only Partner role are listed after all other members.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.teamMembers.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Only return the team of this account, prefixed `biz_`. A signed-in user can omit it only with `user_id=me` or their own user ID. An API key that omits it gets its own account. `reports_to_id`, `direct_reports_min` and `direct_reports_max` need it.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListTeamMembersRequestStatus?` — Only return members with this status: `joined` (accepted members) or `pending` (pending invites). Both are returned by default.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — Only return the memberships of this user ID, prefixed `user_`. Pass `me` for the signed-in user.
    
</dd>
</dl>

<dl>
<dd>

**userIds:** `[String]?` — Only return the memberships of these users, prefixed `user_`, at most 100. IDs that match no user are ignored. With `account_id=global`, a user can have one in each partner account. Can't be combined with `user_id`.
    
</dd>
</dl>

<dl>
<dd>

**role:** `ListTeamMembersRequestRole?` — Only return members with this role. `custom` matches members on a dashboard-managed custom role.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Only return members whose name or username contains this text, and invites whose email contains it.
    
</dd>
</dl>

<dl>
<dd>

**reportsToId:** `String?` — Only return the direct reports of this team member, whose ID may start with `ausr_` or `mber_`. Pass the account ID, prefixed `biz_`, for the members who report to the business directly. Pending invites are excluded, and the list pages in `created_at` order without moving Partner-role members last.
    
</dd>
</dl>

<dl>
<dd>

**directReportsMin:** `Int?` — Only return members with at least this many direct reports. Pending invites are excluded, and the list pages in `created_at` order without moving Partner-role members last.
    
</dd>
</dl>

<dl>
<dd>

**directReportsMax:** `Int?` — Only return members with at most this many direct reports; `0` returns the people who manage no one. Pending invites are excluded, and the list pages in `created_at` order without moving Partner-role members last.
    
</dd>
</dl>

<dl>
<dd>

**teamLeadId:** `String?` — Only return this user, prefixed `user_`, and everyone under them in today's org chart: the same team the stats API's `team_lead_id` reads. With `account_id=global`, their line in every partner account where they hold a role. Pending invites are excluded, and the list pages in `created_at` order without moving Partner-role members last.
    
</dd>
</dl>

<dl>
<dd>

**hasReferredBusinesses:** `Bool?` — When true, only members who referred at least one business for their account; when false, only members who referred none. Pending invites are excluded, and the list pages in `created_at` order without moving Partner-role members last.
    
</dd>
</dl>

<dl>
<dd>

**isPartner:** `Bool?` — When true, only members and invites with the view-only Partner role. When false, only the ones without it.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only return members added before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only return members added after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListTeamMembersRequestOrder?` — Field used to sort members. Members with the view-only Partner role are listed after all other members whichever way the list is sorted.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListTeamMembersRequestDirection?` — Sort direction. Defaults to `desc`.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.teamMembers.<a href="/Sources/Resources/TeamMembers/TeamMembersClient.swift">create</a>(request: Requests.CreateTeamMembersRequest, requestOptions: RequestOptions?) -> TeamMember</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds a member to an account's team with a system role. Identify them by exactly one of `user_id` or `email`. If the person has not yet accepted, or the email does not belong to a Whop account yet, an invitation is sent instead and the response is `202` with the pending team member, whose `status` is `pending` and whose id is prefixed `ausri_`. If they already have a pending invite, the request fails with a `400`. Granting the `workforce` role is also allowed with the `bounty:create` scope.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.teamMembers.create(request: .init(
        accountId: "biz_xxxxxxxxxxxxxx",
        role: .salesManager,
        userId: "user_xxxxxxxxxxxxxx"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateTeamMembersRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.teamMembers.<a href="/Sources/Resources/TeamMembers/TeamMembersClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> TeamMember</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a team member or pending invite by ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.teamMembers.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Team member ID. Accepted members have an ID starting with `ausr_` or `mber_`, and pending invites one starting with `ausri_`. Treat it as opaque.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.teamMembers.<a href="/Sources/Resources/TeamMembers/TeamMembersClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> DeleteTeamMembersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Removes a team member from the account, or revokes a pending invite when given an `ausri_` ID. A user session may delete its own membership to leave the team without the delete scope. Removing a member on the `workforce` role is also allowed with the `bounty:create` scope. The account owner cannot be removed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.teamMembers.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Team member ID. Accepted members have an ID starting with `ausr_` or `mber_`, and pending invites one starting with `ausri_`. Treat it as opaque.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.teamMembers.<a href="/Sources/Resources/TeamMembers/TeamMembersClient.swift">update</a>(id: String, request: Requests.UpdateTeamMembersRequest, requestOptions: RequestOptions?) -> TeamMember</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Changes a team member's system role. Requires a user session — account API keys cannot change member roles. The account owner's role cannot be changed, and you cannot change your own role.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.teamMembers.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Team member ID. Accepted members have an ID starting with `ausr_` or `mber_`, and pending invites one starting with `ausri_`. Treat it as opaque.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateTeamMembersRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Trades
<details><summary><code>client.trades.<a href="/Sources/Resources/Trades/TradesClient.swift">list</a>(accountId: String?, status: ListTradesRequestStatus?, type: ListTradesRequestType?, order: ListTradesRequestOrder?, direction: ListTradesRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListTradesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists trades you can access, newest first. User credentials see their own trades and those of accounts they belong to, including subaccounts; account credentials see their account and its subaccounts.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.trades.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Only return trades for this account or user, prefixed `biz_` or `user_`.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListTradesRequestStatus?` — Only return trades with this status.
    
</dd>
</dl>

<dl>
<dd>

**type:** `ListTradesRequestType?` — Only return trades of this type.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListTradesRequestOrder?` — Field to sort by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListTradesRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.trades.<a href="/Sources/Resources/Trades/TradesClient.swift">create</a>(request: Requests.CreateTradesRequest, requestOptions: RequestOptions?) -> Trade</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Places an order, closes a perpetual position, or deposits to or withdraws from the trading balance, from the Whop-managed wallet of an account or user. Answers `201` with the trade in `pending`; it runs in the background, so read it with `GET /trades/:id` until its `status` is `completed`, `failed` or `in_review`. Trades run alongside each other, except a second order on one market at a different leverage, which answers `409`. A retry with the same `Idempotency-Key` returns the same trade.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.trades.create(request: .init(
        accountId: "biz_xxxxxxxxxxxxxx",
        type: .close
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateTradesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.trades.<a href="/Sources/Resources/Trades/TradesClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Trade</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a trade. Read it until its `status` is `completed`, `failed` or `in_review`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.trades.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Trade ID, prefixed `tint_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.trades.<a href="/Sources/Resources/Trades/TradesClient.swift">cancel</a>(id: String, requestOptions: RequestOptions?) -> Trade</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cancels the order of a trade while it rests on the book, such as a `good_til_canceled` limit order. Answers with the trade still `processing`; read it with `GET /trades/:id` until its `status` is `completed` or `failed`. A part that filled before the cancel landed stays filled, and money bridged in for an order that did not fill goes back to the wallet. Calling it again sends no second cancel. Answers `409` when the trade has no order on the book.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.trades.cancel(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Trade ID, prefixed `tint_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Transfers
<details><summary><code>client.transfers.<a href="/Sources/Resources/Transfers/TransfersClient.swift">list</a>(originId: String?, destinationId: String?, order: ListTransfersRequestOrder?, direction: ListTransfersRequestDirection?, createdBefore: String?, createdAfter: String?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListTransfersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the transfers you can see, sent or received, newest first by default. Optional account filters narrow the results.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.transfers.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**originId:** `String?` — Filter to transfers sent from this account.
    
</dd>
</dl>

<dl>
<dd>

**destinationId:** `String?` — Filter to transfers received by this account.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListTransfersRequestOrder?` — Sort column. Defaults to created_at.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListTransfersRequestDirection?` — Sort direction. Defaults to desc.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only transfers created strictly before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only transfers created strictly after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfers.<a href="/Sources/Resources/Transfers/TransfersClient.swift">create</a>(request: CreateTransfersRequestBody, requestOptions: RequestOptions?) -> CreateTransfersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Moves money between Whop balances or funds a claim link anyone with the URL can redeem. The `type` you send decides which object comes back.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.transfers.create(request: CreateTransfersRequestBody.balance(
        CreateTransfersRequestBodyBalance(
            amount: 25,
            currency: "usd",
            destinationId: "user_xxxxxxxxxxxxxx",
            originId: "biz_xxxxxxxxxxxxxx"
        )
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `CreateTransfersRequestBody` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfers.<a href="/Sources/Resources/Transfers/TransfersClient.swift">listRecipients</a>(originId: String, query: String?, first: Int?, after: String?, requestOptions: RequestOptions?) -> ListRecipientsTransfersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the people and accounts you can send money to from a balance. Pass a result's ID as `destination_id` when creating a transfer.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.transfers.listRecipients(originId: "origin_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**originId:** `String` — The account sending the money: a company account ID (`biz_`), or a user ID (`user_`) for that user's own personal balance.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Search anyone on Whop by name or username, plus your own accounts by name or ID. An exact business ID (`biz_`), user ID (`user_`), or username returns that recipient first; an ID or an `@username` returns only that recipient. Omit it to get the team around the balance, the people you follow, and your own accounts. The list is the same whether the balance belongs to a company or to you. Searching from a `biz_` origin additionally requires the member:basic:read scope. A credential scoped to a single company is the exception to the search itself: it only ever sees that company's own people. Complete email addresses return no matches. Search results are limited to 20 recipients.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfers.<a href="/Sources/Resources/Transfers/TransfersClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> RetrieveTransfersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a single transfer.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.transfers.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The transfer ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users
<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">list</a>(contextChannelId: String?, query: String?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListUsersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Searches for users by name or username, ranked by social proximity to the authenticated user. Without a `query`, returns the user's most recently followed users.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.users.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**contextChannelId:** `String?` — Prioritize people relevant to this channel for mentions. Results remain global; channel access is required.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — A search term to filter users by name or username.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">me</a>(includeTrading: Bool?, accountId: String?, includeBalance: Bool?, includeBalanceHistory: Bool?, from: String?, to: String?, interval: MeUsersRequestInterval?, timeZone: String?, requestOptions: RequestOptions?) -> User</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the authenticated user. Same as `GET /users/:id` with the reserved id `me`: the self view, where self-only fields such as `email`, `balance`, and `cards` can be populated.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.users.me()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**includeTrading:** `Bool?` — Also return the trading account under `trading`: its address, a snapshot of its margin and open positions, and its Hyperliquid WebSocket subscriptions. Only honored on the self view (me) with crypto_wallet:trade:read, crypto_wallet:trade, or crypto_wallet:manage permission and an Ethereum wallet.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — When set, returns your account-specific profile overrides for this account.
    
</dd>
</dl>

<dl>
<dd>

**includeBalance:** `Bool?` — Compute live wallet and owned-account balances (default true). Set false for identity-only reads. Ignored for callers without balance-read scope.
    
</dd>
</dl>

<dl>
<dd>

**includeBalanceHistory:** `Bool?` — Also compute your balance history (opt-in; runs a heavier query). Ignored for callers without balance-read scope.
    
</dd>
</dl>

<dl>
<dd>

**from:** `String?` — Balance-history window start, ISO 8601 date or datetime. Defaults to 30 days ago. Only used with `include_balance_history`.
    
</dd>
</dl>

<dl>
<dd>

**to:** `String?` — Balance-history window end, ISO 8601 date or datetime. Defaults to now. Only used with `include_balance_history`.
    
</dd>
</dl>

<dl>
<dd>

**interval:** `MeUsersRequestInterval?` — Balance-history point granularity. Defaults to `day`. Only used with `include_balance_history`.
    
</dd>
</dl>

<dl>
<dd>

**timeZone:** `String?` — IANA time zone the balance-history points are bucketed in. Defaults to `UTC`. Only used with `include_balance_history`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">updateMe</a>(accountId: String?, request: Requests.UpdateMeUsersRequest, requestOptions: RequestOptions?) -> User</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the authenticated user's global profile, or their profile override for an account when `account_id` is given. Not available to API keys.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.users.updateMe(request: .init())
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — When set, updates the authenticated user's profile override for this account instead of their global profile.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateMeUsersRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">retrieve</a>(id: String, includeTrading: Bool?, accountId: String?, includeBalance: Bool?, includeBalanceHistory: Bool?, from: String?, to: String?, interval: RetrieveUsersRequestInterval?, timeZone: String?, requestOptions: RequestOptions?) -> User</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a user by `user_` tag or username, or the authenticated user with the reserved id `me`. Self-only fields such as `email`, `balance`, and `earnings_usd` are populated only when the id is `me`, and are always `null` when addressing a user by tag or username.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.users.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — User ID (prefixed `user_`), username, or `me` for the authenticated user.
    
</dd>
</dl>

<dl>
<dd>

**includeTrading:** `Bool?` — Also return the trading account under `trading`: its address, a snapshot of its margin and open positions, and its Hyperliquid WebSocket subscriptions. Only honored on the self view (me) with crypto_wallet:trade:read, crypto_wallet:trade, or crypto_wallet:manage permission and an Ethereum wallet.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — When set, returns the user's account-specific profile overrides for this account.
    
</dd>
</dl>

<dl>
<dd>

**includeBalance:** `Bool?` — Compute live wallet and owned-account balances on the self view (default true). Set false for identity-only reads. Ignored when the id is not `me` or the caller lacks balance-read scope.
    
</dd>
</dl>

<dl>
<dd>

**includeBalanceHistory:** `Bool?` — Also compute your balance history (opt-in; runs a heavier query). Only applies when the id is `me`; ignored for callers without balance-read scope.
    
</dd>
</dl>

<dl>
<dd>

**from:** `String?` — Balance-history window start, ISO 8601 date or datetime. Defaults to 30 days ago. Only used with `include_balance_history`.
    
</dd>
</dl>

<dl>
<dd>

**to:** `String?` — Balance-history window end, ISO 8601 date or datetime. Defaults to now. Only used with `include_balance_history`.
    
</dd>
</dl>

<dl>
<dd>

**interval:** `RetrieveUsersRequestInterval?` — Balance-history point granularity. Defaults to `day`. Only used with `include_balance_history`.
    
</dd>
</dl>

<dl>
<dd>

**timeZone:** `String?` — IANA time zone the balance-history points are bucketed in. Defaults to `UTC`. Only used with `include_balance_history`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">update</a>(id: String, accountId: String?, request: Requests.UpdateUsersRequest, requestOptions: RequestOptions?) -> User</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a user, addressed by `user_` tag, username, or the reserved id `me` for the authenticated user. A user token updates their own global profile; an API key updates the user's profile override for the account in `account_id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.users.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — User ID (prefixed `user_`), username, or `me` for the authenticated user.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — The account whose profile override to update. Required for API key callers.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateUsersRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">checkAccess</a>(id: String, resourceId: String, requestOptions: RequestOptions?) -> CheckAccessUsersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Checks whether a user has access to an account, product, or experience the caller can reach.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.users.checkAccess(
        id: "id",
        resourceId: "resource_id"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The user_ tag or username to check access for.
    
</dd>
</dl>

<dl>
<dd>

**resourceId:** `String` — An account (biz_), product (prod_), or experience (exp_) ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">recommendActions</a>(id: String, requestOptions: RequestOptions?) -> RecommendActionsUsersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the recommended actions computed for the authenticated user, such as starting a business. You can only list your own recommended actions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.users.recommendActions(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — `me`, or the authenticated user's own `user_` tag or username.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Variants
<details><summary><code>client.variants.<a href="/Sources/Resources/Variants/VariantsClient.swift">list</a>(accountId: String?, direction: ListVariantsRequestDirection?, order: ListVariantsRequestOrder?, releaseMethods: [String]?, visibilities: [String]?, billingTypes: [String]?, productIds: [String]?, createdBefore: String?, createdAfter: String?, presentmentCurrency: Nullable&lt;String&gt;?, ipAddress: Nullable&lt;String&gt;?, presentmentCountry: Nullable&lt;String&gt;?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListVariantsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists an account's variants, leaving out variants generated for a legacy invoice; retrieve one of those by ID. To list a product's public, buyable variants without authentication, omit `account_id` and pass `product_ids`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.variants.list(
        releaseMethods: [
            "buy_now"
        ],
        visibilities: [
            "visible"
        ],
        billingTypes: [
            "renewal"
        ],
        productIds: [
            "prod_xxxxxxxxxxxxxx"
        ],
        presentmentCurrency: .value("auto"),
        ipAddress: .value("203.0.113.7"),
        presentmentCountry: .value("JP")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — The unique identifier of the account to list variants for. Required unless `product_ids` is provided for a public product-variant read.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListVariantsRequestDirection?` — The sort direction for results. Defaults to descending.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListVariantsRequestOrder?` — The field to sort results by. Defaults to created_at.
    
</dd>
</dl>

<dl>
<dd>

**releaseMethods:** `[String]?` — Filter to only variants matching these release methods.
    
</dd>
</dl>

<dl>
<dd>

**visibilities:** `[String]?` — Filter to only variants matching these visibility states.
    
</dd>
</dl>

<dl>
<dd>

**billingTypes:** `[String]?` — Filter to only variants matching these billing types.
    
</dd>
</dl>

<dl>
<dd>

**productIds:** `[String]?` — Filter to only variants belonging to these product identifiers. When `account_id` is omitted, this is required and the response is publicly readable: only visible, non-invoice variants are returned.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only return variants created before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only return variants created after this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**presentmentCurrency:** `Nullable<String>?` — The currency to state each variant's prices in. Omit it, or send null, for each variant's own currency. `auto` states them in the currency of the country Whop places the buyer in: by `ip_address` when your server sends one, and by the request's own IP address otherwise. To choose that country instead, send `presentment_country` in place of this. A three-letter ISO 4217 code, such as `eur`, states them in that currency. A variant converts only where a payment quote for it would be priced in that currency, and stays in its own currency otherwise: a renewing variant, one with adaptive pricing off, a currency no payment method can collect, or `auto` for a buyer Whop cannot place in a country. Converted prices are an estimate at the current exchange rate. Nothing is held: the payment quote the buyer pays from fixes the rate.
    
</dd>
</dl>

<dl>
<dd>

**ipAddress:** `Nullable<String>?` — The buyer's IP address, when your server reads on their behalf. Needs an API key; any other caller is placed by its own request. Where `presentment_currency` `auto` finds the buyer's local currency, and where a payment method must be able to collect it.
    
</dd>
</dl>

<dl>
<dd>

**presentmentCountry:** `Nullable<String>?` — The country to state each variant's prices for, as an ISO 3166-1 alpha-2 code such as `JP`, when the buyer chose one: a store's country picker. States them in the currency `auto` would for a buyer in that country, so send it instead of `presentment_currency`, never with it. Whether a payment method can collect that currency is still judged where the buyer is: by `ip_address`, else by the request's own IP address. A country Whop has no currency for is ignored, and the prices are stated as `auto` would state them.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.variants.<a href="/Sources/Resources/Variants/VariantsClient.swift">create</a>(request: Requests.CreateVariantsRequest, requestOptions: RequestOptions?) -> Variant</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a pricing variant for a product, defining the billing interval, price, and availability customers buy it with.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.variants.create(request: .init())
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateVariantsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.variants.<a href="/Sources/Resources/Variants/VariantsClient.swift">retrieve</a>(id: String, presentmentCurrency: Nullable&lt;String&gt;?, ipAddress: Nullable&lt;String&gt;?, presentmentCountry: Nullable&lt;String&gt;?, requestOptions: RequestOptions?) -> Variant</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a variant. Requires no authentication; fields that need a permission are `null` for callers without it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.variants.retrieve(
        id: "id",
        presentmentCurrency: .value("auto"),
        ipAddress: .value("203.0.113.7"),
        presentmentCountry: .value("JP")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Variant ID, prefixed `plan_`.
    
</dd>
</dl>

<dl>
<dd>

**presentmentCurrency:** `Nullable<String>?` — The currency to state each variant's prices in. Omit it, or send null, for each variant's own currency. `auto` states them in the currency of the country Whop places the buyer in: by `ip_address` when your server sends one, and by the request's own IP address otherwise. To choose that country instead, send `presentment_country` in place of this. A three-letter ISO 4217 code, such as `eur`, states them in that currency. A variant converts only where a payment quote for it would be priced in that currency, and stays in its own currency otherwise: a renewing variant, one with adaptive pricing off, a currency no payment method can collect, or `auto` for a buyer Whop cannot place in a country. Converted prices are an estimate at the current exchange rate. Nothing is held: the payment quote the buyer pays from fixes the rate.
    
</dd>
</dl>

<dl>
<dd>

**ipAddress:** `Nullable<String>?` — The buyer's IP address, when your server reads on their behalf. Needs an API key; any other caller is placed by its own request. Where `presentment_currency` `auto` finds the buyer's local currency, and where a payment method must be able to collect it.
    
</dd>
</dl>

<dl>
<dd>

**presentmentCountry:** `Nullable<String>?` — The country to state each variant's prices for, as an ISO 3166-1 alpha-2 code such as `JP`, when the buyer chose one: a store's country picker. States them in the currency `auto` would for a buyer in that country, so send it instead of `presentment_currency`, never with it. Whether a payment method can collect that currency is still judged where the buyer is: by `ip_address`, else by the request's own IP address. A country Whop has no currency for is ignored, and the prices are stated as `auto` would state them.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.variants.<a href="/Sources/Resources/Variants/VariantsClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> DeleteVariantsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a variant from a product. It stops selling immediately; existing memberships on it are unaffected.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.variants.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Variant ID, prefixed `plan_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.variants.<a href="/Sources/Resources/Variants/VariantsClient.swift">update</a>(id: String, request: Requests.UpdateVariantsRequest, requestOptions: RequestOptions?) -> Variant</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a variant's pricing, billing interval, visibility, stock, and other settings.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.variants.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Variant ID, prefixed `plan_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateVariantsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.variants.<a href="/Sources/Resources/Variants/VariantsClient.swift">calculateTax</a>(id: String, request: Requests.CalculateTaxVariantsRequest, requestOptions: RequestOptions?) -> CalculateTaxVariantsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deprecated. Quote tax with `POST /payment_quotes` instead. Previews tax for a variant before checkout, based on the buyer's location.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.variants.calculateTax(
        id: "id",
        request: .init(address: .value(CalculateTaxVariantsRequestAddress(
            country: "DE",
            postalCode: .value("10115")
        )))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Variant ID, prefixed `plan_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.CalculateTaxVariantsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Verifications
<details><summary><code>client.verifications.<a href="/Sources/Resources/Verifications/VerificationsClient.swift">list</a>(accountId: String?, userId: String?, includeSubaccounts: Bool?, first: Int?, after: String?, last: Int?, before: String?, order: ListVerificationsRequestOrder?, direction: ListVerificationsRequestDirection?, requestOptions: RequestOptions?) -> ListVerificationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the verifications for an account or user, including their status and any required actions. Platforms list their own and every subaccount's verifications at once with `include_subaccounts`; each one's `account_ids` names its account, and a verification shared by several accounts appears once for each.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.verifications.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Business account whose verifications you want to list, prefixed `biz_`. Provide this or `user_id`.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — The caller's own user ID, prefixed `user_`, to list personal verifications. Provide this or `account_id`.
    
</dd>
</dl>

<dl>
<dd>

**includeSubaccounts:** `Bool?` — Also cover the account's subaccounts. Requires `account_id`, and is a 400 without it. Lists the verifications of the account and every subaccount in account order, oldest account first, paging forward; `status`, `order`, `direction`, `last` and `before` are a 400. Leaves out removed subaccounts and ones you can't read verifications on. A page can hold fewer than `first` verifications while `has_next_page` is `true`; keep following `end_cursor`. On a subaccount, lists only that account's verifications.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListVerificationsRequestOrder?` — Field used to sort returned verifications.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListVerificationsRequestDirection?` — Sort direction for returned verifications.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.verifications.<a href="/Sources/Resources/Verifications/VerificationsClient.swift">create</a>(accountId: String?, userId: String?, request: CreateVerificationsRequestBody, requestOptions: RequestOptions?) -> CreateVerificationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Starts a hosted verification session for an account or user, or returns the active session when one already exists; any fields you send prefill it. To skip the hosted session, send `documents` to verify the person from files in this request, `share_token` to reuse a verification another Sumsub account completed, or `verification_id` to reuse one the signed-in user completed on Whop. For a business, `documents` and `owners` add company formation documents and owners to the verification, and once everything is in this call sends the business for review — call it again after Update Verification to send it. Until then it stays `pending` and the hosted session collects anything left out. Once the account has an `approved` verification, every mode except `verification_id` is rejected — unlink it first to start a new one.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.verifications.create(request: CreateVerificationsRequestBody.individual(
        CreateVerificationsRequestBodyIndividual(

        )
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Business account whose identity you want to verify, prefixed `biz_`. Provide this or `user_id`.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — The caller's own user ID, prefixed `user_`, for a personal verification. Provide this or `account_id`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `CreateVerificationsRequestBody` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.verifications.<a href="/Sources/Resources/Verifications/VerificationsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> RetrieveVerificationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a verification by ID, including its status and any information or documents still required.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.verifications.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Verification profile ID, prefixed `idpf_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.verifications.<a href="/Sources/Resources/Verifications/VerificationsClient.swift">update</a>(id: String, request: UpdateVerificationsRequestBody, requestOptions: RequestOptions?) -> UpdateVerificationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates editable profile details or submits answers for items returned in `requested_information`. On a business verification still collecting details, company details, `documents`, and `owners` also go to the verification provider; call Create Verification again to send the business for review once everything is in. Under review, `registration_number`, `incorporation_date`, `place_of_incorporation`, and `documents` are refused. While the review waits on owners, owners can still be added, changed, or removed with `remove`; otherwise only an owner's missing documents can still be sent. Once a verification is `approved` its profile details are locked and can no longer be edited.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.verifications.update(
        id: "id",
        request: UpdateVerificationsRequestBody.updateVerificationsRequestBodyPersonalAddress(
            UpdateVerificationsRequestBodyPersonalAddress(

            )
        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Verification profile ID, prefixed `idpf_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `UpdateVerificationsRequestBody` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Waitlist Entries
<details><summary><code>client.waitlistEntries.<a href="/Sources/Resources/WaitlistEntries/WaitlistEntriesClient.swift">list</a>(first: Int?, after: String?, last: Int?, before: String?, variantId: String?, accountId: String?, productId: String?, buyerAccountId: String?, status: ListWaitlistEntriesRequestStatus?, query: String?, createdBefore: String?, createdAfter: String?, order: ListWaitlistEntriesRequestOrder?, direction: ListWaitlistEntriesRequestDirection?, requestOptions: RequestOptions?) -> ListWaitlistEntriesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the waitlist signups you can see. `waitlist_entry:read` returns your own signups, and `plan:waitlist:read` returns signups to the seller accounts you are authorized on; with both, you get both sets. Signups submitted on behalf of an account are not in this list; pass `buyer_account_id` to list them instead, which needs `waitlist_entry:read` on that account. Account credentials see the signups submitted to their own account, and pass their own account as `buyer_account_id` to see the ones it submitted.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.waitlistEntries.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**variantId:** `String?` — Only return signups for this variant, prefixed `plan_`.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Only return signups submitted to this seller account, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**productId:** `String?` — Only return signups for variants on this product, prefixed `prod_`.
    
</dd>
</dl>

<dl>
<dd>

**buyerAccountId:** `String?` — List the signups submitted on behalf of this account, prefixed `biz_`, instead of your own and seller signups. Requires `waitlist_entry:read` on the account. The other filters still apply.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListWaitlistEntriesRequestStatus?` — Only return signups in this state. Canceled signups are returned only when `status` is `canceled`.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Search signups by the user's name or username, or the name of the account they were submitted on behalf of. An account ID, prefixed `biz_`, matches signups submitted on behalf of that account, and a user ID, prefixed `user_`, or an exact email address matches that user's signups.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only return signups submitted at or before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only return signups submitted at or after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListWaitlistEntriesRequestOrder?` — The field to sort results by. Defaults to `created_at`.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListWaitlistEntriesRequestDirection?` — The sort direction for results. Defaults to descending.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.waitlistEntries.<a href="/Sources/Resources/WaitlistEntries/WaitlistEntriesClient.swift">create</a>(request: Requests.CreateWaitlistEntriesRequest, requestOptions: RequestOptions?) -> WaitlistEntry</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Joins a free waitlist variant as the authenticated user, or on behalf of an account with `buyer_account_id`. Requires `waitlist_entry:create`, on that account when one is given. Joining again returns the existing pending signup, or the approved one while its membership is valid. Paid variants are rejected; joining collects no payment method and grants no membership.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.waitlistEntries.create(request: .init(variantId: "plan_xxxxxxxxxxxxxx"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateWaitlistEntriesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.waitlistEntries.<a href="/Sources/Resources/WaitlistEntries/WaitlistEntriesClient.swift">approveAll</a>(request: Requests.ApproveAllWaitlistEntriesRequest, requestOptions: RequestOptions?) -> ApproveAllWaitlistEntriesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Queues approval of every pending signup for an account, optionally narrowed to a variant. Requires `plan:waitlist:manage`. Paid signups may charge saved payment methods. Approval runs asynchronously: list signups with `status` set to `pending` to follow progress, and retrieve a signup to read its outcome. Signups created after this request are excluded.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.waitlistEntries.approveAll(request: .init(accountId: "biz_xxxxxxxxxxxxxx"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.ApproveAllWaitlistEntriesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.waitlistEntries.<a href="/Sources/Resources/WaitlistEntries/WaitlistEntriesClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> WaitlistEntry</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves your own signup or one submitted on behalf of an account you hold `waitlist_entry:read` on, or one submitted to an account you can read, with `plan:waitlist:read`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.waitlistEntries.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Waitlist signup ID, prefixed `entry_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.waitlistEntries.<a href="/Sources/Resources/WaitlistEntries/WaitlistEntriesClient.swift">approve</a>(id: String, requestOptions: RequestOptions?) -> WaitlistEntry</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Queues approval of a pending signup. Requires `plan:waitlist:manage` on its seller account. Paid signups may charge their saved payment method. Returns the signup's current state; retrieve it to read `status` and `approval_failure_reason` after processing.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.waitlistEntries.approve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Waitlist signup ID, prefixed `entry_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.waitlistEntries.<a href="/Sources/Resources/WaitlistEntries/WaitlistEntriesClient.swift">cancel</a>(id: String, requestOptions: RequestOptions?) -> WaitlistEntry</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Withdraws a pending signup: your own, or one submitted on behalf of an account you hold `waitlist_entry:cancel` on. Requires `waitlist_entry:cancel`, on that account for an account's signup. Does not cancel an approved membership.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.waitlistEntries.cancel(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Waitlist signup ID, prefixed `entry_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.waitlistEntries.<a href="/Sources/Resources/WaitlistEntries/WaitlistEntriesClient.swift">deny</a>(id: String, requestOptions: RequestOptions?) -> WaitlistEntry</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Denies a pending signup. Requires `plan:waitlist:manage` on its seller account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.waitlistEntries.deny(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Waitlist signup ID, prefixed `entry_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Webhooks
<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">list</a>(accountId: String?, appId: String?, includeAppWebhooks: Bool?, hasFailures: Bool?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListWebhooksResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of webhook endpoints configured for an account, ordered by most recently created.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.webhooks.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — The unique identifier of the account to list webhooks for.
    
</dd>
</dl>

<dl>
<dd>

**appId:** `String?` — Only return webhooks attached to this app. Omit to list the account's own webhooks.
    
</dd>
</dl>

<dl>
<dd>

**includeAppWebhooks:** `Bool?` — Also return webhooks attached to the account's apps, not just the account's own. Cannot be combined with `app_id`.
    
</dd>
</dl>

<dl>
<dd>

**hasFailures:** `Bool?` — Only return webhooks whose endpoint is currently failing — every delivery since the current failure streak began has been rejected. Clears as soon as a delivery succeeds.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">create</a>(request: Requests.CreateWebhooksRequest, requestOptions: RequestOptions?) -> Webhook</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a webhook endpoint that receives event notifications via HTTP POST.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.webhooks.create(request: .init(url: "https://example.com/hooks"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateWebhooksRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Webhook</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing webhook.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.webhooks.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Webhook ID, prefixed `hook_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> DeleteWebhooksResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Permanently deletes a webhook endpoint. To stop deliveries without deleting it, set `enabled` to `false` with `PATCH /webhooks/:id`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.webhooks.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Webhook ID, prefixed `hook_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">update</a>(id: String, request: Requests.UpdateWebhooksRequest, requestOptions: RequestOptions?) -> Webhook</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a webhook endpoint's URL, subscribed events, pinned payload version, or enabled state.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.webhooks.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Webhook ID, prefixed `hook_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateWebhooksRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">listDeliveries</a>(id: String, first: Int?, after: String?, sentAfter: Date?, sentBefore: Date?, events: [ListDeliveriesWebhooksRequestEventsItem]?, status: ListDeliveriesWebhooksRequestStatus?, resourceId: String?, requestOptions: RequestOptions?) -> ListDeliveriesWebhooksResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of delivery attempts for a webhook, ordered by most recent first. Includes the request payload, response body, response code, and timing for each attempt. Filtered queries use a bounded read budget, so a page may be partial or empty. Continue with `page_info.end_cursor` while `page_info.has_next_page` is `true`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.webhooks.listDeliveries(
        id: "id",
        resourceId: "pay_xxxxxxxxxxxxx"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Webhook ID, prefixed `hook_`.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**sentAfter:** `Date?` — Only deliveries sent at or after this ISO 8601 timestamp. Deliveries are retained for 30 days.
    
</dd>
</dl>

<dl>
<dd>

**sentBefore:** `Date?` — Only deliveries sent at or before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**events:** `[ListDeliveriesWebhooksRequestEventsItem]?` — Only deliveries of these event types. Repeat the parameter to pass several.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListDeliveriesWebhooksRequestStatus?` — Only deliveries with this outcome: `success` for a 2xx response, `error` otherwise.
    
</dd>
</dl>

<dl>
<dd>

**resourceId:** `String?` — Only deliveries triggered by this resource.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">replayDelivery</a>(id: String, deliveryId: String, request: Requests.ReplayDeliveryWebhooksRequest, requestOptions: RequestOptions?) -> ReplayDeliveryWebhooksResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Re-sends the exact payload of a past delivery to the webhook's current URL and returns the delivery result. The replay keeps the original `webhook-id` unless you pass `regenerate_id`, so consumers that deduplicate on it can drop events they already processed. Only available for enabled webhooks on API version `v1`; deliveries are retained for 30 days.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.webhooks.replayDelivery(
        id: "id",
        deliveryId: "delivery_id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Webhook ID, prefixed `hook_`.
    
</dd>
</dl>

<dl>
<dd>

**deliveryId:** `String` — Delivery ID, prefixed `whdel_`, from the List Deliveries endpoint.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ReplayDeliveryWebhooksRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">replay</a>(id: String, request: Requests.ReplayWebhooksRequest, requestOptions: RequestOptions?) -> ReplayWebhooksResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Re-sends the webhook's past deliveries within a time window, optionally limited to specific events or to failed deliveries. Use it to recover events your endpoint missed. The replay runs asynchronously and nothing about it is stored: each re-send appears as a new entry in the webhook's delivery log. Each matching message is re-sent once, with its original `webhook-id` unless you pass `regenerate_ids`. Only available for enabled webhooks on API version `v1`; deliveries are retained for 30 days.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.webhooks.replay(
        id: "id",
        request: .init(sentAfter: "2026-01-01T12:00:00.000Z")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Webhook ID, prefixed `hook_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ReplayWebhooksRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">test</a>(id: String, request: Requests.TestWebhooksRequest, requestOptions: RequestOptions?) -> TestWebhooksResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Sends a sample payload for the given event to the webhook's URL and returns the delivery result.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.webhooks.test(
        id: "id",
        request: .init(event: "payment.succeeded")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Webhook ID, prefixed `hook_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.TestWebhooksRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Accounts CustomerTracking
<details><summary><code>client.accounts.customerTracking.<a href="/Sources/Resources/Accounts/CustomerTracking/CustomerTrackingClient.swift">retrieve</a>(accountId: String, requestOptions: RequestOptions?) -> AccountCustomerTracking</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the branding and support contacts the account's hosted customer tracking page and tracking Element display. Public by design, so no authentication is required. Returns 404 unless the account has turned customer tracking on in its preferences. Responses are never cached.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.accounts.customerTracking.retrieve(accountId: "account_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Account ID, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Accounts Fees
<details><summary><code>client.accounts.fees.<a href="/Sources/Resources/Accounts/Fees/FeesClient.swift">retrieve</a>(accountId: String, requestOptions: RequestOptions?) -> AccountFees</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the account's fees as a single document keyed by fee, with any markups its platform adds. Subaccounts see the rates in effect for them. `adjustable` on each fee says what you may change with Update Account Fees.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.accounts.fees.retrieve(accountId: "account_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Account ID, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.accounts.fees.<a href="/Sources/Resources/Accounts/Fees/FeesClient.swift">update</a>(accountId: String, request: Requests.UpdateFeesRequest, requestOptions: RequestOptions?) -> AccountFees</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the account's fees. Each key present in the body is replaced; omitted keys are left untouched. Only fees that Retrieve Account Fees reports as `adjustable` can be changed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.accounts.fees.update(
        accountId: "account_id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Account ID, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateFeesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Accounts FinancingProviders
<details><summary><code>client.accounts.financingProviders.<a href="/Sources/Resources/Accounts/FinancingProviders/FinancingProvidersClient.swift">list</a>(accountId: String, status: ListFinancingProvidersRequestStatus?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListFinancingProvidersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists every financing provider and where it stands for an account: whether checkout offers it, what the merchant can do to turn it on, and why it is off.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.accounts.financingProviders.list(accountId: "account_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — The ID of the account, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListFinancingProvidersRequestStatus?` — Only providers with this status.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Accounts Preferences
<details><summary><code>client.accounts.preferences.<a href="/Sources/Resources/Accounts/Preferences/PreferencesClient.swift">retrieve</a>(accountId: String, requestOptions: RequestOptions?) -> RetrievePreferencesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the account's preferences: a singleton settings document keyed by preference name.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.accounts.preferences.retrieve(accountId: "account_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Account ID, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.accounts.preferences.<a href="/Sources/Resources/Accounts/Preferences/PreferencesClient.swift">update</a>(accountId: String, request: Requests.UpdatePreferencesRequest, requestOptions: RequestOptions?) -> UpdatePreferencesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the account's preferences. Each top-level key in the body replaces its stored value as a whole. Keys left out keep their current values.

The required scope depends on which preferences you update.

- `ad_campaign:create`: `ads_payment_methods`, `ads_reporting_currency`, `ads_scheduling_timezone`, `ads_triple_whale_integration`.
- `payout:account:update`: `cards_auto_top_up`, `cards_notifications`, `covers_subaccount_negative_balances`.
- `payment:dispute`: `dispute_fighter_enabled`.
- `company:update`: `economic_intelligence_duration_key`, `economic_intelligence_auto_renew`, `review_request_emails`, `cancellation_emails`, `renewal_reminder_emails`, `failed_payment_emails`, `subaccount_notifications`, `subaccount_team_view_only`.
- `company:manage_checkout`: `feedback_options`, `customer_tracking`.

To update keys under more than one scope, the API key needs all of those scopes.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.accounts.preferences.update(
        accountId: "account_id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Account ID, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdatePreferencesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Accounts Reserves
<details><summary><code>client.accounts.reserves.<a href="/Sources/Resources/Accounts/Reserves/ReservesClient.swift">list</a>(accountId: String, requestOptions: RequestOptions?) -> ListReservesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists what the account's held balance is made of, one entry per currency: the total held, why each part is held, and the days it unlocks.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.accounts.reserves.list(accountId: "account_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Account ID, prefixed `biz_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Affiliates Overrides
<details><summary><code>client.affiliates.overrides.<a href="/Sources/Resources/Affiliates/Overrides/OverridesClient.swift">list</a>(id: String, after: String?, before: String?, first: Int?, last: Int?, overrideType: AffiliateOverrideRoles?, requestOptions: RequestOptions?) -> ListOverridesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of overrides for an affiliate.

Required permissions:
 - `affiliate:basic:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.affiliates.overrides.list(
        id: "aff_xxxxxxxxxxxxxx",
        first: 42,
        last: 42
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The affiliate ID.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Returns the elements in the list that come after the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Returns the elements in the list that come before the specified cursor.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Returns the first _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Returns the last _n_ elements from the list.
    
</dd>
</dl>

<dl>
<dd>

**overrideType:** `AffiliateOverrideRoles?` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.affiliates.overrides.<a href="/Sources/Resources/Affiliates/Overrides/OverridesClient.swift">create</a>(id: String, request: CreateOverridesRequestBody, requestOptions: RequestOptions?) -> CreateOverridesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a commission override for an affiliate.

Required permissions:
 - `affiliate:create`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.affiliates.overrides.create(
        id: "aff_xxxxxxxxxxxxxx",
        request: CreateOverridesRequestBody.standard(
            CreateOverridesRequestBodyStandard(
                commissionValue: 6.9,
                id: "id",
                planId: "plan_xxxxxxxxxxxxx"
            )
        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The affiliate ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `CreateOverridesRequestBody` — Parameters for CreateAffiliateOverride
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.affiliates.overrides.<a href="/Sources/Resources/Affiliates/Overrides/OverridesClient.swift">retrieve</a>(id: String, overrideId: String, requestOptions: RequestOptions?) -> RetrieveOverridesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of a specific affiliate override.

Required permissions:
 - `affiliate:basic:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.affiliates.overrides.retrieve(
        id: "aff_xxxxxxxxxxxxxx",
        overrideId: "override_id"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The affiliate ID.
    
</dd>
</dl>

<dl>
<dd>

**overrideId:** `String` — The override ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.affiliates.overrides.<a href="/Sources/Resources/Affiliates/Overrides/OverridesClient.swift">delete</a>(id: String, overrideId: String, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes an affiliate override.

Required permissions:
 - `affiliate:update`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.affiliates.overrides.delete(
        id: "aff_xxxxxxxxxxxxxx",
        overrideId: "override_id"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The affiliate ID.
    
</dd>
</dl>

<dl>
<dd>

**overrideId:** `String` — The override ID.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.affiliates.overrides.<a href="/Sources/Resources/Affiliates/Overrides/OverridesClient.swift">update</a>(id: String, overrideId: String, request: Requests.UpdateOverridesRequest, requestOptions: RequestOptions?) -> UpdateOverridesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates an existing affiliate override.

Required permissions:
 - `affiliate:update`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.affiliates.overrides.update(
        id: "aff_xxxxxxxxxxxxxx",
        overrideId: "override_id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The affiliate ID.
    
</dd>
</dl>

<dl>
<dd>

**overrideId:** `String` — The override ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateOverridesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Apps Categories
<details><summary><code>client.apps.categories.<a href="/Sources/Resources/Apps/Categories/CategoriesClient.swift">list</a>(appType: ListCategoriesRequestAppType?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListCategoriesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the App Store's categories. Pass `app_type` for one store's categories in the order that store shows them; without it, every category either store shows is listed. Use a business category's ID as an app's `category_id`, or any category's `route` to filter apps. This endpoint is public and does not require authentication.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.apps.categories.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**appType:** `ListCategoriesRequestAppType?` — Only return the categories of this app type's store, in that store's order: `b2b_app` for the business App Store, `b2c_app` for the community App Store.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Bounties Submissions
<details><summary><code>client.bounties.submissions.<a href="/Sources/Resources/Bounties/Submissions/SubmissionsClient.swift">list</a>(bountyId: String, status: ListSubmissionsRequestStatus?, createdAfter: String?, createdBefore: String?, order: ListSubmissionsRequestOrder?, direction: ListSubmissionsRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListSubmissionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists a bounty's publicly visible work — submitted, approved, and denied submissions in the reduced public shape. Authentication is optional; a bounty that is not publicly visible returns `404`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.bounties.submissions.list(bountyId: "bounty_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**bountyId:** `String` — The bounty whose public submissions to list (`bnty_` tag).
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListSubmissionsRequestStatus?` — Filter by lifecycle state.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only submissions created after this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only submissions created before this ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListSubmissionsRequestOrder?` — Sort field.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListSubmissionsRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.bounties.submissions.<a href="/Sources/Resources/Bounties/Submissions/SubmissionsClient.swift">retrieve</a>(bountyId: String, id: String, requestOptions: RequestOptions?) -> PublicBountySubmission</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves one of a bounty's publicly visible submissions in the reduced public shape — the read behind a shared proof link, whose submission is usually outside the bounty page's capped preview. Authentication is optional; a bounty that is not publicly visible, and a submission that is not publicly visible work on it, both return `404`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.bounties.submissions.retrieve(
        bountyId: "bounty_id",
        id: "id"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**bountyId:** `String` — The bounty the submission belongs to (`bnty_` tag).
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — The submission to retrieve (`btys_` tag).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## FinancialReports Breakdown
<details><summary><code>client.financialReports.breakdown.<a href="/Sources/Resources/FinancialReports/Breakdown/BreakdownClient.swift">retrieve</a>(accountId: String, bucket: RetrieveBreakdownRequestBucket, direction: RetrieveBreakdownRequestDirection, currency: String, from: Date, to: Date, groupBy: RetrieveBreakdownRequestGroupBy?, timezone: String?, requestOptions: RequestOptions?) -> RetrieveBreakdownResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Breaks one bucket of a financial report, such as payments received or card spend, into the customers, accounts, merchants, or campaigns that contributed most, with the rest summed as a remainder. Use it to explain a total from `GET /financial_reports`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.financialReports.breakdown.retrieve(
        accountId: "account_id",
        bucket: .transfers,
        direction: .moneyIn,
        currency: "currency",
        from: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
        to: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — The owning account ID (a biz_ identifier).
    
</dd>
</dl>

<dl>
<dd>

**bucket:** `RetrieveBreakdownRequestBucket` — The high-level report bucket to explain.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `RetrieveBreakdownRequestDirection` — Whether to explain money received or money sent.
    
</dd>
</dl>

<dl>
<dd>

**currency:** `String` — The report currency to explain.
    
</dd>
</dl>

<dl>
<dd>

**from:** `Date` — Start of the report window as an ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**to:** `Date` — Exclusive end of the report window as an ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**groupBy:** `RetrieveBreakdownRequestGroupBy?` — Period grouping used by the parent report.
    
</dd>
</dl>

<dl>
<dd>

**timezone:** `String?` — IANA timezone used by the parent report to bucket periods. Defaults to UTC.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Invoices Sends
<details><summary><code>client.invoices.sends.<a href="/Sources/Resources/Invoices/Sends/SendsClient.swift">list</a>(id: String, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListSendsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists recorded invoice emails, most recent first. Each entry is a send, send again, scheduled send, reminder, or payment link after a failed charge. Each entry includes the addresses it went to and who sent it. Issuing without sending adds nothing. Entries appear after queuing. Addresses need `member:email:read`, and the sender needs `company:authorized_user:read`. History starts when recording is enabled and does not confirm inbox delivery.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.invoices.sends.list(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The invoice's pay_ ID.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Members Logs
<details><summary><code>client.members.logs.<a href="/Sources/Resources/Members/Logs/LogsClient.swift">list</a>(id: String, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListLogsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists activity for a member and all of their memberships that are not `drafted`, most recent first.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.members.logs.list(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Member ID (`mber_` tag).
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Members Notes
<details><summary><code>client.members.notes.<a href="/Sources/Resources/Members/Notes/NotesClient.swift">list</a>(memberId: String, first: Int?, after: String?, last: Int?, before: String?, includeTotalCount: Bool?, requestOptions: RequestOptions?) -> ListNotesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists a member's notes, newest first. Notes are visible to the account's team.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.members.notes.list(memberId: "member_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**memberId:** `String` — The member the notes are about, prefixed `mber_`.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**includeTotalCount:** `Bool?` — Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.members.notes.<a href="/Sources/Resources/Members/Notes/NotesClient.swift">create</a>(memberId: String, request: Requests.CreateNotesRequest, requestOptions: RequestOptions?) -> MemberNote</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds a note to a member. Notes are visible to the account's team.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.members.notes.create(
        memberId: "member_id",
        request: .init(content: "Wants a call next week.")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**memberId:** `String` — The member the notes are about, prefixed `mber_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.CreateNotesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Notifications Topics
<details><summary><code>client.notifications.topics.<a href="/Sources/Resources/Notifications/Topics/TopicsClient.swift">list</a>(topicType: ListTopicsRequestTopicType?, first: Int?, after: String?, requestOptions: RequestOptions?) -> ListTopicsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the platform's visible notification topics — the categories users can set notification preferences on. App-created topics are not returned.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.notifications.topics.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**topicType:** `ListTopicsRequestTopicType?` — Only return topics of this scope: `user` (member notifications) or `account_team` (team notifications).
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Partners Businesses
<details><summary><code>client.partners.businesses.<a href="/Sources/Resources/Partners/Businesses/BusinessesClient.swift">list</a>(referringAccountId: String?, advanceStatus: ListBusinessesRequestAdvanceStatus?, status: ListBusinessesRequestStatus?, hasEarnings: Bool?, first: Int?, after: String?, last: Int?, before: String?, includeTotalCount: Bool?, order: ListBusinessesRequestOrder?, direction: ListBusinessesRequestDirection?, createdBefore: String?, createdAfter: String?, firstSaleBefore: String?, firstSaleAfter: String?, referredUserId: String?, referredUsername: String?, tier: ListBusinessesRequestTier?, businessPrefixQuery: String?, earningPartnerId: String?, requestOptions: RequestOptions?) -> ListBusinessesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the businesses the authenticated user referred onto Whop, most recent first.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.partners.businesses.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**referringAccountId:** `String?` — List the referrals this business's team members made, past members included, instead of the authenticated user's own. Requires company:basic:read on that business, which every team member holds, and cannot be combined with user_id. The owner role reads every referral; anyone else reads only the referrals made by themselves and by the people under them in the org chart.
    
</dd>
</dl>

<dl>
<dd>

**advanceStatus:** `ListBusinessesRequestAdvanceStatus?` — Filter the authenticated partner's CPA offers by status, or with referring_account_id, the CPA terms of the reps the caller manages. Use offered for every state after qualification.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListBusinessesRequestStatus?` — Filter by referral status.
    
</dd>
</dl>

<dl>
<dd>

**hasEarnings:** `Bool?` — When true, only businesses with pending or completed earnings paid to the caller.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**includeTotalCount:** `Bool?` — Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListBusinessesRequestOrder?` — The field to sort partner businesses by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListBusinessesRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only return partner businesses created before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only return partner businesses created after this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**firstSaleBefore:** `String?` — Only return partner businesses whose first paid sale above zero happened before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**firstSaleAfter:** `String?` — Only return partner businesses whose first paid sale above zero happened after this timestamp. Combined with first_sale_before, this is the net new set: businesses that processed their first $1 inside the window.
    
</dd>
</dl>

<dl>
<dd>

**referredUserId:** `String?` — Filter to referrals attributed to this user. For first-tier referrals, this is the referred account owner; for second-tier referrals, this is the partner you recruited.
    
</dd>
</dl>

<dl>
<dd>

**referredUsername:** `String?` — Filter by the referred user's exact username. Ignored when `referred_user_id` is present.
    
</dd>
</dl>

<dl>
<dd>

**tier:** `ListBusinessesRequestTier?` — Filter to referrals from a single tier: first, second, or blueprint.
    
</dd>
</dl>

<dl>
<dd>

**businessPrefixQuery:** `String?` — Case-insensitive business-name prefix, or an exact `biz_` account ID. Surrounding whitespace is ignored; blank values apply no filter.
    
</dd>
</dl>

<dl>
<dd>

**earningPartnerId:** `String?` — Only the referrals this team member made, plus the ones they were added to as a deal participant. User ID, prefixed `user_`. Requires `referring_account_id`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partners.businesses.<a href="/Sources/Resources/Partners/Businesses/BusinessesClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> RetrieveBusinessesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a single referred business and its referral terms. The original referrer or a caller with company:basic:read on the business credited for the referral can read it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.partners.businesses.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The partner business ID (a coma_ identifier).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partners.businesses.<a href="/Sources/Resources/Partners/Businesses/BusinessesClient.swift">update</a>(id: String, request: Requests.UpdateBusinessesRequest, requestOptions: RequestOptions?) -> UpdateBusinessesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Save annual payment projections for a business referred by the authenticated partner. Unaccepted projections can be replaced with updated annual card and BNPL payment volume. To qualify, payment volume over the last 30 days must reach 5% of the annual payment projection. Ads are excluded from CPA; ordinary ad commissions continue. Pass withdraw_projections: true without projection amounts to remove unaccepted projections. Accepted projections are immutable. Public API access requires a partner OAuth token; business API keys are not supported.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.partners.businesses.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The partner business ID (a coma_ identifier).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateBusinessesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partners.businesses.<a href="/Sources/Resources/Partners/Businesses/BusinessesClient.swift">acceptCommissionAdvance</a>(id: String, request: Requests.AcceptCommissionAdvanceBusinessesRequest, requestOptions: RequestOptions?) -> AcceptCommissionAdvanceBusinessesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Accept the authenticated partner's CPA offer with the reviewed terms and signed offer token. Public API access requires a partner OAuth token; business API keys are not supported.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.partners.businesses.acceptCommissionAdvance(
        id: "id",
        request: .init(
            acknowledgments: [
                .commissionReplacement,
                .clawback,
                .term
            ],
            expectedAmountUsd: "1079.99",
            offerToken: "eyJfcmFpbHMiOnsiZGF0YSI6MSwicHVyIjoiYmxvYl9pZCJ9fQ==--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            termsVersion: "2026-01-01"
        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The referred business relationship ID.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.AcceptCommissionAdvanceBusinessesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.partners.businesses.<a href="/Sources/Resources/Partners/Businesses/BusinessesClient.swift">resendInvite</a>(id: String, request: Requests.ResendInviteBusinessesRequest, requestOptions: RequestOptions?) -> ResendInviteBusinessesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Re-emails an outstanding invite to claim ownership of a referred business. Find the invite in the business's `pending_owner_invites`. Only the first-tier partner can resend, from a whop.com session or the Whop CLI or MCP with `partner:handoff`. Rate limited to one resend per invite every five minutes.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.partners.businesses.resendInvite(
        id: "id",
        request: .init(inviteId: "ausri_xxxxxxxxxxxxxx")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The partner business ID (a coma_ identifier).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ResendInviteBusinessesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Partners Businesses Earnings
<details><summary><code>client.partners.businesses.earnings.<a href="/Sources/Resources/Partners/Businesses/Earnings/EarningsClient.swift">list</a>(id: String, status: ListEarningsRequestStatus?, incomeSource: [ListEarningsRequestIncomeSourceItem]?, first: Int?, after: String?, last: Int?, before: String?, order: ListEarningsRequestOrder?, direction: ListEarningsRequestDirection?, createdBefore: String?, createdAfter: String?, requestOptions: RequestOptions?) -> ListEarningsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the earnings Whop pays out for one referred business's activity, most recent first. The original referrer or a caller with company:basic:read on the business credited for the referral can read them.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.partners.businesses.earnings.list(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The partner business ID (a coma_ identifier).
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListEarningsRequestStatus?` — Filter by earning status.
    
</dd>
</dl>

<dl>
<dd>

**incomeSource:** `[ListEarningsRequestIncomeSourceItem]?` — Filter to earnings from these income sources. Repeat the parameter for each one (income_source=sales&income_source=ad_spend).
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListEarningsRequestOrder?` — The field to sort earnings by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListEarningsRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only return earnings created before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only return earnings created after this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Payments LevelsRebate
<details><summary><code>client.payments.levelsRebate.<a href="/Sources/Resources/Payments/LevelsRebate/LevelsRebateClient.swift">retrieve</a>(paymentId: String, requestOptions: RequestOptions?) -> PaymentLevelsRebate</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the part of its account's monthly Whop Levels rebate a card payment earned: the processing fee above its level's rate, once the month its fee posted in has closed. The rebate is paid to the account as one sum each month, so the payment's own amounts and fees never change.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payments.levelsRebate.retrieve(paymentId: "payment_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**paymentId:** `String` — The payment whose rebate to retrieve, prefixed `pay_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Payouts Methods
<details><summary><code>client.payouts.methods.<a href="/Sources/Resources/Payouts/Methods/MethodsClient.swift">list</a>(accountId: String?, userId: String?, status: ListMethodsRequestStatus?, amount: Double?, currency: String?, includeRecipients: Bool?, includeLimits: Bool?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListMethodsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the bank accounts, wallets, and crypto addresses an account or user can pay out to, newest first.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payouts.methods.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — The owning account ID (a biz_ identifier). Provide this or user_id.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — The owning user ID (a user_ identifier). Provide this or account_id.
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListMethodsRequestStatus?` — Optional status filter. `created` means saved but unused, `active` means a payout through it succeeded, `broken` means the last payout failed and the method needs fixing.
    
</dd>
</dl>

<dl>
<dd>

**amount:** `Double?` — Optional payout amount in whole currency units, for example `250.00`. When provided, each method includes a quote with the estimated fee, amount received, and delivery date for that amount.
    
</dd>
</dl>

<dl>
<dd>

**currency:** `String?` — Currency code of the amount, for example `usd`. Only meaningful with amount or include_limits.
    
</dd>
</dl>

<dl>
<dd>

**includeRecipients:** `Bool?` — When true, also includes bill-pay recipient methods tied to this funding account. Defaults to false, returning only the account's own payout methods.
    
</dd>
</dl>

<dl>
<dd>

**includeLimits:** `Bool?` — When true, the response also carries limits — the live per-speed payout caps the account's payout requests are validated against, in the requested currency. Requires the payout:withdrawal:read scope.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payouts.methods.<a href="/Sources/Resources/Payouts/Methods/MethodsClient.swift">create</a>(request: Requests.CreateMethodsRequest, requestOptions: RequestOptions?) -> CreateMethodsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Saves a bank account, wallet, or crypto address an account or user can pay out to, from a method listed by `GET /payouts/supported_methods`. Sensitive details are vaulted in transit and never stored raw.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payouts.methods.create(request: .init(supportedPayoutMethodId: "podst_xxxxxxxxxxxxxx"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateMethodsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payouts.methods.<a href="/Sources/Resources/Payouts/Methods/MethodsClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> DeleteMethodsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes a saved payout method so it can no longer receive payouts.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payouts.methods.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Payout method ID, prefixed `potk_`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payouts.methods.<a href="/Sources/Resources/Payouts/Methods/MethodsClient.swift">update</a>(id: String, request: Requests.UpdateMethodsRequest, requestOptions: RequestOptions?) -> UpdateMethodsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Changes the label used to identify a saved payout method, makes it the account's default payout method, or updates the payout address on file for it. Send `address` on its own: it cannot be combined with `nickname` or `is_default`. Address updates require the `payout:account:update` scope as well, on the same account, and are supported only for bank and wallet payout methods, not recipient payout methods.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payouts.methods.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Payout method ID, prefixed `potk_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateMethodsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Payouts PaypalLinkSessions
<details><summary><code>client.payouts.paypalLinkSessions.<a href="/Sources/Resources/Payouts/PaypalLinkSessions/PaypalLinkSessionsClient.swift">create</a>(request: Requests.CreatePaypalLinkSessionsRequest, requestOptions: RequestOptions?) -> CreatePaypalLinkSessionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Starts a Log in with PayPal session so PayPal itself can confirm the account holder owns a verified PayPal account. Send the holder to `authorize_url`; after they log in, PayPal returns them to Whop, and Whop redirects the browser to your `return_url` with a `paypal_link_token` query parameter to pass to `POST /payouts/methods`. If the login fails or is canceled, `return_url` receives an `error` query parameter (`paypal_login_canceled` or `paypal_login_failed`) instead. The payout method saved this way pays the email on the PayPal account, and its holder name must match the name on the account's payout setup. PayPal login is rolling out per account: until it is enabled for the account this answers `403 forbidden`, and `supports_paypal_login` on `GET /payouts/supported_methods` is false.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payouts.paypalLinkSessions.create(request: .init(
        returnUrl: "https://example.com/settings/payouts",
        supportedPayoutMethodId: "podst_xxxxxxxxxxxxxx"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreatePaypalLinkSessionsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Payouts SupportedMethods
<details><summary><code>client.payouts.supportedMethods.<a href="/Sources/Resources/Payouts/SupportedMethods/SupportedMethodsClient.swift">list</a>(accountId: String?, userId: String?, country: String?, amount: Double?, currency: String?, supportedPayoutMethodId: String?, destinationCurrency: String?, partyType: ListSupportedMethodsRequestPartyType?, includeIndividualBanks: Bool?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListSupportedMethodsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the payout methods an account or user is eligible to add. Pass a result's ID as `supported_payout_method_id` to `POST /payouts/methods` to save one.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.payouts.supportedMethods.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — The owning account ID (a biz_ identifier). Provide this or user_id.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — The owning user ID (a user_ identifier). Provide this or account_id.
    
</dd>
</dl>

<dl>
<dd>

**country:** `String?` — ISO 3166-1 alpha-2 country code for the bank account or wallet, such as `US`. Defaults to the country of supported_payout_method_id when one is given, otherwise the payout account's country.
    
</dd>
</dl>

<dl>
<dd>

**amount:** `Double?` — Optional payout amount in whole currency units, for example `250.00`. When provided, each destination includes per-currency fee and delivery quotes.
    
</dd>
</dl>

<dl>
<dd>

**currency:** `String?` — Currency code of the amount, for example `usd`. Only meaningful with amount.
    
</dd>
</dl>

<dl>
<dd>

**supportedPayoutMethodId:** `String?` — Narrows the list to one supported payout method (a podst_ identifier) and includes the required_fields needed to save it as a payout method.
    
</dd>
</dl>

<dl>
<dd>

**destinationCurrency:** `String?` — Currency the supported payout method would deliver payouts in. Only meaningful with supported_payout_method_id; required fields vary by destination currency.
    
</dd>
</dl>

<dl>
<dd>

**partyType:** `ListSupportedMethodsRequestPartyType?` — Who will own the payout method. `first_party` is the account itself. `third_party` is a recipient the account pays, saved with `recipient` on `POST /payouts/methods`, which needs no identity fields. Only meaningful with supported_payout_method_id.
    
</dd>
</dl>

<dl>
<dd>

**includeIndividualBanks:** `Bool?` — Whether to list each bank as its own payout method in countries where people choose a bank by name. Each bank has `parent_id` set to the bank deposit method that lists it. When `false`, these countries list one bank deposit method instead.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Stats Reports
<details><summary><code>client.stats.reports.<a href="/Sources/Resources/Stats/Reports/ReportsClient.swift">list</a>(requestOptions: RequestOptions?) -> ListReportsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists every report: the aggregates that are not bucketed over time, with the breakdowns and columns each one accepts. Use it to discover what a report can return before you retrieve it. For a bucketed series, use `GET /stats/time_series`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.stats.reports.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.stats.reports.<a href="/Sources/Resources/Stats/Reports/ReportsClient.swift">platformTrends</a>(breakdownBy: PlatformTrendsReportsRequestBreakdownBy?, columns: String?, windows: String?, timeZone: String?, order: PlatformTrendsReportsRequestOrder?, direction: PlatformTrendsReportsRequestDirection?, convertTo: String?, businessType: String?, industryType: String?, productCategory: String?, accountCountry: String?, customerCountry: String?, blueprint: String?, first: Int?, after: String?, requestOptions: RequestOptions?) -> PlatformTrendsReportsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves payments across all of Whop for up to four windows at once. Pass `breakdown_by` to split them by business type, industry type, product category, account country or customer country. The report covers the whole platform, so it takes no `account_id`. Only users with Trends access can read it, from whop.com, the Whop apps, the Whop CLI or the Whop MCP.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.stats.reports.platformTrends()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**breakdownBy:** `PlatformTrendsReportsRequestBreakdownBy?` — What each row is. Omit it for one row per window, holding the window's total.
    
</dd>
</dl>

<dl>
<dd>

**columns:** `String?` — Comma-separated properties and metrics to return on each row. `business_type` can ride along on `industry_type` rows. Defaults to `gross_revenue,businesses`.
    
</dd>
</dl>

<dl>
<dd>

**windows:** `String?` — Comma-separated windows, at most four: `1d`, `7d`, `30d`, `90d`, `365d`, `mtd`, `qtd`, `ytd`, `all_time`, an explicit `2026-09-01..2026-10-01`, any of these prefixed `prev:` for the equal-length period before, or suffixed `@2026-09-01` to end earlier. Defaults to `30d`.
    
</dd>
</dl>

<dl>
<dd>

**timeZone:** `String?` — IANA zone that day, month, quarter and year boundaries fall in. Defaults to `Etc/UTC`.
    
</dd>
</dl>

<dl>
<dd>

**order:** `PlatformTrendsReportsRequestOrder?` — The requested metric that ranks rows, by its value in the first window. Defaults to the first requested metric.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `PlatformTrendsReportsRequestDirection?` — Ranking direction. Defaults to `desc`.
    
</dd>
</dl>

<dl>
<dd>

**convertTo:** `String?` — Currency every money metric is converted into. Defaults to `usd`.
    
</dd>
</dl>

<dl>
<dd>

**businessType:** `String?` — Only counts payments to businesses of these comma-separated business types, such as `education`.
    
</dd>
</dl>

<dl>
<dd>

**industryType:** `String?` — Only counts payments to businesses in these comma-separated industry types, such as `options_trading`.
    
</dd>
</dl>

<dl>
<dd>

**productCategory:** `String?` — Only counts payments for products in these comma-separated product categories, such as `algo_trading_course`.
    
</dd>
</dl>

<dl>
<dd>

**accountCountry:** `String?` — Only counts payments to accounts located in these comma-separated countries, as ISO 3166-1 alpha-2 codes such as `US`.
    
</dd>
</dl>

<dl>
<dd>

**customerCountry:** `String?` — Only counts payments from customers in these comma-separated countries, as ISO 3166-1 alpha-2 codes such as `US`.
    
</dd>
</dl>

<dl>
<dd>

**blueprint:** `String?` — Only counts payments to businesses with an app created from one of these comma-separated blueprint app IDs, such as `app_xxxxxxxxxxxxxx`.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Stats TimeSeries
<details><summary><code>client.stats.timeSeries.<a href="/Sources/Resources/Stats/TimeSeries/TimeSeriesClient.swift">list</a>(requestOptions: RequestOptions?) -> ListTimeSeriesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the metrics you can chart over time, with the unit each reports and the properties you can filter or break it down by. Aggregates that are not bucketed over time are reports, listed at `GET /stats/reports`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.stats.timeSeries.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.stats.timeSeries.<a href="/Sources/Resources/Stats/TimeSeries/TimeSeriesClient.swift">retrieve</a>(metric: String, accountId: String?, userId: String?, from: String, to: String, interval: RetrieveTimeSeriesRequestInterval?, breakdownBy: String?, convertTo: String?, currency: String?, timeZone: String?, paymentMethod: String?, cardNetwork: String?, disputeReason: String?, source: String?, hostname: String?, page: String?, deviceType: String?, countryCode: String?, eventName: String?, eventType: RetrieveTimeSeriesRequestEventType?, customName: String?, segment: String?, category: String?, merchant: String?, feeType: String?, product: String?, status: String?, accessLevel: String?, mostRecentAction: String?, referredUserId: String?, adCampaignIds: [String]?, adGroupIds: [String]?, adIds: [String]?, snapshotWindow: RetrieveTimeSeriesRequestSnapshotWindow?, event: String?, businessType: String?, industryType: String?, productCategory: String?, accountCountry: String?, issuer: String?, webhookId: String?, conversionWindow: String?, matureOnly: Bool?, steps: RetrieveTimeSeriesRequestSteps?, compareTo: String?, confidenceLevel: Double?, contactable: Bool?, hasPurchased: Bool?, firstSeenAfter: Date?, firstSeenBefore: Date?, lastSeenAfter: Date?, lastSeenBefore: Date?, firstSeenWithinDays: Int?, lastSeenWithinDays: Int?, known: Bool?, hasEmail: Bool?, hasPhone: Bool?, ltvGt: Double?, ltvGte: Double?, ltvLt: Double?, ltvLte: Double?, aovGt: Double?, aovGte: Double?, aovLt: Double?, aovLte: Double?, purchaseCountGt: Double?, purchaseCountGte: Double?, purchaseCountLt: Double?, purchaseCountLte: Double?, eventCountGt: Double?, eventCountGte: Double?, eventCountLt: Double?, eventCountLte: Double?, referringAccountId: String?, teamLeadId: String?, activity: RetrieveTimeSeriesRequestActivity?, breakdownLimit: Int?, requestOptions: RequestOptions?) -> RetrieveTimeSeriesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a metric as a series of points over a time range for an account or user. For an aggregate that is not bucketed over time, use a report from `GET /stats/reports`. The `market_prices` metric is public and requires no authentication. Each metric takes its own scope: most need `stats:read`, the earnings, markup revenue and `platform_markup_amount` metrics need `company:balance:read`, `markup_earning_estimate` needs `company:update_child_fees`, and `ad_delivery`, `ad_campaign_score`, `people` and `events` also accept `ad_campaign:read`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.stats.timeSeries.retrieve(
        metric: "metric",
        from: "from",
        to: "to",
        adCampaignIds: [
            "adcamp_xxxxxxxxxxxxxx"
        ],
        adGroupIds: [
            "adgrp_xxxxxxxxxxxxxx"
        ],
        adIds: [
            "ad_xxxxxxxxxxxxxx"
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**metric:** `String` — The metric to retrieve, for example net_revenue. Use GET /stats/time_series to see every metric key. The metric sets the unit and the properties you can filter or break down by.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Account this query concerns, prefixed `biz_`, or `platform` for all of Whop.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — The user this query concerns, for example user_AbC123. Available on metrics that support user subjects, such as account_balance.
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — Start of the range — a date (YYYY-MM-DD), expanded to the start of that day, or an ISO 8601 timestamp (for example 2026-07-16T16:37:00Z), used exactly.
    
</dd>
</dl>

<dl>
<dd>

**to:** `String` — End of the range — a date (YYYY-MM-DD), expanded to the end of that day, or an ISO 8601 timestamp (for example 2026-07-17T16:37:00Z), used exactly. Funnel entry ranges cannot exceed 90 days.
    
</dd>
</dl>

<dl>
<dd>

**interval:** `RetrieveTimeSeriesRequestInterval?` — How wide each point is. Defaults to day. Snapshot metrics are day-only. Funnels support at most 2,000 first-entry cohort buckets.
    
</dd>
</dl>

<dl>
<dd>

**breakdownBy:** `String?` — Split the metric out by one of its properties — each point gets a breakdown array. For example breakdown_by=currency returns an entry for usd, an entry for eur, and so on. Funnels use a property of the first matched event, with at most 300 groups. experiment_id and variant require an exposure as step 1. For funnel source breakdowns, steps[1][source]=whop:* groups by campaign, whop:<campaign>:* by ad group, and whop:<campaign>:<group>:* by ad. See the metric catalog for supported breakdowns.
    
</dd>
</dl>

<dl>
<dd>

**convertTo:** `String?` — Display currency for money metrics — every amount is converted into this ISO currency using the exchange rate on each period's date. Defaults to usd. For the ads metrics (ad_spend, ad_delivery), pass the account's ads reporting currency to match the ad entity endpoints. On transaction metrics, it is ignored when you filter or break down by currency (those report the original transaction currency, unconverted).
    
</dd>
</dl>

<dl>
<dd>

**currency:** `String?` — Select the source currency or asset on metrics that list currency. For transaction metrics, for example currency=eur, values are reported without conversion. For market_prices, use btc or xaut and convert_to=usd. Pair with breakdown_by=currency to split a metric by currency.
    
</dd>
</dl>

<dl>
<dd>

**timeZone:** `String?` — IANA time zone to bucket the series in, for example America/New_York. Defaults to UTC. Not accepted by snapshot metrics, which are UTC only.
    
</dd>
</dl>

<dl>
<dd>

**paymentMethod:** `String?` — Filter to a single payment method, for example card or crypto. Available on metrics that list payment_method.
    
</dd>
</dl>

<dl>
<dd>

**cardNetwork:** `String?` — Filter to a single card brand, for example visa. A refinement of payment_method=card. Available on metrics that list card_network.
    
</dd>
</dl>

<dl>
<dd>

**disputeReason:** `String?` — Filter disputes to a normalized reason, for example product_not_received. Pair with breakdown_by=dispute_reason to split dispute counts by reason.
    
</dd>
</dl>

<dl>
<dd>

**source:** `String?` — Filter to a single GMV source, for example payments — or, on the traffic metrics, a visit source (whop_ads, direct, or a utm_source value). Pair with breakdown_by=source to split by source. Available on metrics that list source.
    
</dd>
</dl>

<dl>
<dd>

**hostname:** `String?` — Filter traffic metrics to one website hostname, for example shop.example.com. On the events and people metrics, comma-separated hostnames match any listed hostname. Pair with breakdown_by=hostname to split by website.
    
</dd>
</dl>

<dl>
<dd>

**page:** `String?` — Filter traffic metrics to one page — a hostname plus normalized path, for example shop.example.com/pricing. Pair with breakdown_by=page to split by page.
    
</dd>
</dl>

<dl>
<dd>

**deviceType:** `String?` — Filter traffic metrics to one device type: desktop, mobile, tablet, or unknown. Pair with breakdown_by=device_type to split by device.
    
</dd>
</dl>

<dl>
<dd>

**countryCode:** `String?` — Filter traffic metrics to one visitor country (uppercase ISO 3166-1 alpha-2, for example US). Pair with breakdown_by=country_code to split by country.
    
</dd>
</dl>

<dl>
<dd>

**eventName:** `String?` — Filter the events metric to one tracked event name, for example pixel.page or pixel.custom. Pair with breakdown_by=event_name to split by event.
    
</dd>
</dl>

<dl>
<dd>

**eventType:** `RetrieveTimeSeriesRequestEventType?` — Filter the events metric to a canonical group of events: page_view (pixel page views plus whop.com store views), checkout_start (hosted and embedded checkout views), or other. Pair with breakdown_by=event_type to split by group.
    
</dd>
</dl>

<dl>
<dd>

**customName:** `String?` — Filter the events metric to one merchant-defined custom event name. Only valid alongside event_name=pixel.custom. Pair with breakdown_by=custom_name to split custom events by name.
    
</dd>
</dl>

<dl>
<dd>

**segment:** `String?` — Filter to a single wallet-balance segment, for example available. Pair with breakdown_by=segment to split the balance. Available on metrics that list segment.
    
</dd>
</dl>

<dl>
<dd>

**category:** `String?` — Filter to a single balance-activity category, for example payments. Pair with breakdown_by=category to split the activity. Available on metrics that list category.
    
</dd>
</dl>

<dl>
<dd>

**merchant:** `String?` — Filter to a single cashback merchant bucket, for example whop-ads. Pair with breakdown_by=merchant to split cashback by merchant. Available on metrics that list merchant.
    
</dd>
</dl>

<dl>
<dd>

**feeType:** `String?` — Filter to a single fee type. Pair with breakdown_by=fee_type to split fees by type. Available on metrics that list fee_type.
    
</dd>
</dl>

<dl>
<dd>

**product:** `String?` — Filter to a single product (access pass id), for example prod_AbC123. Pair with breakdown_by=product. Available on metrics that list product.
    
</dd>
</dl>

<dl>
<dd>

**status:** `String?` — Filter to a single membership status. Pair with breakdown_by=status. Available on metrics that list status.
    
</dd>
</dl>

<dl>
<dd>

**accessLevel:** `String?` — Filter to a single access level. Pair with breakdown_by=access_level. Available on metrics that list access_level.
    
</dd>
</dl>

<dl>
<dd>

**mostRecentAction:** `String?` — Filter to a single most-recent member action. Pair with breakdown_by=most_recent_action. Available on metrics that list most_recent_action.
    
</dd>
</dl>

<dl>
<dd>

**referredUserId:** `String?` — Filter a referral metric to the businesses attributed to one person you referred, for example user_AbC123. Available on metrics that list referred_user_id.
    
</dd>
</dl>

<dl>
<dd>

**adCampaignIds:** `[String]?` — Ad campaign ids (adcamp_...) to scope the report to; stats are summed across them. Available on metrics that list ad_campaign_ids.
    
</dd>
</dl>

<dl>
<dd>

**adGroupIds:** `[String]?` — Ad group ids (adgrp_...) to scope the report to; stats are summed across them. Available on metrics that list ad_group_ids.
    
</dd>
</dl>

<dl>
<dd>

**adIds:** `[String]?` — Ad ids (ad_...) to scope the report to; stats are summed across them. Available on metrics that list ad_ids.
    
</dd>
</dl>

<dl>
<dd>

**snapshotWindow:** `RetrieveTimeSeriesRequestSnapshotWindow?` — Window used by a snapshot metric. Ordinary snapshots accept 30d as their trailing activity window. Cohorted dispute metrics accept 7d or 28d as the sales-transaction pool; their attribution window is fixed in the metric name. Card network program metrics accept 7d, 14d, 28d, or 56d. Each metric lists its accepted values in the catalog.
    
</dd>
</dl>

<dl>
<dd>

**event:** `String?` — Filter the events metric to one or more full event names, for example payment.completed or pixel.lead. Comma-separated names match any listed event. Use group_by=event for separate groups. Available on metrics that list event.
    
</dd>
</dl>

<dl>
<dd>

**businessType:** `String?` — Filter to one business type, for example `education`. Pair with `breakdown_by=business_type` to split by business type. Available on metrics that list `business_type`.
    
</dd>
</dl>

<dl>
<dd>

**industryType:** `String?` — Filter to one industry type, for example `options_trading`. Pair with `breakdown_by=industry_type` to split by industry type. Available on metrics that list `industry_type`.
    
</dd>
</dl>

<dl>
<dd>

**productCategory:** `String?` — Filter to one product category, for example `algo_trading_course`. Pair with `breakdown_by=product_category` to split by product category. Available on metrics that list `product_category`.
    
</dd>
</dl>

<dl>
<dd>

**accountCountry:** `String?` — Filter to accounts located in one country, as an ISO 3166-1 alpha-2 code such as `US`. Pair with `breakdown_by=account_country` to split by account country. Available on metrics that list `account_country`.
    
</dd>
</dl>

<dl>
<dd>

**issuer:** `String?` — Filter to one card-issuing bank, named as the processor reports it, for example JPMORGAN CHASE BANK N A, or unknown for payments with no reported bank. Available on metrics that list issuer.
    
</dd>
</dl>

<dl>
<dd>

**webhookId:** `String?` — The webhook to count deliveries for, for example hook_AbC123. Required by webhook_deliveries, and must belong to account_id or one of its apps.
    
</dd>
</dl>

<dl>
<dd>

**conversionWindow:** `String?` — Funnel only. Time allowed from the first event to the final event: integer minutes, hours, or days, up to 30d.
    
</dd>
</dl>

<dl>
<dd>

**matureOnly:** `Bool?` — Funnel only. Include only entrants whose full conversion window has elapsed. Required for confidence intervals and comparisons.
    
</dd>
</dl>

<dl>
<dd>

**steps:** `RetrieveTimeSeriesRequestSteps?` — Funnel only. Required when metric=funnel. 2 to 10 ordered events per person, as consecutive one-based bracket parameters such as `steps[1][event]=pixel.page&steps[1][page]=/pricing*&steps[2][event]=payment.completed`. Values are scalar strings, never JSON. A person's first step 1 match inside `from`/`to` anchors their cohort, breakdown, and conversion window; later matches do not restart it. Other events may occur between steps, and conversions may land after `to`. For an experiment funnel, make `experiment.exposure` step 1 and pass `breakdown_by=variant`.
    
</dd>
</dl>

<dl>
<dd>

**compareTo:** `String?` — Funnel only. The breakdown value to use as baseline for whole-window final conversion. Requires breakdown_by and mature_only=true; defaults confidence_level to 0.95.
    
</dd>
</dl>

<dl>
<dd>

**confidenceLevel:** `Double?` — Funnel only. Confidence level for whole-window final conversion intervals, for example 0.95. Requires mature_only=true. Exposure steps must each filter one user- or visitor-randomized experiment.
    
</dd>
</dl>

<dl>
<dd>

**contactable:** `Bool?` — People metric only: contactable equals this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**hasPurchased:** `Bool?` — People metric only: has_purchased equals this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**firstSeenAfter:** `Date?` — People metric only: first_seen_at greater than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**firstSeenBefore:** `Date?` — People metric only: first_seen_at less than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**lastSeenAfter:** `Date?` — People metric only: last_seen_at greater than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**lastSeenBefore:** `Date?` — People metric only: last_seen_at less than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**firstSeenWithinDays:** `Int?` — People metric only: first_seen_at within this many days of now. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**lastSeenWithinDays:** `Int?` — People metric only: last_seen_at within this many days of now. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**known:** `Bool?` — People metric only: known equals this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**hasEmail:** `Bool?` — People metric only: has_email equals this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**hasPhone:** `Bool?` — People metric only: has_phone equals this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**ltvGt:** `Double?` — People metric only: ltv greater than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**ltvGte:** `Double?` — People metric only: ltv greater than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**ltvLt:** `Double?` — People metric only: ltv less than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**ltvLte:** `Double?` — People metric only: ltv less than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**aovGt:** `Double?` — People metric only: aov greater than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**aovGte:** `Double?` — People metric only: aov greater than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**aovLt:** `Double?` — People metric only: aov less than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**aovLte:** `Double?` — People metric only: aov less than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**purchaseCountGt:** `Double?` — People metric only: purchase_count greater than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**purchaseCountGte:** `Double?` — People metric only: purchase_count greater than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**purchaseCountLt:** `Double?` — People metric only: purchase_count less than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**purchaseCountLte:** `Double?` — People metric only: purchase_count less than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**eventCountGt:** `Double?` — People metric only: event_count greater than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**eventCountGte:** `Double?` — People metric only: event_count greater than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**eventCountLt:** `Double?` — People metric only: event_count less than this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**eventCountLte:** `Double?` — People metric only: event_count less than or equal this value. Applies to the current person profile for every time bucket. LTV and AOV are in USD. Not accepted by the Events metric.
    
</dd>
</dl>

<dl>
<dd>

**referringAccountId:** `String?` — Read a referral metric for a business instead of the caller: the referrals its team members made, past members included, for example biz_AbC123. Requires company:basic:read on that business and cannot be combined with user_id. Available on metrics that list referring_account_id.
    
</dd>
</dl>

<dl>
<dd>

**teamLeadId:** `String?` — Read a partner metric for one team lead and everyone under them in today's org chart, for example user_AbC123. Needs referring_account_id or a global query. As breakdown_by=team_lead_id, figures sit under the highest lead above the partner who earned them, so each group matches that lead's team_lead_id filter and the groups add up to the total. With team_lead_id set, or for a caller who reads only their own team, the groups are the leads under that person, who keeps the rest. Anyone with no lead is in a null group. Available on metrics that list team_lead_id.
    
</dd>
</dl>

<dl>
<dd>

**activity:** `RetrieveTimeSeriesRequestActivity?` — On partner_reps, all counts the period's roster, earning counts those who earned in the period, and not_earning counts the roster minus them. On the other partner metrics, earning keeps the figures of the people partner_reps counts as earning over the whole range and not_earning keeps the figures of everyone else; those need referring_account_id or a global query. Defaults to all. Available on metrics that list activity.
    
</dd>
</dl>

<dl>
<dd>

**breakdownLimit:** `Int?` — With a single breakdown_by, keep the groups with the highest whole-range values, up to this many, and fold every other group into one entry named other. A rate or an average ranks its groups by the deals it divides by. The other entry is measured from the underlying rows, so a distinct count or a rate stays exact rather than being added up from groups. Available on partner metrics only.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Trades Candles
<details><summary><code>client.trades.candles.<a href="/Sources/Resources/Trades/Candles/CandlesClient.swift">list</a>(market: String, interval: ListCandlesRequestInterval, from: Date, to: Date?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListCandlesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns price candles for a tokenized stock, oldest first.

- **Intervals:** `1h`, `2h`, `4h`, `6h` and `12h` candles cover the last 30 days. `1d` and `1w` candles cover the full history.
- **Weeks** start on Monday at 00:00 UTC.

This endpoint is public: no API key is needed, and each IP address can make up to 60 requests a minute.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.trades.candles.list(
        market: "market",
        interval: .oneH,
        from: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**market:** `String` — The tokenized stock's ticker, such as `NVDA`. This is the `id` of a spot market from List Markets.
    
</dd>
</dl>

<dl>
<dd>

**interval:** `ListCandlesRequestInterval` — How much time each candle covers.
    
</dd>
</dl>

<dl>
<dd>

**from:** `Date` — Return candles that start at or after this time, as an ISO 8601 timestamp.
    
</dd>
</dl>

<dl>
<dd>

**to:** `Date?` — Return candles that start before this time, as an ISO 8601 timestamp. Defaults to now.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Trades Markets
<details><summary><code>client.trades.markets.<a href="/Sources/Resources/Trades/Markets/MarketsClient.swift">list</a>(instrumentType: ListMarketsRequestInstrumentType?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListMarketsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns every market you can trade on Whop.

- **Spot:** listed by symbol: `BTC`, `SOL` and `XAUT` (gold), and tokenized stocks by ticker, such as `AAPL`, with their 24-hour change and logo. Spot markets also carry `volume_24h`, the value traded across exchanges over the last 24 hours.
- **Perpetuals:** such as `BTC`, and stock and commodity perpetuals from Hyperliquid's `xyz` exchange, such as `xyz:TSLA`. Send the `id` as `market` when you create a trade.

The same symbol can appear twice, once as a perpetual and once as spot, so use `id` together with `instrument_type` to tell them apart. Results are sorted by `id`, then `instrument_type`.

This endpoint is public: no API key is needed, and each IP address can make up to 60 requests a minute.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.trades.markets.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**instrumentType:** `ListMarketsRequestInstrumentType?` — Only return perpetuals or only spot markets.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users OauthGrants
<details><summary><code>client.users.oauthGrants.<a href="/Sources/Resources/Users/OauthGrants/OauthGrantsClient.swift">list</a>(appId: String?, first: Int?, after: String?, last: Int?, before: String?, order: ListOauthGrantsRequestOrder?, direction: ListOauthGrantsRequestDirection?, requestOptions: RequestOptions?) -> ListOauthGrantsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the authenticated user's own OAuth grants: one per app they have authorized, per account they authorized it for. You cannot read another user's grants. Requires a user session: an API key or an OAuth token is refused, so an app can never enumerate the other apps a user has authorized.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.users.oauthGrants.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**appId:** `String?` — Only return grants for this app, prefixed `app_`. An app the user has never authorized returns an empty list.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListOauthGrantsRequestOrder?` — The field to sort grants by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListOauthGrantsRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.oauthGrants.<a href="/Sources/Resources/Users/OauthGrants/OauthGrantsClient.swift">create</a>(request: Requests.CreateOauthGrantsRequest, requestOptions: RequestOptions?) -> OauthGrant</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Completes the OAuth authorization step for the authenticated user: records their consent to the scopes an app asked for and mints an authorization code. Returns the grant plus a `redirect_url` carrying the code, which is returned only this once; the app exchanges it at `POST /oauth/token`. Requires a user session, because consent has to come from the account holder: an API key or an OAuth token is refused, so an app can never authorize itself. Send an `Idempotency-Key` so a retry returns the original `redirect_url` and code instead of issuing a second one.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.users.oauthGrants.create(request: .init(
        clientId: "app_xxxxxxxxxxxxxx",
        redirectUri: "https://Booking.Shinetime.example:8443/oauth/Callback/",
        requestedScopes: [
            "openid"
        ]
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateOauthGrantsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users Passkeys
<details><summary><code>client.users.passkeys.<a href="/Sources/Resources/Users/Passkeys/PasskeysClient.swift">list</a>(first: Int?, after: String?, last: Int?, before: String?, order: ListPasskeysRequestOrder?, direction: ListPasskeysRequestDirection?, requestOptions: RequestOptions?) -> ListPasskeysResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the authenticated user's own passkeys, newest first. You cannot read another user's passkeys. Requires a user session: an API key or an OAuth token is refused, because a passkey confirms the account holder before a sensitive action and no app may enumerate one.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.users.passkeys.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of results to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListPasskeysRequestOrder?` — The field to sort passkeys by.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListPasskeysRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.passkeys.<a href="/Sources/Resources/Users/Passkeys/PasskeysClient.swift">create</a>(request: Requests.CreatePasskeysRequest, requestOptions: RequestOptions?) -> Passkey</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Registers a passkey for the authenticated user from the attestation a browser produced for a `registration` challenge. Mint that challenge first with `POST /users/me/passkeys/challenge` and run the ceremony with its `creation_options`; it is single-use and expires 5 minutes after it is issued. Send back the `user_handle` the options carried; a registration without it is refused. Registering replaces the account's passkeys made before Whop issued options, which can only be deleted. Requires a user session that has completed step-up verification.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.users.passkeys.create(request: .init(
        attestationObject: "YXR0ZXN0YXRpb24",
        clientDataJson: "Y2xpZW50LWRhdGE",
        credentialId: "bmV3LWNyZWRlbnRpYWw",
        nickname: "Work laptop",
        userHandle: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreatePasskeysRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.passkeys.<a href="/Sources/Resources/Users/Passkeys/PasskeysClient.swift">challenge</a>(request: Requests.ChallengePasskeysRequest, requestOptions: RequestOptions?) -> PasskeyChallenge</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Mints the challenge and WebAuthn options a browser needs to run a ceremony against the authenticated user's own passkeys. A `registration` challenge enrolls a new passkey; a `deletion` challenge is bound to the one passkey named by `passkey_id` and proves the user still holds it. The options are in wire snake_case: convert the keys to camelCase before passing them to the browser. Challenges are single-use and expire 5 minutes after they are issued, so send a fresh `Idempotency-Key` per ceremony — a replayed key returns the original challenge, which may already have expired. Requires a user session. A `registration` challenge also requires step-up verification, so the user completes it before the browser ceremony.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.users.passkeys.challenge(request: .init(challengeType: .registration))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.ChallengePasskeysRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.passkeys.<a href="/Sources/Resources/Users/Passkeys/PasskeysClient.swift">delete</a>(id: String, request: Requests.DeletePasskeysRequest, requestOptions: RequestOptions?) -> DeletePasskeysResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deletes one of the authenticated user's own passkeys. The request body carries a WebAuthn assertion from the passkey being deleted, so possession of the credential is proven before it is removed: mint a `deletion` challenge for it first, run the ceremony with that passkey, and send the result here. Deleting the user's last passkey is allowed — their other step-up factors remain. Requires a user session.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.users.passkeys.delete(
        id: "id",
        request: .init(
            authenticatorData: "YXV0aGVudGljYXRvci1kYXRh",
            clientDataJson: "Y2xpZW50LWRhdGE",
            signature: "c2lnbmF0dXJl"
        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Passkey ID, prefixed `wcred_`.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.DeletePasskeysRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users Preferences
<details><summary><code>client.users.preferences.<a href="/Sources/Resources/Users/Preferences/UsersPreferencesClient.swift">retrieve</a>(requestOptions: RequestOptions?) -> UserPreferences</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the authenticated user's settings document.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.users.preferences.retrieve()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.preferences.<a href="/Sources/Resources/Users/Preferences/UsersPreferencesClient.swift">update</a>(request: Requests.UpdatePreferencesRequestType, requestOptions: RequestOptions?) -> UserPreferences</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the authenticated user's settings document. Replaces the top-level keys it is given and leaves the rest untouched.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.users.preferences.update(request: .init())
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.UpdatePreferencesRequestType` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users Fees
<details><summary><code>client.users.fees.<a href="/Sources/Resources/Users/Fees/UsersFeesClient.swift">retrieve</a>(userId: String, requestOptions: RequestOptions?) -> UserFees</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the fees charged when the user moves money with their personal balance: withdrawals, transfers, bank deposits, and funding cards from pending balance. Each fee has the same shape as in Retrieve Account Fees. You can only retrieve your own fees, and they are read-only.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.users.fees.retrieve(userId: "user_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**userId:** `String` — `me`, or the authenticated user's own `user_` tag or username.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users Preferences Notifications
<details><summary><code>client.users.preferences.notifications.<a href="/Sources/Resources/Users/Preferences/Notifications/PreferencesNotificationsClient.swift">set</a>(request: Requests.SetNotificationsRequest, requestOptions: RequestOptions?) -> SetNotificationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Sets the authenticated user's notification preferences, each addressed by `scope` rather than by ID. The batch is applied in one transaction: if any entry is rejected, none are written. Experience levels are applied before topic overrides, because setting a level replaces every topic preference for that experience, so an override sent alongside a level wins. The response reports what each scope now resolves to, in the order the entries were sent.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.users.preferences.notifications.set(request: .init(preferences: [
        SetNotificationsRequestPreferencesItem(
            level: .null,
            scope: SetNotificationsRequestPreferencesItemScope(

            )
        )
    ]))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.SetNotificationsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users Preferences Notifications Experiences
<details><summary><code>client.users.preferences.notifications.experiences.<a href="/Sources/Resources/Users/Preferences/Notifications/Experiences/NotificationsExperiencesClient.swift">list</a>(first: Int?, after: String?, requestOptions: RequestOptions?) -> ListExperiencesResponseType</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the authenticated user's per-experience notification levels. Experiences the user never set a level for are omitted — their effective level is `all`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.users.preferences.notifications.experiences.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users Preferences Notifications Topics
<details><summary><code>client.users.preferences.notifications.topics.<a href="/Sources/Resources/Users/Preferences/Notifications/Topics/NotificationsTopicsClient.swift">list</a>(channel: ListTopicsRequestChannel?, accountId: String?, teamAccountId: String?, experienceId: String?, topicId: String?, first: Int?, after: String?, requestOptions: RequestOptions?) -> ListTopicsResponseType</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the authenticated user's topic-scoped notification preferences, plus user-agnostic platform defaults. Per-experience levels are listed separately, by `GET /users/me/preferences/notifications/experiences`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(
        baseURL: "https://api.whop.com/api/v1",
        token: "<token>"
    )

    _ = try await client.users.preferences.notifications.topics.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**channel:** `ListTopicsRequestChannel?` — Only return preferences for this delivery channel (or not narrowed to a channel).
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Only return preferences scoped to this account's member notifications (`biz_` tag), or not narrowed to an account.
    
</dd>
</dl>

<dl>
<dd>

**teamAccountId:** `String?` — Only return preferences scoped to this account's team notifications (`biz_` tag), or not narrowed to a team account.
    
</dd>
</dl>

<dl>
<dd>

**experienceId:** `String?` — Only return preferences scoped to this experience (`exp_` tag), or not narrowed to an experience.
    
</dd>
</dl>

<dl>
<dd>

**topicId:** `String?` — Only return preferences scoped to this notification topic (`topic_` tag), or not narrowed to a topic.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of results to return from the start of the range.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

