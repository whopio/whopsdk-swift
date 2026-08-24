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

Create a short-lived access token for authenticating API requests. When using API key authentication, provide company_id or user_id. When using OAuth, the user is derived from the token. Use this token with Whop's web and mobile embedded components.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

Generate a URL that directs a sub-merchant to their account portal, such as the hosted payouts dashboard or the KYC onboarding flow.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.accountLinks.create(request: .init(
        companyId: "biz_xxxxxxxxxxxxxx",
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
<details><summary><code>client.accounts.<a href="/Sources/Resources/Accounts/AccountsClient.swift">list</a>(first: Int?, after: String?, last: Int?, before: String?, order: ListAccountsRequestOrder?, direction: ListAccountsRequestDirection?, status: ListAccountsRequestStatus?, query: String?, createdAfter: Date?, createdBefore: Date?, volumeMin: Double?, volumeMax: Double?, parentAccountId: String?, requestOptions: RequestOptions?) -> ListAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists accounts visible to the credential. User tokens return the user's business accounts; Account API keys return the requesting account and its connected accounts. Pass `parent_account_id` to return only that parent account's connected accounts.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**first:** `Int?` — The number of accounts to return (default 10, max 50).
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor; returns accounts after this position.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — The number of accounts to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — A cursor; returns accounts before this position.
    
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

**parentAccountId:** `String?` — For platforms: the parent account ID whose direct connected accounts to return. Requires `payout:account:read` on the parent account.
    
</dd>
</dl>

<dl>
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

Creates an account. User tokens create business accounts; Account API keys create connected accounts. Tax fields (`tax_remitted_by`, `tax_type`, `product_tax_code_id`, `business_address`, `tax_identifiers`) are configured with Update Account, not at creation.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

<details><summary><code>client.accounts.<a href="/Sources/Resources/Accounts/AccountsClient.swift">me</a>(requestOptions: RequestOptions?) -> Account</code></summary>
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
    let client = Whop(token: "<token>")

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

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.accounts.<a href="/Sources/Resources/Accounts/AccountsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Account</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a single account by ID or public route when it is visible to the credential, including its crypto wallet. The reserved id `me` retrieves the account associated with the current Account API key; user tokens have no single account, so they must address one by ID or route.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**id:** `String` — Account ID, prefixed `biz_`, its public route, or `me` for the account associated with the current API key.
    
</dd>
</dl>

<dl>
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

Updates an account. User tokens can update business accounts; Account API keys can update connected accounts. The reserved id `me` — accepted on Retrieve Account — resolves to the requesting account, which an Account API key cannot edit, so updates must name the connected account by its `biz_` id.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**id:** `String` — Account ID, prefixed `biz_`.
    
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

Starts an LLC or C-Corp formation for a business account. Defaults to an LLC; set `entity_type` to `c_corp` to form a C-Corp, which additionally requires `share_structure` and officer `roles` on every founder. On submission, the application is validated and the response returns a hosted checkout URL. Once paid, the filing is submitted. Track progress through the account's [`company_formation`](/api-reference/beta/accounts/retrieve-account) field on Retrieve Account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
            businessType: "brick_and_mortar",
            businessWebsite: "https://shinetime.example",
            entitySuffix: .llc,
            entityType: .llc,
            expediteEin: true,
            formationState: .tx,
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
            industryGroup: "automotive",
            industryType: "car_wash",
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

<details><summary><code>client.accounts.<a href="/Sources/Resources/Accounts/AccountsClient.swift">transferOwnership</a>(id: String, request: Requests.TransferOwnershipAccountsRequest, requestOptions: RequestOptions?) -> TransferOwnershipAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Transfers ownership of the account to another user, identified by user ID or email address. If the recipient already holds the owner role, ownership moves immediately; otherwise they get an invite and ownership moves when they accept.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
<details><summary><code>client.adCampaigns.<a href="/Sources/Resources/AdCampaigns/AdCampaignsClient.swift">list</a>(accountId: String?, status: ListAdCampaignsRequestStatus?, query: String?, order: ListAdCampaignsRequestOrder?, direction: ListAdCampaignsRequestDirection?, createdBefore: String?, createdAfter: String?, statsFrom: String?, statsTo: String?, timeZone: String?, attributionModel: ListAdCampaignsRequestAttributionModel?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListAdCampaignsResponse</code></summary>
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
    let client = Whop(token: "<token>")

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

**order:** `ListAdCampaignsRequestOrder?` — The field to sort by. Defaults to created_at. Stat columns (spend, impressions, …) rank over the stats_from/stats_to window across the whole list, not just the current page. results, cost_per_result and return_on_ad_spend rank by the same Whop pixel-attributed values the response reports.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListAdCampaignsRequestDirection?` — The sort direction. Defaults to desc.
    
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

**first:** `Int?` — The number of campaigns to return.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor to fetch the page after (from page_info.end_cursor).
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — The number of campaigns to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Cursor to fetch the page before (from page_info.start_cursor).
    
</dd>
</dl>

<dl>
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

Creates an ad campaign for an account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.adCampaigns.create(request: .init(
        objective: .awareness,
        platform: .meta,
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
    let client = Whop(token: "<token>")

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

Deletes an ad campaign and archives it on the ad platform (cascades to ad groups and ads).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

Updates an ad campaign's editable fields (title, budget, schedule, bid strategy, special ad categories, and, before launch, budget optimization), and launches a draft campaign by setting status to active. Objective, budget type and desired cost per result are fixed at creation and cannot be changed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

<details><summary><code>client.adCampaigns.<a href="/Sources/Resources/AdCampaigns/AdCampaignsClient.swift">retryPayment</a>(id: String, requestOptions: RequestOptions?) -> AdCampaign</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retries billing for an ad campaign whose payment previously failed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.adCampaigns.retryPayment(id: "id")
}

try await main()
```
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

Resumes a paused ad campaign.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

**order:** `ListAdGroupsRequestOrder?` — The field to sort by. Defaults to created_at. Stat columns (spend, impressions, …) rank over the stats_from/stats_to window across the whole list, not just the current page. results, cost_per_result and return_on_ad_spend rank by the same Whop pixel-attributed values the response reports.
    
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

**first:** `Int?` — The number of ad groups to return.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor to fetch the page after (from page_info.end_cursor).
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — The number of ad groups to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Cursor to fetch the page before (from page_info.start_cursor).
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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

<details><summary><code>client.adGroups.<a href="/Sources/Resources/AdGroups/AdGroupsClient.swift">estimateReach</a>(request: Requests.EstimateReachAdGroupsRequest, requestOptions: RequestOptions?) -> ReachEstimate</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Estimates how many people a draft targeting spec can reach, before an ad group is created. The body takes the same targeting fields as creating an ad group — `regions`, `demographics`, `detailed_targeting`, `audiences`, `languages`, and `devices` — and nothing is persisted.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.adGroups.estimateReach(request: .init(platform: .meta))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.EstimateReachAdGroupsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.adGroups.<a href="/Sources/Resources/AdGroups/AdGroupsClient.swift">searchTargetingOptions</a>(accountId: String?, platform: SearchTargetingOptionsAdGroupsRequestPlatform, query: String?, types: [SearchTargetingOptionsAdGroupsRequestTypesItem]?, locationTypes: [SearchTargetingOptionsAdGroupsRequestLocationTypesItem]?, country: String?, limit: Int?, requestOptions: RequestOptions?) -> SearchTargetingOptionsAdGroupsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Searches the ad platform's targeting taxonomy for options to target an ad group with. Each result comes back in the exact shape the ad-group body accepts for its `type`, so it can be used in `detailed_targeting`, `regions`, or `languages` as-is. A blank `query` browses the small fixed lists (behaviors, browse demographic categories, languages); interests, work employers, job titles, schools, majors, and locations need a search term.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.adGroups.searchTargetingOptions(platform: .meta)
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Account to search on behalf of. Defaults to the authenticated account.
    
</dd>
</dl>

<dl>
<dd>

**platform:** `SearchTargetingOptionsAdGroupsRequestPlatform` — The ad network whose targeting taxonomy to search.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — The search term. Blank browses the fixed lists; interests, work employers, job titles, schools, majors, and locations return nothing without one.
    
</dd>
</dl>

<dl>
<dd>

**types:** `[SearchTargetingOptionsAdGroupsRequestTypesItem]?` — Kinds of targeting options to search. Defaults to all of them.
    
</dd>
</dl>

<dl>
<dd>

**locationTypes:** `[SearchTargetingOptionsAdGroupsRequestLocationTypesItem]?` — Narrow location results to these kinds of places. Only applies when `types` includes `locations`.
    
</dd>
</dl>

<dl>
<dd>

**country:** `String?` — Narrow location results to one country, as an ISO 3166-1 code such as `US`. Only applies when `types` includes `locations`.
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Int?` — Maximum number of results per requested type.
    
</dd>
</dl>

<dl>
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

Retrieves a single ad group.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

Deletes an ad group.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

Creates copies of the ad group in `duplicating` status and returns them — into its own campaign, or into target_ad_campaign_id (which must belong to the same account and be compatible with the ad group's targeting and goals); each copy transitions to its final status (matching the source's active/paused state) once duplication completes. Poll each returned ad group until it leaves `duplicating` — a copy that could not be completed is deleted and returns 404.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

## AdReports
<details><summary><code>client.adReports.<a href="/Sources/Resources/AdReports/AdReportsClient.swift">retrieve</a>(adCampaignIds: [String]?, adGroupIds: [String]?, adIds: [String]?, breakdown: AdReportBreakdownLevels?, companyId: String?, currency: String?, from: Date, granularity: Granularities?, to: Date, requestOptions: RequestOptions?) -> AdReport</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Performance report for a company, ad campaigns, ad groups, or ads. Always returns aggregate `summary` totals summed across the scope. Set `granularity` to additionally get a time series, or set `breakdown` (`campaign`/`ad_group`/`ad`) to additionally get per-entity rows inside the requested scope. Exactly one of `companyId`, `adCampaignIds`, `adGroupIds`, or `adIds` must be provided.

Required permissions:
 - `ad_campaign:stats:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.adReports.retrieve(
        companyId: "biz_xxxxxxxxxxxxxx",
        from: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        to: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
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

**adCampaignIds:** `[String]?` — Scope the report to these ad campaigns (max 100); stats are summed across them. Mutually exclusive with `companyId`, `adGroupIds`, and `adIds`.
    
</dd>
</dl>

<dl>
<dd>

**adGroupIds:** `[String]?` — Scope the report to these ad groups (max 100); stats are summed across them. Mutually exclusive with `companyId`, `adCampaignIds`, and `adIds`.
    
</dd>
</dl>

<dl>
<dd>

**adIds:** `[String]?` — Scope the report to these ads (max 100); stats are summed across them. Mutually exclusive with `companyId`, `adCampaignIds`, and `adGroupIds`.
    
</dd>
</dl>

<dl>
<dd>

**breakdown:** `AdReportBreakdownLevels?` 
    
</dd>
</dl>

<dl>
<dd>

**companyId:** `String?` — The unique identifier of a company. Mutually exclusive with `adCampaignIds`, `adGroupIds`, and `adIds`. Use with `breakdown` to fan out across every campaign, ad group, or ad in the company without paging.
    
</dd>
</dl>

<dl>
<dd>

**currency:** `String?` — ISO 4217 currency code to report `spend` in. Defaults to the company's ads reporting currency.
    
</dd>
</dl>

<dl>
<dd>

**from:** `Date` — Inclusive start of the reporting window.
    
</dd>
</dl>

<dl>
<dd>

**granularity:** `Granularities?` 
    
</dd>
</dl>

<dl>
<dd>

**to:** `Date` — Inclusive end of the reporting window.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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

**order:** `ListAdsRequestOrder?` — The field to sort by. Defaults to created_at. Stat columns (spend, impressions, …) rank over the stats_from/stats_to window across the whole list, not just the current page. results, cost_per_result and return_on_ad_spend rank by the same Whop pixel-attributed values the response reports.
    
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

**first:** `Int?` — The number of ads to return.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor to fetch the page after (from page_info.end_cursor).
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — The number of ads to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Cursor to fetch the page before (from page_info.start_cursor).
    
</dd>
</dl>

<dl>
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

Creates an ad in an ad group.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

Copies the ad into its own ad group, or into target_ad_group_id (which must belong to the same account and be compatible with the ad). Copies keep the source ad's active/paused state.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

## Affiliates
<details><summary><code>client.affiliates.<a href="/Sources/Resources/Affiliates/AffiliatesClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, companyId: String, direction: Direction?, order: AffiliatesSortableColumns?, query: String?, status: Status?, requestOptions: RequestOptions?) -> ListAffiliatesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of affiliates for the actor in context, with optional filtering by status, search, and sorting.

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
    let client = Whop(token: "<token>")

    _ = try await client.affiliates.list(
        first: 42,
        last: 42,
        companyId: "biz_xxxxxxxxxxxxxx"
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

**companyId:** `String` — The unique identifier of the company to list affiliates for.
    
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

Creates or finds an affiliate for a company and user.

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
    let client = Whop(token: "<token>")

    _ = try await client.affiliates.create(request: .init(
        companyId: "biz_xxxxxxxxxxxxxx",
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
    let client = Whop(token: "<token>")

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

Archives an existing Affiliate

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
    let client = Whop(token: "<token>")

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

Unarchives an existing Affiliate

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
    let client = Whop(token: "<token>")

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
<details><summary><code>client.aiChats.<a href="/Sources/Resources/AiChats/AiChatsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, onlyActiveCrons: Bool?, requestOptions: RequestOptions?) -> ListAiChatsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of AI chat threads for the current authenticated user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

Update an AI chat's title, notification preferences, or associated company context.

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
    let client = Whop(token: "<token>")

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

Lists the API keys of an account or app, newest first. Responses never include the full secret — only its obfuscated form.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**resourceId:** `String` — The account (`biz_`) or app (`app_`) tag to list API keys for.
    
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

**first:** `Int?` — The number of API keys to return (default 20, max 100).
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor; returns API keys after this position.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — The number of API keys to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — A cursor; returns API keys before this position.
    
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

Creates an API key for an account or app. The response is the only place the full `secret_key` is returned — store it immediately. Requires a user session; API keys cannot manage API keys.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

Lists the catalog of permission actions that can be granted to users, apps, and API keys — the source for the dashboard's permission pickers. Small and returned in full on one page.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

**first:** `Int?` — The number of builds to return (default 20, max 100).
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor; returns builds after this position.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — The number of builds to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — A cursor; returns builds before this position.
    
</dd>
</dl>

<dl>
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

Uploads a new build artifact for an app. Upload the file first (POST /files or a direct upload), then reference it here; iOS and Android take a .zip bundle, web takes a JavaScript file or a .zip archive of the hosted site.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

## Apps
<details><summary><code>client.apps.<a href="/Sources/Resources/Apps/AppsClient.swift">list</a>(accountId: String?, appType: ListAppsRequestAppType?, viewType: ListAppsRequestViewType?, verifiedAppsOnly: Bool?, query: String?, order: ListAppsRequestOrder?, direction: ListAppsRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListAppsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists apps on the Whop platform: the app store's live apps, or — with `account_id` and developer access to that account — every app the account owns. Requires authentication, except for the publicly readable lists: `verified_apps_only=true`, and `app_type=website` with no `account_id`, which returns every live deployed website that Whop has not verified — verified templates are the curated `verified_apps_only=true` list instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**verifiedAppsOnly:** `Bool?` — Whether to only return apps verified by Whop. Verified website templates — websites with a published web build — are included, even though websites are otherwise left out of app lists.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — A search string matched against app names.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListAppsRequestOrder?` — The field to sort apps by. Defaults to discoverable_at, showing the most recently published apps first. `template_usage` ranks Whop-verified apps first, then apps with a banner image, then by how many apps were created from each app as a template.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListAppsRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — The number of apps to return (default 20, max 100).
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor; returns apps after this position.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — The number of apps to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — A cursor; returns apps before this position.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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

<details><summary><code>client.apps.<a href="/Sources/Resources/Apps/AppsClient.swift">updatePermissionsApp</a>(appId: String, request: Requests.UpdatePermissionsAppRequest, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the permission requirements for an app

Required permissions:
 - `developer:update_app_authorization`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.apps.updatePermissionsApp(
        appId: "app_id",
        request: .init(requestedPermissions: [
            UpdatePermissionsAppRequestRequestedPermissionsItem(
                action: "action",
                isRequired: true,
                justification: "justification"
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

**appId:** `String` — The ID of the app the permission requirements are being updated for
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdatePermissionsAppRequest` 
    
</dd>
</dl>

<dl>
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

Retrieves an app by ID, claimed route, or proxy domain id. Credential fields (api_key, default_api_key, secrets) render `null` unless the caller has the corresponding developer permission on the owning account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**id:** `String` — App ID (prefixed `app_`), the app's claimed route, or its proxy domain id.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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

**id:** `String` — App ID (prefixed `app_`), the app's claimed route, or its proxy domain id.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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

**id:** `String` — App ID (prefixed `app_`), the app's claimed route, or its proxy domain id.
    
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
    let client = Whop(token: "<token>")

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

Lists a hosted app's server runtime logs, most recent first: console output, uncaught exceptions, and failed-request summaries captured on whop.app hosting. Logs are retained for 7 days.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**first:** `Int?` — The number of log lines to return (max 500).
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor for fetching logs after a previous page.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — A cursor for fetching logs before a later page.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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

Lists uploaded customer-list audiences for an account. Pass `audience_id` to return a specific audience.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**audienceType:** `ListAudiencesRequestAudienceType?` — Filter by audience type: `custom` (uploaded lists) or `lookalike`.
    
</dd>
</dl>

<dl>
<dd>

**sourceType:** `ListAudiencesRequestSourceType?` — Filter by member source: `csv_upload` (uploaded lists) or `people_filter` (automatic audiences built from saved People filters).
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of audiences to return. Defaults to 20; maximum 100.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor for the next page of audiences.
    
</dd>
</dl>

<dl>
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

Creates an audience. Default (`audience_type` omitted or `custom`): creates one audience from an uploaded customer identity CSV file (`name`, `column_mapping`, and `file_id` required) and starts processing it; responds with the audience object. With `filters`: creates an audience from saved People filters (`name` required) — membership is built from the account's People data, and `auto_refresh` decides whether it keeps tracking the filters or keeps whoever matched at creation. With `audience_type: lookalike`: creates a ladder of Meta lookalike audiences from an existing ready custom audience (`source_audience_id`, `count`, and `percentage` required) — `count` equal similarity bands slicing the top `percentage`% (3 audiences at 6% = 0–2%, 2–4%, 4–6%), each returned as its own audience in a `{ data: [...] }` envelope.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
<details><summary><code>client.authorizedUsers.<a href="/Sources/Resources/AuthorizedUsers/AuthorizedUsersClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, companyId: String?, userId: String?, role: AuthorizedUserRoles?, createdBefore: Date?, createdAfter: Date?, requestOptions: RequestOptions?) -> ListAuthorizedUsersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of authorized team members for a company, with optional filtering by user, role, and creation date.

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
    let client = Whop(token: "<token>")

    _ = try await client.authorizedUsers.list(
        first: 42,
        last: 42,
        companyId: "biz_xxxxxxxxxxxxxx",
        userId: "user_xxxxxxxxxxxxx",
        createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
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

**companyId:** `String?` — The unique identifier of the company to list authorized users for.
    
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

Add a new authorized user to a company.

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
    let client = Whop(token: "<token>")

    _ = try await client.authorizedUsers.create(request: .init(
        companyId: "biz_xxxxxxxxxxxxxx",
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
    let client = Whop(token: "<token>")

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

**id:** `String` — The unique identifier of the authorized user to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.authorizedUsers.<a href="/Sources/Resources/AuthorizedUsers/AuthorizedUsersClient.swift">delete</a>(id: String, companyId: String?, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Remove an authorized user from a company.

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
    let client = Whop(token: "<token>")

    _ = try await client.authorizedUsers.delete(
        id: "ausr_xxxxxxxxxxxxx",
        companyId: "biz_xxxxxxxxxxxxxx"
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

**id:** `String` — The ID of the authorized user or user to remove.
    
</dd>
</dl>

<dl>
<dd>

**companyId:** `String?` — The ID of the company the authorized user belongs to. Optional if the authorized user ID is provided.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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

**accountId:** `String?` — Scope the list to this account (`biz_` tag). Requires read access to the account; account API keys may pass their own account or a connected account.
    
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

**first:** `Int?` — Number of bounties to return from the start of the window.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor to paginate forwards from.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of bounties to return from the end of the window.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Cursor to paginate backwards from.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

**first:** `Int?` — Number of submissions to return from the start of the window.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor to paginate forwards from.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of submissions to return from the end of the window.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Cursor to paginate backwards from.
    
</dd>
</dl>

<dl>
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

Creates a submission on a workforce bounty. Include a `deliverable` payload — any combination of links and uploaded files, with at least one of the two — and the submission goes straight to review; create is the only step. For `data_capture` bounties, omit the deliverable: this starts a claimed attempt whose proof accumulates server-side, and the separate submit endpoint sends it to review once complete. Requires a user credential — account API keys cannot author submissions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

Submits a claimed attempt for review. A livestream attempt needs an ended proof stream and can attach an optional `deliverable` — links, files, and a caption in any combination; if the attempt already went to review when its stream ended, the payload attaches to it once, until reviewers start voting. A data capture attempt instead needs enough validated clip time and takes no payload. Only the worker who started the attempt can submit it — account API keys cannot.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
<details><summary><code>client.cardTransactions.<a href="/Sources/Resources/CardTransactions/CardTransactionsClient.swift">list</a>(accountId: String?, transactionIds: [String]?, cardId: [String]?, cardholderId: [String]?, status: ListCardTransactionsRequestStatus?, createdAfter: String?, createdBefore: String?, order: ListCardTransactionsRequestOrder?, direction: ListCardTransactionsRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListCardTransactionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists an account's card transactions, newest first. Defaults to the account the credential belongs to. Covers every card the owner has ever had, including canceled cards and spend that predates a re-application, and team members only see transactions on the cards assigned to them. Pass `transaction_ids` to fetch specific transactions instead of paging for them.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**accountId:** `String?` — The account whose card transactions to list, prefixed `biz_`. Defaults to the credential's account.
    
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

**first:** `Int?` — The number of card transactions to return.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor; returns card transactions after this position.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — The number of card transactions to return, counting back from the end.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — A cursor; returns card transactions before this position.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.cardTransactions.<a href="/Sources/Resources/CardTransactions/CardTransactionsClient.swift">retrieve</a>(id: String, accountId: String?, requestOptions: RequestOptions?) -> CardTransaction</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Fetches a single card transaction by its `citx_` identifier. The owner defaults to the account the credential belongs to.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**accountId:** `String?` — The account that owns the transaction, prefixed `biz_`. Defaults to the credential's account.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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

Issue a virtual card, or apply for card issuing.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

Retrieve a single card.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

Update, freeze, or cancel a card. Updating the card's name, billing address, or limits requires both `payout:account:update` and `company:balance:read`; a card's assigned holder may update their own card's pin and frozen state with any user token.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

## ChatChannels
<details><summary><code>client.chatChannels.<a href="/Sources/Resources/ChatChannels/ChatChannelsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, companyId: String, productId: String?, requestOptions: RequestOptions?) -> ListChatChannelsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of chat channels within a specific company, with optional filtering by product.

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
    let client = Whop(token: "<token>")

    _ = try await client.chatChannels.list(
        first: 42,
        last: 42,
        companyId: "biz_xxxxxxxxxxxxxx",
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

**companyId:** `String` — The unique identifier of the company to list chat channels for.
    
</dd>
</dl>

<dl>
<dd>

**productId:** `String?` — The unique identifier of a product to filter by. When set, only chat channels connected to this product are returned.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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

Update moderation settings for a chat channel, such as who can post, banned words, and media restrictions.

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
    let client = Whop(token: "<token>")

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
<details><summary><code>client.checkoutConfigurations.<a href="/Sources/Resources/CheckoutConfigurations/CheckoutConfigurationsClient.swift">list</a>(accountId: String, planId: String?, createdBefore: String?, createdAfter: String?, order: ListCheckoutConfigurationsRequestOrder?, direction: ListCheckoutConfigurationsRequestDirection?, first: Int?, after: String?, requestOptions: RequestOptions?) -> ListCheckoutConfigurationsResponse</code></summary>
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
    let client = Whop(token: "<token>")

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

**planId:** `String?` — Only return checkout configurations for this plan ID, prefixed `plan_`.
    
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

**first:** `Int?` — Number of checkout configurations to return.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor for the next page of results.
    
</dd>
</dl>

<dl>
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

Creates a reusable checkout configuration for an existing or inline plan.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.checkoutConfigurations.create(request: .init(
        accountId: "biz_xxxxxxxxxxxxxx",
        planId: .value("plan_xxxxxxxxxxxxx")
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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

## Companies
<details><summary><code>client.companies.<a href="/Sources/Resources/Companies/CompaniesClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, parentCompanyId: String?, direction: Direction?, createdBefore: Date?, createdAfter: Date?, requestOptions: RequestOptions?) -> ListCompaniesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of companies. When parent_company_id is provided, lists connected accounts under that platform. When omitted, lists companies the current user has access to.

Required permissions:
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
    let client = Whop(token: "<token>")

    _ = try await client.companies.list(
        first: 42,
        last: 42,
        createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
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

**parentCompanyId:** `String?` — The unique identifier of the parent platform company. When provided, lists connected accounts under that platform. Omit to list the current user's own companies.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `Direction?` 
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Only return companies created before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Only return companies created after this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.companies.<a href="/Sources/Resources/Companies/CompaniesClient.swift">create</a>(request: Requests.CreateCompaniesRequest, requestOptions: RequestOptions?) -> Company</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new company. Pass parent_company_id to create a connected account under a platform, or omit it to create a company for the current user.

Required permissions:
 - `company:create`
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
    let client = Whop(token: "<token>")

    _ = try await client.companies.create(request: .init(title: "title"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateCompaniesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.companies.<a href="/Sources/Resources/Companies/CompaniesClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Company</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing company.

Required permissions:
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
    let client = Whop(token: "<token>")

    _ = try await client.companies.retrieve(id: "biz_xxxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier or route slug of the company.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.companies.<a href="/Sources/Resources/Companies/CompaniesClient.swift">update</a>(id: String, request: Requests.UpdateCompaniesRequest, requestOptions: RequestOptions?) -> Company</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a company's title, description, logo, and other settings.

Required permissions:
 - `company:update`
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
    let client = Whop(token: "<token>")

    _ = try await client.companies.update(
        id: "biz_xxxxxxxxxxxxxx",
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

**id:** `String` — The unique identifier of the company to update.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateCompaniesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.companies.<a href="/Sources/Resources/Companies/CompaniesClient.swift">createApiKey</a>(parentCompanyId: String, request: Requests.CreateApiKeyCompaniesRequest, requestOptions: RequestOptions?) -> CreateApiKeyCompaniesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create an API key for a connected account (child company) owned by a parent company.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.companies.createApiKey(
        parentCompanyId: "parent_company_id",
        request: .init(childCompanyId: "child_company_id")
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

**parentCompanyId:** `String` — The unique identifier of the parent platform company (e.g. 'biz_xxx').
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.CreateApiKeyCompaniesRequest` 
    
</dd>
</dl>

<dl>
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
<details><summary><code>client.companyTokenTransactions.<a href="/Sources/Resources/CompanyTokenTransactions/CompanyTokenTransactionsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, companyId: String, userId: String?, transactionType: CompanyTokenTransactionTypes?, requestOptions: RequestOptions?) -> ListCompanyTokenTransactionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of token transactions for a user or company, depending on the authenticated actor, with optional filtering by user and transaction type.

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
    let client = Whop(token: "<token>")

    _ = try await client.companyTokenTransactions.list(
        first: 42,
        last: 42,
        companyId: "biz_xxxxxxxxxxxxxx",
        userId: "user_xxxxxxxxxxxxx"
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

**companyId:** `String` — The unique identifier of the company to list token transactions for.
    
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

Create a token transaction to add, subtract, or transfer tokens for a member within a company.

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
    let client = Whop(token: "<token>")

    _ = try await client.companyTokenTransactions.create(request: CreateCompanyTokenTransactionsRequest.transfer(
        CreateCompanyTokenTransactionsRequestTransfer(
            amount: 6.9,
            companyId: "biz_xxxxxxxxxxxxxx",
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

Retrieves the details of an existing company token transaction.

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

Returns a paginated list of lesson interactions, filtered by lesson, course, user, or completion status.

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
<details><summary><code>client.courses.<a href="/Sources/Resources/Courses/CoursesClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, experienceId: String?, companyId: String?, requestOptions: RequestOptions?) -> ListCoursesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of courses, filtered by either an experience or a company.

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
    let client = Whop(token: "<token>")

    _ = try await client.courses.list(
        first: 42,
        last: 42,
        experienceId: "exp_xxxxxxxxxxxxxx",
        companyId: "biz_xxxxxxxxxxxxxx"
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

**companyId:** `String?` — The unique identifier of the company to list courses for.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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

Retrieves the details of an existing course.

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

Retrieve the deposit methods for an account, including crypto and bank transfer.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.deposits.create(request: .init(destination: CreateDepositsRequestDestination.string(
        "destination"
    )))
}

try await main()
```
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
    let client = Whop(token: "<token>")

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

**first:** `Int?` — The number of alerts to return (default 20, max 100).
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor; returns alerts after this position.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — The number of alerts to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — A cursor; returns alerts before this position.
    
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
    let client = Whop(token: "<token>")

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
<details><summary><code>client.disputes.<a href="/Sources/Resources/Disputes/DisputesClient.swift">list</a>(accountId: String?, first: Int?, after: String?, last: Int?, before: String?, order: ListDisputesRequestOrder?, direction: ListDisputesRequestDirection?, status: [ListDisputesRequestStatusItem]?, currency: String?, createdBefore: String?, createdAfter: String?, requestOptions: RequestOptions?) -> ListDisputesResponse</code></summary>
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
    let client = Whop(token: "<token>")

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

**first:** `Int?` — The number of disputes to return (default 20, max 100).
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor; returns disputes after this position.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — The number of disputes to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — A cursor; returns disputes before this position.
    
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

**status:** `[ListDisputesRequestStatusItem]?` — Only disputes in these statuses. Repeat the parameter to pass several — one paginated list covers all of them. Covers both chargebacks and inquiries at each stage. A `needs_response` dispute whose evidence deadline has passed reports and filters as `under_review` instead.
    
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

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.disputes.<a href="/Sources/Resources/Disputes/DisputesClient.swift">summary</a>(groups: [SummaryDisputesRequestGroupsItem]?, accountId: String?, status: [SummaryDisputesRequestStatusItem]?, currency: String?, createdBefore: String?, createdAfter: String?, requestOptions: RequestOptions?) -> SummaryDisputesResponse</code></summary>
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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

Edits a dispute's evidence, while it is still editable. Sending it is a separate call.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

<details><summary><code>client.disputes.<a href="/Sources/Resources/Disputes/DisputesClient.swift">submit</a>(id: String, requestOptions: RequestOptions?) -> Dispute</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Sends a dispute's evidence to the payment processor. This is final — it cannot be edited or sent again.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

<details><summary><code>client.disputes.<a href="/Sources/Resources/Disputes/DisputesClient.swift">submitEvidenceDispute</a>(id: String, requestOptions: RequestOptions?) -> Dispute</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Submit a payment dispute to the payment processor for review. Once submitted, no further edits can be made.

Required permissions:
 - `payment:dispute`
 - `plan:basic:read`
 - `access_pass:basic:read`
 - `company:basic:read`
 - `payment:basic:read`
 - `member:email:read`
 - `member:basic:read`
 - `member:phone:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.disputes.submitEvidenceDispute(id: "dspt_xxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the dispute to submit to the payment processor for review.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.disputes.<a href="/Sources/Resources/Disputes/DisputesClient.swift">updateEvidenceDispute</a>(id: String, request: Requests.UpdateEvidenceDisputeRequest, requestOptions: RequestOptions?) -> Dispute</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update a dispute with evidence data to attempt to win the dispute.

Required permissions:
 - `payment:dispute`
 - `plan:basic:read`
 - `access_pass:basic:read`
 - `company:basic:read`
 - `payment:basic:read`
 - `member:email:read`
 - `member:basic:read`
 - `member:phone:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.disputes.updateEvidenceDispute(
        id: "dspt_xxxxxxxxxxxxx",
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

**id:** `String` — The unique identifier of the dispute to update.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateEvidenceDisputeRequest` 
    
</dd>
</dl>

<dl>
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

Replaces the full set of uploaded evidence documents on a dispute, beyond the four fixed evidence slots. Send the files as multipart file parts to upload and attach in one call, or reference files already stored by `id`/`direct_upload_id`. Send every document the packet should carry — up to 10, 10MB each and 25MB in total; an empty list removes them all. Accepted content types: application/pdf, application/json, image/jpeg, image/png, image/webp — any other type is rejected.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
<details><summary><code>client.dmChannels.<a href="/Sources/Resources/DmChannels/DmChannelsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, companyId: String?, requestOptions: RequestOptions?) -> ListDmChannelsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of DM channels for the currently authenticated user, sorted by most recently active.

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
    let client = Whop(token: "<token>")

    _ = try await client.dmChannels.list(
        first: 42,
        last: 42,
        companyId: "biz_xxxxxxxxxxxxxx"
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

**companyId:** `String?` — The unique identifier of a company to filter DM channels by. Only returns channels scoped to this company.
    
</dd>
</dl>

<dl>
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

Create a new DM channel between two or more users, optionally scoped to a specific company. Returns the existing channel if one already exists.

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

Permanently delete a DM channel and all of its messages. Only an admin of the channel can perform this action.

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
    let client = Whop(token: "<token>")

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

Update the settings of an existing DM channel, such as its display name. Only an admin of the channel can perform this action.

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

## Entries
<details><summary><code>client.entries.<a href="/Sources/Resources/Entries/EntriesClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, companyId: String, direction: Direction?, order: EntriesSortableColumns?, productIds: [String]?, planIds: [String]?, statuses: [EntryStatus]?, createdBefore: Date?, createdAfter: Date?, requestOptions: RequestOptions?) -> ListEntriesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of waitlist entries for a company, with optional filtering by product, plan, status, and creation date.

Required permissions:
 - `plan:waitlist:read`
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
    let client = Whop(token: "<token>")

    _ = try await client.entries.list(
        first: 42,
        last: 42,
        companyId: "biz_xxxxxxxxxxxxxx",
        createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
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

**companyId:** `String` — The unique identifier of the company to list waitlist entries for.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `Direction?` 
    
</dd>
</dl>

<dl>
<dd>

**order:** `EntriesSortableColumns?` 
    
</dd>
</dl>

<dl>
<dd>

**productIds:** `[String]?` — Filter entries to only those for specific products.
    
</dd>
</dl>

<dl>
<dd>

**planIds:** `[String]?` — Filter entries to only those for specific plans.
    
</dd>
</dl>

<dl>
<dd>

**statuses:** `[EntryStatus]?` — Filter entries by their current status.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Only return entries created before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Only return entries created after this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.entries.<a href="/Sources/Resources/Entries/EntriesClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Entry</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing waitlist entry.

Required permissions:
 - `plan:waitlist:read`
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
    let client = Whop(token: "<token>")

    _ = try await client.entries.retrieve(id: "entry_xxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the waitlist entry to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.entries.<a href="/Sources/Resources/Entries/EntriesClient.swift">approve</a>(id: String, requestOptions: RequestOptions?) -> ApproveEntriesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Approve a pending waitlist entry, triggering the checkout process to grant the user access to the plan.

Required permissions:
 - `plan:waitlist:manage`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.entries.approve(id: "entry_xxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the waitlist entry to approve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.entries.<a href="/Sources/Resources/Entries/EntriesClient.swift">deny</a>(id: String, requestOptions: RequestOptions?) -> Entry</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Deny a pending waitlist entry, preventing the user from gaining access to the plan.

Required permissions:
 - `plan:waitlist:manage`
 - `plan:basic:read`
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
    let client = Whop(token: "<token>")

    _ = try await client.entries.deny(id: "entry_xxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the waitlist entry to deny.
    
</dd>
</dl>

<dl>
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

Lists identity-linked events, most recent first by default. Pass identifier for one person's journey, or omit it to list events for an account within an explicit time range. Pass direction=asc to read a journey forwards from where it starts. Events are shaped like the POST /events intake: attribution in context, identity in user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**first:** `Int?` — The number of events to return.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor for fetching events after a previous page.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — A cursor for fetching events before a later page.
    
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

**source:** `String?` — Canonical source path, exact or with a trailing :* prefix (whop:<campaign>:*, ext:meta:*, referrer:<domain>, direct). Restricts the list to conversion targets attributed to that source — the debuggability twin of a metric cell's source parameter.
    
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

Tracks a conversion or engagement event for an account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

Returns a fully anonymized feed of recent platform-wide money movement, most recent first: purchases, affiliate commissions, card and ad spend, app revenue, off-platform sales, wallet deposits, card loads, claimed drops, transfers between accounts, and referral bonuses. Items carry only a `type`, the underlying event name, a USD amount, a coarse location under `user`, and a timestamp coarsened to the start of the minute; missing fields are omitted, not nulled. The payload is identical for every caller; no auth is required.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**first:** `Int?` — The number of events to return.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor for fetching events after a previous page.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — A cursor for fetching events before a later page.
    
</dd>
</dl>

<dl>
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

Checks whether the Whop pixel is installed for an account. Recent pixel events count as proof on their own, so an account that has sent data lately comes back installed without a `url`. Pass a `url` and events from that page settle it; conversion events are also read across the hostname because they commonly fire on a later confirmation page. If the requested page hasn't sent any events lately, it is fetched and read for the pixel and conversion events wired on it. `installed` is only true when the pixel was actually seen — in the account's events or in the page.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
<details><summary><code>client.experiences.<a href="/Sources/Resources/Experiences/ExperiencesClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, companyId: String, productId: String?, appId: String?, createdBefore: Date?, createdAfter: Date?, requestOptions: RequestOptions?) -> ListExperiencesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of experiences belonging to a company, with optional filtering by product and app.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.experiences.list(
        first: 42,
        last: 42,
        companyId: "biz_xxxxxxxxxxxxxx",
        productId: "prod_xxxxxxxxxxxxx",
        appId: "app_xxxxxxxxxxxxxx",
        createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
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

**companyId:** `String` — The unique identifier of the company to list experiences for.
    
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
    let client = Whop(token: "<token>")

    _ = try await client.experiences.create(request: .init(
        appId: "app_xxxxxxxxxxxxxx",
        companyId: "biz_xxxxxxxxxxxxxx"
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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

Attach an experience to a product, making it accessible to the product's customers.

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
    let client = Whop(token: "<token>")

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

Detach an experience from a product, removing customer access to it through that product.

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
    let client = Whop(token: "<token>")

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

Duplicates an existing experience. The name will be copied, unless provided. The new experience will be attached to the same products as the original experience.
If duplicating a Forum or Chat experience, the new experience will have the same settings as the original experience, e.g. who can post, who can comment, etc.
No content, e.g. posts, messages, lessons from within the original experience will be copied.


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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

Starts an asynchronous CSV export of a resource for an account. Returns the export in `pending`; poll `GET /exports/{id}` until `download_url` is set.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

## FeeMarkups
<details><summary><code>client.feeMarkups.<a href="/Sources/Resources/FeeMarkups/FeeMarkupsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, companyId: String, requestOptions: RequestOptions?) -> ListFeeMarkupsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of fee markups configured for a company. If the company is a platform account, returns the platform default markups.

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
    let client = Whop(token: "<token>")

    _ = try await client.feeMarkups.list(
        first: 42,
        last: 42,
        companyId: "biz_xxxxxxxxxxxxxx"
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

**companyId:** `String` — The unique identifier of the company to list fee markups for. Pass a platform account identifier to retrieve platform default markups.
    
</dd>
</dl>

<dl>
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

Create or update a fee markup for a company. If a markup for the specified fee type already exists, it will be updated with the new values.

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
    let client = Whop(token: "<token>")

    _ = try await client.feeMarkups.create(request: .init(
        companyId: "biz_xxxxxxxxxxxxxx",
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

Delete a fee markup configuration for a company. This removes the custom fee override and reverts to the parent company's default fees.

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
    let client = Whop(token: "<token>")

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

## Files
<details><summary><code>client.files.<a href="/Sources/Resources/Files/FilesClient.swift">create</a>(request: Requests.CreateFilesRequest, requestOptions: RequestOptions?) -> CreateFilesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create a new file record and receive a presigned URL for uploading content to S3.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.files.create(request: .init(filename: "filename"))
}

try await main()
```
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

Retrieves the details of an existing file.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.files.retrieve(id: "file_xxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the file to retrieve.
    
</dd>
</dl>

<dl>
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
<details><summary><code>client.financialActivity.<a href="/Sources/Resources/FinancialActivity/FinancialActivityClient.swift">list</a>(accountId: String?, userId: String?, includeOwnedAccounts: Bool?, includeResource: Bool?, lineTypes: [ListFinancialActivityRequestLineTypesItem]?, currency: String?, postedAfter: Date?, postedBefore: Date?, availableAfter: CalendarDate?, availableBefore: CalendarDate?, limit: Int?, cursor: String?, requestOptions: RequestOptions?) -> ListFinancialActivityResponse</code></summary>
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
    let client = Whop(token: "<token>")

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

**availableAfter:** `CalendarDate?` — Only include rows whose funds became withdrawable on or after this `YYYY-MM-DD` settlement date (UTC), distinct from posted_at. Requires currency.
    
</dd>
</dl>

<dl>
<dd>

**availableBefore:** `CalendarDate?` — Only include rows whose funds became withdrawable on or before this `YYYY-MM-DD` settlement date (UTC). Set equal to available_after for a single day. Requires currency.
    
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

## Ledgers
<details><summary><code>client.ledgers.<a href="/Sources/Resources/Ledgers/LedgersClient.swift">getFinancialReport</a>(accountId: String, reportType: GetFinancialReportRequestReportType, currency: String?, inCurrency: String?, fromDate: String?, toDate: String?, groupBy: GetFinancialReportRequestGroupBy?, timezone: String?, cumulative: Bool?, scopeAccountId: String?, requestOptions: RequestOptions?) -> GetFinancialReportResponse</code></summary>
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
    let client = Whop(token: "<token>")

    _ = try await client.ledgers.getFinancialReport(
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

**accountId:** `String` — The owning account ID (a biz_ identifier), or `global` for a platform-wide report across all ledger accounts (requires internal admin access).
    
</dd>
</dl>

<dl>
<dd>

**reportType:** `GetFinancialReportRequestReportType` — The type of financial report to generate.
    
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

**fromDate:** `String?` — Start of the report window as an ISO 8601 timestamp (UTC). Required for platform-wide (global) reports.
    
</dd>
</dl>

<dl>
<dd>

**toDate:** `String?` — End of the report window as an ISO 8601 timestamp (UTC). Required for platform-wide (global) reports.
    
</dd>
</dl>

<dl>
<dd>

**groupBy:** `GetFinancialReportRequestGroupBy?` — Grouping granularity for report rows.
    
</dd>
</dl>

<dl>
<dd>

**timezone:** `String?` — IANA timezone (for example `America/New_York`) used to bucket report periods and to interpret calendar-day boundaries for balance snapshots. Defaults to UTC. from_date/to_date remain exact instants regardless of this setting.
    
</dd>
</dl>

<dl>
<dd>

**cumulative:** `Bool?` — Platform-wide (global) reports only: when true, return cumulative balances as of to_date (all history, no lower bound) instead of activity within the period.
    
</dd>
</dl>

<dl>
<dd>

**scopeAccountId:** `String?` — Platform-wide (global) reports only: narrow the report to ledger lines on the ledger account owned by this account ID (a biz_ identifier). Ignored unless account_id is `global`.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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

Create a new forum post or comment within an experience. Supports text content, attachments, polls, paywalling, and pinning. Pass experience_id 'public' with a company_id to post to a company's public forum.

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
<details><summary><code>client.forums.<a href="/Sources/Resources/Forums/ForumsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, companyId: String, productId: String?, requestOptions: RequestOptions?) -> ListForumsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of forums within a specific company, with optional filtering by product.

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
    let client = Whop(token: "<token>")

    _ = try await client.forums.list(
        first: 42,
        last: 42,
        companyId: "biz_xxxxxxxxxxxxxx",
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

**companyId:** `String` — The unique identifier of the company to list forums for.
    
</dd>
</dl>

<dl>
<dd>

**productId:** `String?` — The unique identifier of a product to filter by. When set, only forums connected to this product are returned.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
<details><summary><code>client.identityProfiles.<a href="/Sources/Resources/IdentityProfiles/IdentityProfilesClient.swift">listIdentityProfile</a>(after: String?, before: String?, first: Int?, last: Int?, companyId: String?, profileType: IdentityProfileKinds?, status: IdentityProfileStatuses?, requestOptions: RequestOptions?) -> ListIdentityProfileResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of identity profiles. When company_id is provided, lists IPs currently linked to that company's ledger. When omitted, lists IPs linked to any ledger the actor can read (including child companies under a parent).

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
    let client = Whop(token: "<token>")

    _ = try await client.identityProfiles.listIdentityProfile(
        first: 42,
        last: 42,
        companyId: "biz_xxxxxxxxxxxxxx"
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

**companyId:** `String?` — The unique identifier of the company to filter to. When omitted, returns IPs across all ledgers the actor can read.
    
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
    let client = Whop(token: "<token>")

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

Unlinks an IdentityProfile from a LedgerAccount (flips the matching link to is_current=false).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
<details><summary><code>client.invoices.<a href="/Sources/Resources/Invoices/InvoicesClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, companyId: String?, direction: Direction?, productIds: [String]?, collectionMethods: [InvoiceCollectionMethods]?, statuses: [InvoiceStatuses]?, order: InvoicesSortableColumns?, createdBefore: Date?, createdAfter: Date?, requestOptions: RequestOptions?) -> ListInvoicesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of invoices for a company, with optional filtering by product, status, collection method, and creation date.

Required permissions:
 - `invoice:basic:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.invoices.list(
        first: 42,
        last: 42,
        companyId: "biz_xxxxxxxxxxxxxx",
        createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
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

**companyId:** `String?` — The unique identifier of the company to list invoices for.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `Direction?` 
    
</dd>
</dl>

<dl>
<dd>

**productIds:** `[String]?` — Filter invoices to only those associated with these specific product identifiers.
    
</dd>
</dl>

<dl>
<dd>

**collectionMethods:** `[InvoiceCollectionMethods]?` — Filter invoices by their collection method.
    
</dd>
</dl>

<dl>
<dd>

**statuses:** `[InvoiceStatuses]?` — Filter invoices by their current status.
    
</dd>
</dl>

<dl>
<dd>

**order:** `InvoicesSortableColumns?` 
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Only return invoices created before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Only return invoices created after this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.invoices.<a href="/Sources/Resources/Invoices/InvoicesClient.swift">create</a>(request: CreateInvoicesRequest, requestOptions: RequestOptions?) -> Invoice</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Create an invoice for a customer. The invoice can be charged automatically using a stored payment method, or sent to the customer for manual payment.

Required permissions:
 - `invoice:create`
 - `member:email:read`
 - `member:basic:read`
 - `payment:basic:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.invoices.create(request: CreateInvoicesRequest.createInvoicesRequestProduct(
        CreateInvoicesRequestProduct(
            collectionMethod: .sendInvoice,
            companyId: "biz_xxxxxxxxxxxxxx",
            plan: CreateInvoicesRequestProductPlan(

            ),
            product: CreateInvoicesRequestProductProduct(
                title: "title"
            )
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

**request:** `CreateInvoicesRequest` — Parameters for CreateInvoice
    
</dd>
</dl>

<dl>
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

Retrieves the details of an existing invoice.

Required permissions:
 - `invoice:basic:read`
 - `member:email:read`
 - `member:basic:read`
 - `payment:basic:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.invoices.retrieve(id: "inv_xxxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the invoice, or a secure token.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.invoices.<a href="/Sources/Resources/Invoices/InvoicesClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Delete a draft invoice.

Required permissions:
 - `invoice:update`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.invoices.delete(id: "inv_xxxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the draft invoice to delete.
    
</dd>
</dl>

<dl>
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

Update a draft invoice's details.

Required permissions:
 - `invoice:update`
 - `member:email:read`
 - `member:basic:read`
 - `payment:basic:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.invoices.update(
        id: "inv_xxxxxxxxxxxxxx",
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

**id:** `String` — The unique identifier of the invoice to update.
    
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

<details><summary><code>client.invoices.<a href="/Sources/Resources/Invoices/InvoicesClient.swift">markPaid</a>(id: String, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Mark an open invoice as paid when payment was collected outside of Whop.

Required permissions:
 - `invoice:update`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.invoices.markPaid(id: "inv_xxxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the invoice to mark as paid.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.invoices.<a href="/Sources/Resources/Invoices/InvoicesClient.swift">markUncollectible</a>(id: String, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Mark an open invoice as uncollectible when payment is not expected.

Required permissions:
 - `invoice:update`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.invoices.markUncollectible(id: "inv_xxxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the invoice to mark as uncollectible.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.invoices.<a href="/Sources/Resources/Invoices/InvoicesClient.swift">resend</a>(id: String, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Resend the notification email for an existing invoice to the customer.

Required permissions:
 - `invoice:update`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.invoices.resend(id: "inv_xxxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the invoice to resend.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.invoices.<a href="/Sources/Resources/Invoices/InvoicesClient.swift">void</a>(id: String, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Void an open invoice so it can no longer be paid. Voiding is permanent and cannot be undone.

Required permissions:
 - `invoice:update`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.invoices.void(id: "inv_xxxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the invoice to void.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Leads
<details><summary><code>client.leads.<a href="/Sources/Resources/Leads/LeadsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, companyId: String, createdAfter: Date?, createdBefore: Date?, productIds: [String]?, requestOptions: RequestOptions?) -> ListLeadsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of leads for a company, with optional filtering by product and creation date.

Required permissions:
 - `lead:basic:read`
 - `member:email:read`
 - `access_pass:basic:read`
 - `member:basic:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.leads.list(
        first: 42,
        last: 42,
        companyId: "biz_xxxxxxxxxxxxxx",
        createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
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

**companyId:** `String` — The unique identifier of the company to list leads for.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Only return leads created after this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Only return leads created before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**productIds:** `[String]?` — Filter leads to only those associated with these specific product identifiers.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.leads.<a href="/Sources/Resources/Leads/LeadsClient.swift">create</a>(request: Requests.CreateLeadsRequest, requestOptions: RequestOptions?) -> Lead</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Record a new lead for a company, capturing a potential customer's interest in a specific product.

Required permissions:
 - `lead:manage`
 - `member:email:read`
 - `access_pass:basic:read`
 - `member:basic:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.leads.create(request: .init(companyId: "biz_xxxxxxxxxxxxxx"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateLeadsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.leads.<a href="/Sources/Resources/Leads/LeadsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Lead</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing lead.

Required permissions:
 - `lead:basic:read`
 - `member:email:read`
 - `access_pass:basic:read`
 - `member:basic:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.leads.retrieve(id: "lead_xxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the lead to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.leads.<a href="/Sources/Resources/Leads/LeadsClient.swift">update</a>(id: String, request: Requests.UpdateLeadsRequest, requestOptions: RequestOptions?) -> Lead</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Update the metadata or referrer information on an existing lead record.

Required permissions:
 - `lead:manage`
 - `member:email:read`
 - `access_pass:basic:read`
 - `member:basic:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.leads.update(
        id: "lead_xxxxxxxxxxxxx",
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

**id:** `String` — The unique identifier of the lead to update, starting with 'lead_'.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateLeadsRequest` 
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
<details><summary><code>client.members.<a href="/Sources/Resources/Members/MembersClient.swift">list</a>(accountId: String?, accessLevel: ListMembersRequestAccessLevel?, status: ListMembersRequestStatus?, query: String?, createdAfter: String?, createdBefore: String?, order: ListMembersRequestOrder?, direction: ListMembersRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListMembersResponse</code></summary>
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
    let client = Whop(token: "<token>")

    _ = try await client.members.list()
}

try await main()
```
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

**order:** `ListMembersRequestOrder?` — Sort field.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListMembersRequestDirection?` — Sort direction.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of members to return from the start of the window.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor to paginate forwards from.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of members to return from the end of the window.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Cursor to paginate backwards from.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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

## Memberships
<details><summary><code>client.memberships.<a href="/Sources/Resources/Memberships/MembershipsClient.swift">list</a>(accountId: String?, userId: String?, status: ListMembershipsRequestStatus?, productId: String?, planId: String?, createdAfter: String?, createdBefore: String?, order: ListMembershipsRequestOrder?, direction: ListMembershipsRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListMembershipsResponse</code></summary>
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
    let client = Whop(token: "<token>")

    _ = try await client.memberships.list()
}

try await main()
```
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

**status:** `ListMembershipsRequestStatus?` — Filter by billing state. `canceling` matches active memberships set to cancel at period end; `paused` matches memberships with payment collection paused.
    
</dd>
</dl>

<dl>
<dd>

**productId:** `String?` — Filter to memberships of this product (`prod_` tag). Repeat as product_ids[] for several.
    
</dd>
</dl>

<dl>
<dd>

**planId:** `String?` — Filter to memberships of this plan (`plan_` tag). Repeat as plan_ids[] for several.
    
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

**first:** `Int?` — Number of memberships to return from the start of the window.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor to paginate forwards from.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of memberships to return from the end of the window.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Cursor to paginate backwards from.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.memberships.<a href="/Sources/Resources/Memberships/MembershipsClient.swift">invite</a>(request: InviteMembershipsRequestBody, requestOptions: RequestOptions?) -> InviteMembershipsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Sends an email inviting one recipient to join the account through a free plan. Identify the recipient by exactly one of `user_id` or `email`. The invitation is bound to that recipient; after signing in, accepting it immediately grants the membership without checkout. This Experimental endpoint is available only to accounts enabled for membership invitations.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.memberships.invite(request: InviteMembershipsRequestBody.inviteMembershipsRequestBodyUserId(
        InviteMembershipsRequestBodyUserId(
            planId: "plan_xxxxxxxxxxxxxx",
            userId: "user_xxxxxxxxxxxxxx"
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

**request:** `InviteMembershipsRequestBody` 
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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

Updates a membership: merge metadata key-value pairs, or toggle `cancel_at_period_end` — `true` schedules the cancellation for the end of the current billing period, `false` reverses a pending one.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.memberships.update(
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

<details><summary><code>client.memberships.<a href="/Sources/Resources/Memberships/MembershipsClient.swift">addFreeDaysMembership</a>(id: String, request: Requests.AddFreeDaysMembershipRequest, requestOptions: RequestOptions?) -> Membership</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Add free days to extend a membership's current billing period, expiration date, or Stripe trial.

Required permissions:
 - `member:manage`
 - `member:email:read`
 - `member:basic:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.memberships.addFreeDaysMembership(
        id: "mem_xxxxxxxxxxxxxx",
        request: .init(freeDays: 42)
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

**id:** `String` — The unique identifier of the membership.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.AddFreeDaysMembershipRequest` 
    
</dd>
</dl>

<dl>
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

Cancels a membership. Pass `cancel_at_period_end: true` to stop auto-renewal and keep access until the current billing period ends. Omit it (or pass `false`) to revoke access immediately. Buyers cannot cancel buy-now-pay-later (`splitit`, `sezzle`) or non-trial split-pay memberships.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

<details><summary><code>client.memberships.<a href="/Sources/Resources/Memberships/MembershipsClient.swift">resyncAccessMembership</a>(id: String, requestOptions: RequestOptions?) -> Membership</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Re-run access fulfillment for a membership. Recomputes the member's content access on Whop, re-validates their Discord link (re-adding them to the server and re-assigning roles if needed), and re-fulfills TradingView indicator access. Telegram access is invite-based and cannot be resynced here. The outcome is written to the membership's logs.

Required permissions:
 - `membership:resync_access`
 - `member:email:read`
 - `member:basic:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.memberships.resyncAccessMembership(id: "mem_xxxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the membership to resync access for.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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

<details><summary><code>client.memberships.<a href="/Sources/Resources/Memberships/MembershipsClient.swift">uncancelMembership</a>(id: String, requestOptions: RequestOptions?) -> Membership</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Reverse a pending cancellation for a membership that was scheduled to cancel at period end.

Required permissions:
 - `member:manage`
 - `member:email:read`
 - `member:basic:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.memberships.uncancelMembership(id: "mem_xxxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the membership to uncancel.
    
</dd>
</dl>

<dl>
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
<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, channelId: String, direction: Direction?, requestOptions: RequestOptions?) -> ListMessagesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of messages within a specific experience chat, DM, or group chat channel, sorted by creation time.

Required permissions (one of):
 - `chat:read`
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
    let client = Whop(token: "<token>")

    _ = try await client.messages.list(
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

**channelId:** `String` — The unique identifier of the channel or experience to list messages for.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `Direction?` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">create</a>(request: Requests.CreateMessagesRequest, requestOptions: RequestOptions?) -> Message</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Send a new message in an experience chat, DM, or group chat channel. Supports text content, attachments, polls, and replies.

Required permissions (one of):
 - `chat:message:create`
 - `dms:message:manage`
 - `livestream:chat:write`
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
    let client = Whop(token: "<token>")

    _ = try await client.messages.create(request: .init(
        channelId: "channel_id",
        content: "content"
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

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Message</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing message.

Required permissions (one of):
 - `chat:read`
 - `dms:read`
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
    let client = Whop(token: "<token>")

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

**id:** `String` — The unique identifier of the message to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> Bool</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Permanently delete a message from an experience chat, DM, or group chat channel. Only the message author or a channel admin can delete a message.

Required permissions (one of):
 - `chat:message:create` and `chat:read`
 - `dms:message:manage` and `dms:read`
 - `livestream:chat:write` and `livestream:chat:read`
 - `support_chat:message:create` and `support_chat:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**id:** `String` — The unique identifier of the message to delete.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.messages.<a href="/Sources/Resources/Messages/MessagesClient.swift">update</a>(id: String, request: Requests.UpdateMessagesRequest, requestOptions: RequestOptions?) -> Message</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Edit the content, attachments, or pinned status of an existing message in an experience chat, DM, or group chat channel.

Required permissions (one of):
 - `chat:message:create`
 - `dms:message:manage`
 - `livestream:chat:write`
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
    let client = Whop(token: "<token>")

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

**id:** `String` — The unique identifier of the message to update.
    
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

## Notifications
<details><summary><code>client.notifications.<a href="/Sources/Resources/Notifications/NotificationsClient.swift">list</a>(unread: Bool?, experienceId: String?, accountId: String?, mentions: Bool?, first: Int?, after: String?, requestOptions: RequestOptions?) -> ListNotificationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the authenticated user's notifications, newest first. Requires a user credential — an account API key has no notification feed. Without filters the feed spans every experience the user belongs to plus the teams they are a member of.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**first:** `Int?` — The number of notifications to return (default 20, max 100).
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor (a notification `id` from a previous page); returns notifications older than it.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

Marks the authenticated user's notifications as read: one experience's (`experience_id`) or everything (`all: true`) — exactly one of the two. Requires a user credential. Responds with the refreshed badge rows for the affected scope.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

Retrieves a single notification by id — either an `id` returned by List Notifications, or the ephemeral id delivered with a push/websocket event. Requires a user credential.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**id:** `String` — A notification `id` from List Notifications, or the id delivered with a push/websocket event.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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

<details><summary><code>client.partners.<a href="/Sources/Resources/Partners/PartnersClient.swift">leaderboard</a>(period: LeaderboardPartnersRequestPeriod?, requestOptions: RequestOptions?) -> LeaderboardPartnersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Ranks referrers by partner business earnings — all-time by default, or over the current day, month, year, or trailing 30 days. Authentication is optional: authenticated callers also get their own standing, anonymous callers get the rankings alone.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

<details><summary><code>client.partners.<a href="/Sources/Resources/Partners/PartnersClient.swift">referredUsers</a>(hasBusinesses: Bool?, hasEarningBusinesses: Bool?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ReferredUsersPartnersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the users the caller referred onto Whop (newest first), each with the second-tier earnings the caller has made from that user's businesses.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**first:** `Int?` — Number of referred users to return from the start of the window.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor to fetch the page after (from page_info.end_cursor).
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of referred users to return from the end of the window.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Cursor to fetch the page before (from page_info.start_cursor).
    
</dd>
</dl>

<dl>
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

Lists payment method domains. Without `account_id`, returns the caller's own domains and those of every connected account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**accountId:** `String?` — Only domains registered for this account (`biz_` tag). Defaults to the caller's account plus its connected accounts.
    
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

**first:** `Int?` — Number of domains to return from the start of the window.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor to paginate forwards from.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of domains to return from the end of the window.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Cursor to paginate backwards from.
    
</dd>
</dl>

<dl>
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

Registers a hostname with the wallet provider and attempts verification inline. Returns `verified` when the provider fetched the domain-association file (for Apple Pay, `/.well-known/apple-developer-merchantid-domain-association`), or `pending` when it could not — host the file, then retry with the verify endpoint.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.paymentMethodDomains.create(request: .init(hostname: "pending.shinetime.example"))
}

try await main()
```
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

Retrieves a payment method domain to check its verification status.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**id:** `String` — The unique identifier of the payment method domain, prefixed `pmd_`.
    
</dd>
</dl>

<dl>
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

Unregisters a payment method domain so its wallet payment methods stop rendering there.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**id:** `String` — The unique identifier of the payment method domain, prefixed `pmd_`.
    
</dd>
</dl>

<dl>
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

Re-attempts provider verification of a pending domain once the association file is hosted. Fails with a `bad_request` explaining what to fix; verifying an already `verified` domain is a no-op.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**id:** `String` — The unique identifier of the payment method domain, prefixed `pmd_`.
    
</dd>
</dl>

<dl>
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
<details><summary><code>client.paymentMethods.<a href="/Sources/Resources/PaymentMethods/PaymentMethodsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, memberId: String?, companyId: String?, direction: Direction?, createdBefore: Date?, createdAfter: Date?, futureUsage: FutureUsageTypes?, paymentMethodTypes: [PaymentMethodTypes]?, cardBrands: [CardBrands]?, cardFundingTypes: [CardFundingTypes]?, hasPayerDocument: Bool?, expired: Bool?, broken: Bool?, requestOptions: RequestOptions?) -> ListPaymentMethodsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of payment methods for a member or company, or for the authenticated user when neither is given, with optional filtering by creation date. A payment method is a stored representation of how a customer intends to pay, such as a card, bank account, or digital wallet.

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
    let client = Whop(token: "<token>")

    _ = try await client.paymentMethods.list(
        first: 42,
        last: 42,
        memberId: "mber_xxxxxxxxxxxxx",
        companyId: "biz_xxxxxxxxxxxxxx",
        createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
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

**memberId:** `String?` — The unique identifier of the member to list payment methods for. Omit this and company_id to list your own saved payment methods.
    
</dd>
</dl>

<dl>
<dd>

**companyId:** `String?` — The unique identifier of the company. Provide either this or member_id, not both. Omit both to address your own saved payment methods.
    
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

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.paymentMethods.<a href="/Sources/Resources/PaymentMethods/PaymentMethodsClient.swift">retrieve</a>(id: String, companyId: String?, memberId: String?, requestOptions: RequestOptions?) -> PaymentMethod</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing payment method. Addresses a member's wallet when member_id or company_id is given, otherwise your own.

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
    let client = Whop(token: "<token>")

    _ = try await client.paymentMethods.retrieve(
        id: "payt_xxxxxxxxxxxxx",
        companyId: "biz_xxxxxxxxxxxxxx",
        memberId: "mber_xxxxxxxxxxxxx"
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

**companyId:** `String?` — The unique identifier of the company. Provide either this or member_id, not both. Omit both to address your own saved payment methods.
    
</dd>
</dl>

<dl>
<dd>

**memberId:** `String?` — The unique identifier of the member. Provide either this or company_id, not both. Omit both to address your own saved payment methods.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.paymentMethods.<a href="/Sources/Resources/PaymentMethods/PaymentMethodsClient.swift">deletePaymentMethod</a>(id: String, companyId: String?, memberId: String?, requestOptions: RequestOptions?) -> Bool</code></summary>
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
    let client = Whop(token: "<token>")

    _ = try await client.paymentMethods.deletePaymentMethod(
        id: "payt_xxxxxxxxxxxxx",
        companyId: "biz_xxxxxxxxxxxxxx",
        memberId: "mber_xxxxxxxxxxxxx"
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

**companyId:** `String?` — The unique identifier of the company. Provide either this or member_id, not both. Omit both to address your own saved payment methods.
    
</dd>
</dl>

<dl>
<dd>

**memberId:** `String?` — The unique identifier of the member. Provide either this or company_id, not both. Omit both to address your own saved payment methods.
    
</dd>
</dl>

<dl>
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
<details><summary><code>client.payments.<a href="/Sources/Resources/Payments/PaymentsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, companyId: String?, direction: Direction?, order: ReceiptV2Order?, productIds: [String]?, billingReasons: [BillingReasons]?, currencies: [Currencies]?, planIds: [String]?, statuses: [ReceiptStatus]?, substatuses: [FriendlyReceiptStatus]?, includeFree: Bool?, createdBefore: Date?, createdAfter: Date?, updatedBefore: Date?, updatedAfter: Date?, query: String?, checkoutConfigurationIds: [String]?, requestOptions: RequestOptions?) -> ListPaymentsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of payments for the actor in context, with optional filtering by product, plan, status, billing reason, currency, and creation date.

Required permissions:
 - `payment:basic:read`
 - `plan:basic:read`
 - `access_pass:basic:read`
 - `member:email:read`
 - `member:basic:read`
 - `member:phone:read`
 - `promo_code:basic:read`
 - `shipment:basic:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.payments.list(
        first: 42,
        last: 42,
        companyId: "biz_xxxxxxxxxxxxxx",
        createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        updatedBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        updatedAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
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

**companyId:** `String?` — The unique identifier of the company to list payments for.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `Direction?` 
    
</dd>
</dl>

<dl>
<dd>

**order:** `ReceiptV2Order?` 
    
</dd>
</dl>

<dl>
<dd>

**productIds:** `[String]?` — Filter payments to only those associated with these specific product identifiers.
    
</dd>
</dl>

<dl>
<dd>

**billingReasons:** `[BillingReasons]?` — Filter payments by their billing reason.
    
</dd>
</dl>

<dl>
<dd>

**currencies:** `[Currencies]?` — Filter payments by their currency code.
    
</dd>
</dl>

<dl>
<dd>

**planIds:** `[String]?` — Filter payments to only those associated with these specific plan identifiers.
    
</dd>
</dl>

<dl>
<dd>

**statuses:** `[ReceiptStatus]?` — Filter payments by their current status.
    
</dd>
</dl>

<dl>
<dd>

**substatuses:** `[FriendlyReceiptStatus]?` — Filter payments by their current substatus for more granular filtering.
    
</dd>
</dl>

<dl>
<dd>

**includeFree:** `Bool?` — Whether to include payments with a zero amount.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Only return payments created before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Only return payments created after this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**updatedBefore:** `Date?` — Only return payments last updated before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**updatedAfter:** `Date?` — Only return payments last updated after this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String?` — Search payments by user ID, membership ID, user email, name, or username. Email filtering requires the member:email:read permission.
    
</dd>
</dl>

<dl>
<dd>

**checkoutConfigurationIds:** `[String]?` — Only return payments from these checkout configurations.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payments.<a href="/Sources/Resources/Payments/PaymentsClient.swift">create</a>(request: CreatePaymentsRequest, requestOptions: RequestOptions?) -> CreatePaymentsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Charge an existing member off-session using one of their stored payment methods. You can provide an existing plan, or create a new one in-line. This endpoint will respond with a payment object immediately, but the payment is processed asynchronously in the background. Use webhooks to be notified when the payment succeeds or fails.

Required permissions:
 - `payment:charge`
 - `plan:create`
 - `access_pass:create`
 - `access_pass:update`
 - `plan:basic:read`
 - `access_pass:basic:read`
 - `member:email:read`
 - `member:basic:read`
 - `member:phone:read`
 - `promo_code:basic:read`
 - `shipment:basic:read`
 - `payment:dispute:read`
 - `payment:resolution_center_case:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.payments.create(request: CreatePaymentsRequest.createPaymentsRequestZero(
        CreatePaymentsRequestZero(
            companyId: "biz_xxxxxxxxxxxxxx",
            confirmationToken: "confirmation_token",
            plan: CreatePaymentsRequestZeroPlan(
                currency: .usd
            )
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

**request:** `CreatePaymentsRequest` — Parameters for CreatePayment
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payments.<a href="/Sources/Resources/Payments/PaymentsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> RetrievePaymentsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing payment.

Required permissions:
 - `payment:basic:read`
 - `plan:basic:read`
 - `access_pass:basic:read`
 - `member:email:read`
 - `member:basic:read`
 - `member:phone:read`
 - `promo_code:basic:read`
 - `shipment:basic:read`
 - `payment:dispute:read`
 - `payment:resolution_center_case:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.payments.retrieve(id: "pay_xxxxxxxxxxxxxx")
}

try await main()
```
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

<details><summary><code>client.payments.<a href="/Sources/Resources/Payments/PaymentsClient.swift">listFees</a>(id: String, after: String?, before: String?, first: Int?, last: Int?, requestOptions: RequestOptions?) -> ListFeesPaymentsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the list of fees associated with a specific payment, including platform fees and processing fees.

Required permissions:
 - `payment:basic:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.payments.listFees(
        id: "pay_xxxxxxxxxxxxxx",
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

**id:** `String` — The unique identifier of the payment to list fees for.
    
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

<details><summary><code>client.payments.<a href="/Sources/Resources/Payments/PaymentsClient.swift">refund</a>(id: String, request: Requests.RefundPaymentsRequest, requestOptions: RequestOptions?) -> Payment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Issue a full or partial refund for a payment. The refund is processed through the original payment processor and the membership status is updated accordingly.

Required permissions:
 - `payment:manage`
 - `plan:basic:read`
 - `access_pass:basic:read`
 - `member:email:read`
 - `member:basic:read`
 - `member:phone:read`
 - `promo_code:basic:read`
 - `shipment:basic:read`
 - `payment:dispute:read`
 - `payment:resolution_center_case:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.payments.refund(
        id: "pay_xxxxxxxxxxxxxx",
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

**id:** `String` — The unique identifier of the payment to refund.
    
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

Retry a failed or pending payment. This re-attempts the charge using the original payment method and plan details.

Required permissions:
 - `payment:manage`
 - `plan:basic:read`
 - `access_pass:basic:read`
 - `member:email:read`
 - `member:basic:read`
 - `member:phone:read`
 - `promo_code:basic:read`
 - `shipment:basic:read`
 - `payment:dispute:read`
 - `payment:resolution_center_case:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.payments.retry(id: "pay_xxxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the payment to retry.
    
</dd>
</dl>

<dl>
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

Void a payment that has not yet been settled. Voiding cancels the payment before it is captured by the payment processor.

Required permissions:
 - `payment:manage`
 - `plan:basic:read`
 - `access_pass:basic:read`
 - `member:email:read`
 - `member:basic:read`
 - `member:phone:read`
 - `promo_code:basic:read`
 - `shipment:basic:read`
 - `payment:dispute:read`
 - `payment:resolution_center_case:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.payments.void(id: "pay_xxxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the payment to void.
    
</dd>
</dl>

<dl>
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

Changes where the buyer lands after completing an off-site step, up until they return. Accepts either a secret key or the payment's own `client_secret`, so the surface that knows the final destination can set it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

<details><summary><code>client.payments.<a href="/Sources/Resources/Payments/PaymentsClient.swift">retrieveStatus</a>(paymentId: String, requestOptions: RequestOptions?) -> PaymentStatus</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves how far a payment has got and what the buyer must do next, if anything. A payment is collected in the background, so poll this rather than reading the create response. Accepts either a secret key or the payment's own `client_secret`, so the surface collecting the payment can poll it directly.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
<details><summary><code>client.payoutMethods.<a href="/Sources/Resources/PayoutMethods/PayoutMethodsClient.swift">listPayoutMethod</a>(after: String?, before: String?, first: Int?, last: Int?, companyId: String, requestOptions: RequestOptions?) -> ListPayoutMethodResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a list of active payout methods configured for a company, ordered by most recently created.

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
    let client = Whop(token: "<token>")

    _ = try await client.payoutMethods.listPayoutMethod(
        first: 42,
        last: 42,
        companyId: "biz_xxxxxxxxxxxxxx"
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

**companyId:** `String` — The unique identifier of the company to list payout methods for.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

**source:** `ListPayoutsRequestSource?` — Filter by how the payout was created. Payouts created before source tracking or through internal tooling carry no source and never match.
    
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

**first:** `Int?` — Number of payouts to return from the start of the window.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor to fetch the page after (from page_info.end_cursor).
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of payouts to return from the end of the window.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Cursor to fetch the page before (from page_info.start_cursor).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.payouts.<a href="/Sources/Resources/Payouts/PayoutsClient.swift">create</a>(request: CreatePayoutsRequestBody, requestOptions: RequestOptions?) -> CreatePayoutsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Sends money from an account or user balance to a saved payout method for that owner.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.payouts.create(request: CreatePayoutsRequestBody.jsonValue(
        .object([
            "key": .string("value")
        ])
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

**request:** `CreatePayoutsRequestBody` 
    
</dd>
</dl>

<dl>
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

Fetches one payout by its `wdrl_` ID, or by the `cofr_` conversion request ID a stablecoin payout carries as `payout_request_id` — both ids answer with the same payout object.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
<details><summary><code>client.people.<a href="/Sources/Resources/People/PeopleClient.swift">list</a>(accountId: String?, query: String?, source: [String]?, attributionModel: ListPeopleRequestAttributionModel?, eventName: [String]?, customEvent: String?, eventFrom: Date?, eventTo: Date?, audienceId: String?, userId: String?, email: String?, phone: String?, country: String?, hasPurchased: Bool?, contactable: Bool?, firstSeenWithinDays: Int?, lastSeenWithinDays: Int?, firstSeenAfter: Date?, firstSeenBefore: Date?, lastSeenAfter: Date?, lastSeenBefore: Date?, first: Int?, after: String?, before: String?, order: ListPeopleRequestOrder?, direction: ListPeopleRequestDirection?, requestOptions: RequestOptions?) -> ListPeopleResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the people (visitors and customers) of an account: the identity-linked person profiles aggregated from every pixel, payment, and platform event — identities, purchases and LTV, geo/device profile, traffic sources, and first/last marketing touches.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**eventFrom:** `Date?` — With event_to plus an event or source filter, switches to exact-population mode: person ids are resolved and paginated on the events side within this window (the same query the people metric counts), then hydrated per page.
    
</dd>
</dl>

<dl>
<dd>

**eventTo:** `Date?` — The inclusive end of the event window for exact-population mode.
    
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

**country:** `String?` — Only include people whose most recent visit came from this ISO 3166-1 alpha-2 country code.
    
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

**first:** `Int?` — The number of people to return (default 100, max 100).
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor for fetching people after a previous page.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — A cursor for fetching people before a later page.
    
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

Retrieves one person for an account. The identifier can be a person ID (prefixed `prsn_`), a user ID (prefixed `user_`), an email address, or a phone number — merged people resolve to the surviving profile.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**id:** `String` — The person ID, user ID, email address, or phone number to look up.
    
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
    let client = Whop(token: "<token>")

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
<details><summary><code>client.plans.<a href="/Sources/Resources/Plans/PlansClient.swift">list</a>(accountId: String, direction: ListPlansRequestDirection?, order: ListPlansRequestOrder?, releaseMethods: [String]?, visibilities: [String]?, planTypes: [String]?, productIds: [String]?, createdBefore: String?, createdAfter: String?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListPlansResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of plans belonging to an account, with optional filtering by visibility, type, release method, and product.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.plans.list(
        accountId: "account_id",
        releaseMethods: [
            "buy_now"
        ],
        visibilities: [
            "visible"
        ],
        planTypes: [
            "renewal"
        ],
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

**accountId:** `String` — The unique identifier of the account to list plans for.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListPlansRequestDirection?` — The sort direction for results. Defaults to descending.
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListPlansRequestOrder?` — The field to sort results by. Defaults to created_at.
    
</dd>
</dl>

<dl>
<dd>

**releaseMethods:** `[String]?` — Filter to only plans matching these release methods.
    
</dd>
</dl>

<dl>
<dd>

**visibilities:** `[String]?` — Filter to only plans matching these visibility states.
    
</dd>
</dl>

<dl>
<dd>

**planTypes:** `[String]?` — Filter to only plans matching these billing types.
    
</dd>
</dl>

<dl>
<dd>

**productIds:** `[String]?` — Filter to only plans belonging to these product identifiers.
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `String?` — Only return plans created before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `String?` — Only return plans created after this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — The number of plans to return (default and max 100).
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor; returns plans after this position.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — The number of plans to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — A cursor; returns plans before this position.
    
</dd>
</dl>

<dl>
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

Create a new pricing plan for a product. The plan defines the billing interval, price, and availability for customers.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

Retrieves the details of an existing plan.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**id:** `String` — Plan ID, prefixed `plan_`.
    
</dd>
</dl>

<dl>
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

Permanently delete a plan from a product. Existing memberships on this plan will not be affected.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**id:** `String` — Plan ID, prefixed `plan_`.
    
</dd>
</dl>

<dl>
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

Update a plan's pricing, billing interval, visibility, stock, and other settings.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**id:** `String` — Plan ID, prefixed `plan_`.
    
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

Previews tax for a plan before checkout, based on the buyer's location.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.plans.calculateTax(
        id: "id",
        request: .init(address: .value(CalculateTaxPlansRequestAddress(
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

**id:** `String` — Plan ID, prefixed `plan_`.
    
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

## Products
<details><summary><code>client.products.<a href="/Sources/Resources/Products/ProductsClient.swift">list</a>(accountId: String, visibilities: [String]?, accessPassTypes: [String]?, labels: [String]?, direction: ListProductsRequestDirection?, order: String?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListProductsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of products belonging to an account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.products.list(
        accountId: "account_id",
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

**accountId:** `String` — The unique identifier of the account to list products for.
    
</dd>
</dl>

<dl>
<dd>

**visibilities:** `[String]?` — Filter to only products matching these visibility states.
    
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

**order:** `String?` — The field to sort results by. Defaults to created_at.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — The number of products to return (default and max 100).
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor; returns products after this position.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — The number of products to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — A cursor; returns products before this position.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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

Retrieves the details of an existing product. This endpoint is publicly accessible.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

Submits a product to the whop.com marketplace for review. The product moves to `pending_review`; a Whop reviewer approves it before it goes live.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
<details><summary><code>client.promoCodes.<a href="/Sources/Resources/PromoCodes/PromoCodesClient.swift">list</a>(accountId: String, status: ListPromoCodesRequestStatus?, productIds: [String]?, planIds: [String]?, createdBefore: Date?, createdAfter: Date?, order: ListPromoCodesRequestOrder?, direction: ListPromoCodesRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListPromoCodesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists promo codes for an account with cursor pagination, filters, and sorting.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.promoCodes.list(
        accountId: "account_id",
        productIds: [
            "prod_xxxxxxxxxxxxxx"
        ],
        planIds: [
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

**planIds:** `[String]?` — Only promo codes scoped to these plan IDs.
    
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

**first:** `Int?` — Number of promo codes to return from the start of the window.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor to paginate forwards from.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of promo codes to return from the end of the window.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Cursor to paginate backwards from.
    
</dd>
</dl>

<dl>
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

Creates a promo code for an account. First-party sessions may attach an affiliate.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

## Recommended Actions
<details><summary><code>client.recommendedActions.<a href="/Sources/Resources/RecommendedActions/RecommendedActionsClient.swift">list</a>(accountId: String?, requestOptions: RequestOptions?) -> ListRecommendedActionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the recommended action chains for an account — short sequences of actions (create a product, price it, publish it) the account should run next, gated on what it already has.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.recommendedActions.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String?` — Account ID, prefixed `biz_`. Defaults to the API key's own account.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.recommendedActions.<a href="/Sources/Resources/RecommendedActions/RecommendedActionsClient.swift">retrieve</a>(id: String, accountId: String?, requestOptions: RequestOptions?) -> AccountRecommendedActionChain</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a recommended action chain by id, including chains that have already been run. Seeded chains are reconstructed from their hard-coded chain; generated chains are read from the account's stored chain, with each step's filled-in input.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.recommendedActions.retrieve(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Chain ID from the list endpoint, e.g. `rac_seed_start_selling_9f2c1a7b04`.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Account ID, prefixed `biz_`. Defaults to the API key's own account.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.recommendedActions.<a href="/Sources/Resources/RecommendedActions/RecommendedActionsClient.swift">run</a>(id: String, accountId: String?, requestOptions: RequestOptions?) -> RunRecommendedActionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Records that the caller ran a recommended action chain. Nothing is executed server-side yet — the client follows the chain's step CTAs itself; this writes the `recommended_action_chain.executed` analytics event.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.recommendedActions.run(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Chain ID from the list endpoint, e.g. `rac_seed_start_selling_9f2c1a7b04`.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Account ID, prefixed `biz_`. Defaults to the API key's own account.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.recommendedActions.<a href="/Sources/Resources/RecommendedActions/RecommendedActionsClient.swift">listExecutions</a>(id: String, accountId: String?, requestOptions: RequestOptions?) -> ListExecutionsRecommendedActionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the per-step record of a recommended action chain the server ran — one entry per step in position order, each carrying its current status and, once the step completed, the API response it produced. A chain that was never run server-side returns an empty list.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.recommendedActions.listExecutions(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — Chain ID from the list endpoint.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — Account ID, prefixed `biz_`. Defaults to the API key's own account.
    
</dd>
</dl>

<dl>
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
<details><summary><code>client.refunds.<a href="/Sources/Resources/Refunds/RefundsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, paymentId: String?, companyId: String?, userId: String?, direction: Direction?, createdBefore: Date?, createdAfter: Date?, requestOptions: RequestOptions?) -> ListRefundsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of refunds, with optional filtering by payment, company, user, and creation date.

Required permissions:
 - `payment:basic:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.refunds.list(
        first: 42,
        last: 42,
        paymentId: "pay_xxxxxxxxxxxxxx",
        companyId: "biz_xxxxxxxxxxxxxx",
        userId: "user_xxxxxxxxxxxxx",
        createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
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

**paymentId:** `String?` — Filter refunds to only those associated with this specific payment.
    
</dd>
</dl>

<dl>
<dd>

**companyId:** `String?` — Filter refunds to only those belonging to this company.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — Filter refunds to only those associated with this specific user.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `Direction?` 
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Only return refunds created before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Only return refunds created after this timestamp.
    
</dd>
</dl>

<dl>
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

Retrieves the details of an existing refund.

Required permissions:
 - `payment:basic:read`
 - `plan:basic:read`
 - `access_pass:basic:read`
 - `member:email:read`
 - `member:basic:read`
 - `member:phone:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.refunds.retrieve(id: "rf_xxxxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the refund.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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

**first:** `Int?` — The number of cases to return (default 20, max 100).
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor; returns cases after this position.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — The number of cases to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — A cursor; returns cases before this position.
    
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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

Appeals a decision, as the customer, on a case that closed in the merchant's favor. Escalates the case to Whop for platform review. A case can be appealed once.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

**first:** `Int?` — The number of events to return (default 20, max 100).
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor; returns events after this position.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — The number of events to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — A cursor; returns events before this position.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

## Reviews
<details><summary><code>client.reviews.<a href="/Sources/Resources/Reviews/ReviewsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, productId: String, minStars: Int?, maxStars: Int?, createdBefore: Date?, createdAfter: Date?, requestOptions: RequestOptions?) -> ListReviewsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of customer reviews for a specific product, with optional filtering by star rating and creation date.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.reviews.list(
        first: 42,
        last: 42,
        productId: "prod_xxxxxxxxxxxxx",
        minStars: 42,
        maxStars: 42,
        createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
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

**productId:** `String` — The unique identifier of the product to list reviews for.
    
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

Retrieves the details of an existing review.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**id:** `String` — The unique identifier of the review to retrieve.
    
</dd>
</dl>

<dl>
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
<details><summary><code>client.setupIntents.<a href="/Sources/Resources/SetupIntents/SetupIntentsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, companyId: String, direction: Direction?, createdBefore: Date?, createdAfter: Date?, requestOptions: RequestOptions?) -> ListSetupIntentsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of setup intents for a company, with optional filtering by creation date. A setup intent securely collects and stores a member's payment method for future use without charging them immediately.

Required permissions:
 - `payment:setup_intent:read`
 - `member:basic:read`
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
    let client = Whop(token: "<token>")

    _ = try await client.setupIntents.list(
        first: 42,
        last: 42,
        companyId: "biz_xxxxxxxxxxxxxx",
        createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
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

**companyId:** `String` — The unique identifier of the company to list setup intents for.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `Direction?` 
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Only return setup intents created before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Only return setup intents created after this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.setupIntents.<a href="/Sources/Resources/SetupIntents/SetupIntentsClient.swift">create</a>(request: CreateSetupIntentsRequest, requestOptions: RequestOptions?) -> CreateSetupIntentsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Save a buyer's payment method for later without charging it. Provide a confirmation token for a method the buyer just supplied, or an existing payment method to re-verify. The buyer may still have a step to complete — 3D Secure, a hosted enrollment, linking a bank account — so poll the setup intent's status endpoint for what to do next.

Required permissions:
 - `payment:charge`
 - `member:basic:read`
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
    let client = Whop(token: "<token>")

    _ = try await client.setupIntents.create(request: CreateSetupIntentsRequest.createSetupIntentsRequestConfirmationToken(
        CreateSetupIntentsRequestConfirmationToken(
            companyId: "biz_xxxxxxxxxxxxxx",
            confirmationToken: "ctok_xxxxxxxxxxxxxx"
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

**request:** `CreateSetupIntentsRequest` — Parameters for CreateSetupIntent
    
</dd>
</dl>

<dl>
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

Retrieves the details of an existing setup intent.

Required permissions:
 - `payment:setup_intent:read`
 - `member:basic:read`
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
    let client = Whop(token: "<token>")

    _ = try await client.setupIntents.retrieve(id: "sint_xxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the setup intent.
    
</dd>
</dl>

<dl>
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

Changes where the buyer lands after completing an off-site step, up until they return. Accepts either a secret key or the setup's own `client_secret`, so the surface that knows the final destination can set it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

<details><summary><code>client.setupIntents.<a href="/Sources/Resources/SetupIntents/SetupIntentsClient.swift">retrieveStatus</a>(setupIntentId: String, requestOptions: RequestOptions?) -> SetupStatus</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves how far a setup has got and what the buyer must do next, if anything. Collection runs in the background, so poll this rather than reading the create response. Accepts either a secret key or the setup's own `client_secret`, so the surface collecting the payment method can poll it directly.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

Returns a paginated list of shipments for an account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**first:** `Int?` — The number of shipments to return.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor; returns shipments after this position.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — The number of shipments to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — A cursor; returns shipments before this position.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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

<details><summary><code>client.shipments.<a href="/Sources/Resources/Shipments/ShipmentsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Shipment</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a shipment by its id, or by the payment id it fulfills.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
<details><summary><code>client.socialAccounts.<a href="/Sources/Resources/SocialAccounts/SocialAccountsClient.swift">list</a>(accountId: String?, userId: String?, platform: ListSocialAccountsRequestPlatform?, verified: Bool?, scopes: [ListSocialAccountsRequestScopesItem]?, first: Int?, after: String?, last: Int?, before: String?, order: ListSocialAccountsRequestOrder?, direction: ListSocialAccountsRequestDirection?, requestOptions: RequestOptions?) -> ListSocialAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the social accounts linked to an account or user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**accountId:** `String?` — The Account that the social accounts are connected to. Provide either this or user_id.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — The User that the social accounts are connected to. Provide either this or account_id.
    
</dd>
</dl>

<dl>
<dd>

**platform:** `ListSocialAccountsRequestPlatform?` — Only return social accounts for the platform that is specified.
    
</dd>
</dl>

<dl>
<dd>

**verified:** `Bool?` — Only return social accounts that are verified on the platform.
    
</dd>
</dl>

<dl>
<dd>

**scopes:** `[ListSocialAccountsRequestScopesItem]?` — Only return social accounts that have these scopes.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — The number of social accounts to return.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor to fetch the page after (from page_info.end_cursor).
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — The number of social accounts to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Cursor to fetch the page before (from page_info.start_cursor).
    
</dd>
</dl>

<dl>
<dd>

**order:** `ListSocialAccountsRequestOrder?` — The field to sort social accounts by.
    
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

<details><summary><code>client.socialAccounts.<a href="/Sources/Resources/SocialAccounts/SocialAccountsClient.swift">create</a>(request: Requests.CreateSocialAccountsRequest, requestOptions: RequestOptions?) -> SocialAccount</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates or returns a Whop-managed Facebook page for an account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.socialAccounts.create(request: .init(platform: .facebook))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateSocialAccountsRequest` 
    
</dd>
</dl>

<dl>
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

Starts an OAuth connection flow and returns an authorize_url where the user can connect a social account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.socialAccounts.connect(request: .init(platform: .metaBusiness))
}

try await main()
```
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

Disconnects a social account from an account or user without deleting the underlying platform account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**accountId:** `String?` — The Account that the social account is connected to. Provide either this or user_id.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — The User that the social account is connected to. Provide either this or account_id.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.socialAccounts.<a href="/Sources/Resources/SocialAccounts/SocialAccountsClient.swift">leadForms</a>(id: String, accountId: String, requestOptions: RequestOptions?) -> LeadFormsSocialAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the active lead (instant) forms that already exist on a connected Facebook page, so an ad can reuse one as its `lead_gen_form_id` instead of authoring a new form. Every active form comes back in a single response — the list is not paginated.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.socialAccounts.leadForms(
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

**id:** `String` — The social account (a sacc_ identifier) whose lead forms to list.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String` — The Account (a biz_ identifier) the social account is connected to.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.socialAccounts.<a href="/Sources/Resources/SocialAccounts/SocialAccountsClient.swift">posts</a>(id: String, accountId: String, postId: String?, first: Int?, after: String?, requestOptions: RequestOptions?) -> PostsSocialAccountsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the existing posts of a connected Facebook page, Instagram account, or TikTok account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.socialAccounts.posts(
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

**id:** `String` — The social account (a sacc_ identifier) whose posts to list.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String` — The Account (a biz_ identifier) the social account is connected to.
    
</dd>
</dl>

<dl>
<dd>

**postId:** `String?` — Return only the single post with this platform id, instead of the full list.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — The number of posts to return.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor to fetch the page after (from page_info.end_cursor).
    
</dd>
</dl>

<dl>
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

Lists every metric you can query, with its unit and the properties you can filter or break it down by.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

<details><summary><code>client.stats.<a href="/Sources/Resources/Stats/StatsClient.swift">describeStats</a>(resource: String?, companyId: String?, userId: String?, requestOptions: RequestOptions?) -> DescribeStatsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Describe available stats schema. Without resource returns root nodes and metrics. With resource returns node columns, associations, and available metrics.

Required permissions:
 - `stats:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.stats.describeStats(
        companyId: "biz_xxxxxxxxxxxxxx",
        userId: "user_xxxxxxxxxxxxx"
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

**resource:** `String?` — Resource path using : as separator (e.g., 'receipts', 'payments:membership', 'receipts:gross_revenue').
    
</dd>
</dl>

<dl>
<dd>

**companyId:** `String?` — Scope query to a specific company.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — Scope query to a specific user.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.stats.<a href="/Sources/Resources/Stats/StatsClient.swift">metricStats</a>(resource: String, granularity: String?, breakdowns: [String]?, filters: [String: JSONValue]?, timeZone: String?, from: Date?, to: Date?, companyId: String?, userId: String?, requestOptions: RequestOptions?) -> MetricStatsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Query an aggregated metric. Returns data grouped by period with optional breakdowns.

Required permissions:
 - `stats:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.stats.metricStats(
        resource: "resource",
        from: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        to: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        companyId: "biz_xxxxxxxxxxxxxx",
        userId: "user_xxxxxxxxxxxxx"
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

**resource:** `String` — Metric resource using : as separator (e.g., 'receipts:gross_revenue', 'members:new_users').
    
</dd>
</dl>

<dl>
<dd>

**granularity:** `String?` — Time granularity (daily, weekly, monthly).
    
</dd>
</dl>

<dl>
<dd>

**breakdowns:** `[String]?` — Columns to break down the metric by.
    
</dd>
</dl>

<dl>
<dd>

**filters:** `[String: JSONValue]?` — Key-value pairs to filter the data.
    
</dd>
</dl>

<dl>
<dd>

**timeZone:** `String?` — IANA timezone for period bucketing (e.g. 'America/New_York'). Defaults to UTC. Only applies to ClickHouse metrics.
    
</dd>
</dl>

<dl>
<dd>

**from:** `Date?` — Start of time range (unix timestamp).
    
</dd>
</dl>

<dl>
<dd>

**to:** `Date?` — End of time range (unix timestamp).
    
</dd>
</dl>

<dl>
<dd>

**companyId:** `String?` — Scope query to a specific company.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — Scope query to a specific user.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.stats.<a href="/Sources/Resources/Stats/StatsClient.swift">rawStats</a>(resource: String, from: Date?, to: Date?, limit: Int?, cursor: String?, sort: String?, sortDirection: Direction?, companyId: String?, userId: String?, requestOptions: RequestOptions?) -> RawStatsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Query raw data from a resource. Returns paginated rows with all columns.

Required permissions:
 - `stats:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.stats.rawStats(
        resource: "resource",
        from: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        to: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        limit: 42,
        companyId: "biz_xxxxxxxxxxxxxx",
        userId: "user_xxxxxxxxxxxxx"
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

**resource:** `String` — Resource path using : as separator (e.g., 'members', 'payments:membership').
    
</dd>
</dl>

<dl>
<dd>

**from:** `Date?` — Start of time range (unix timestamp).
    
</dd>
</dl>

<dl>
<dd>

**to:** `Date?` — End of time range (unix timestamp).
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Int?` — Number of records to return (max 10000).
    
</dd>
</dl>

<dl>
<dd>

**cursor:** `String?` — Pagination cursor for next page.
    
</dd>
</dl>

<dl>
<dd>

**sort:** `String?` — Column to sort by.
    
</dd>
</dl>

<dl>
<dd>

**sortDirection:** `Direction?` 
    
</dd>
</dl>

<dl>
<dd>

**companyId:** `String?` — Scope query to a specific company.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — Scope query to a specific user.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.stats.<a href="/Sources/Resources/Stats/StatsClient.swift">retrieve</a>(metric: String, accountId: String?, userId: String?, from: String, to: String, interval: RetrieveStatsRequestInterval?, breakdownBy: String?, convertTo: String?, currency: String?, timeZone: String?, paymentMethod: String?, cardNetwork: String?, disputeReason: String?, source: String?, hostname: String?, page: String?, deviceType: String?, countryCode: String?, eventName: String?, eventType: RetrieveStatsRequestEventType?, customName: String?, segment: String?, category: String?, merchant: String?, feeType: String?, product: String?, status: String?, accessLevel: String?, mostRecentAction: String?, referredUserId: String?, adCampaignIds: [String]?, adGroupIds: [String]?, adIds: [String]?, snapshotWindow: RetrieveStatsRequestSnapshotWindow?, event: String?, requestOptions: RequestOptions?) -> RetrieveStatsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a metric as a time series of points for an account or user over a time range. The `market_prices` metric is public and requires no authentication.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**metric:** `String` — The metric to retrieve, for example net_revenue. Use GET /stats to see every metric key. The metric sets the unit and the properties you can filter or break down by.
    
</dd>
</dl>

<dl>
<dd>

**accountId:** `String?` — The account this query concerns, for example biz_AbC123.
    
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

**to:** `String` — End of the range — a date (YYYY-MM-DD), expanded to the end of that day, or an ISO 8601 timestamp (for example 2026-07-17T16:37:00Z), used exactly.
    
</dd>
</dl>

<dl>
<dd>

**interval:** `RetrieveStatsRequestInterval?` — How wide each point is. Defaults to day. Snapshot metrics are day-only.
    
</dd>
</dl>

<dl>
<dd>

**breakdownBy:** `String?` — Split the metric out by one of its properties — each point gets a breakdown array. For example breakdown_by=currency returns an entry for usd, an entry for eur, and so on.
    
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

**hostname:** `String?` — Filter traffic metrics to one website hostname, for example shop.example.com. Pair with breakdown_by=hostname to split by website.
    
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

**snapshotWindow:** `RetrieveStatsRequestSnapshotWindow?` — Window used by a snapshot metric. Ordinary snapshots accept 30d as their trailing activity window. Cohorted dispute metrics accept 7d or 28d as the sales-transaction pool; their attribution window is fixed in the metric name. Each metric lists its accepted values in the catalog.
    
</dd>
</dl>

<dl>
<dd>

**event:** `String?` — Filter the events metric to one or more full event names, for example payment.completed or pixel.lead. Comma-separate several to break the metric down by each event. Available on metrics that list event.
    
</dd>
</dl>

<dl>
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
<details><summary><code>client.supportChannels.<a href="/Sources/Resources/SupportChannels/SupportChannelsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, companyId: String?, view: SupportChannelView?, open: Bool?, direction: Direction?, order: MessageChannelOrder?, requestOptions: RequestOptions?) -> ListSupportChannelsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of support channels for a specific company, with optional filtering by resolution status and custom sorting.

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
    let client = Whop(token: "<token>")

    _ = try await client.supportChannels.list(
        first: 42,
        last: 42,
        companyId: "biz_xxxxxxxxxxxxxx"
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

**companyId:** `String?` — The unique identifier of the company to list support channels for. Includes channels of child companies. When omitted, returns support channels across all companies the user has access to.
    
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

Open a new support channel between a company team member and a customer. Returns the existing channel if one already exists for that user.

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
    let client = Whop(token: "<token>")

    _ = try await client.supportChannels.create(request: .init(
        companyId: "biz_xxxxxxxxxxxxxx",
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
    let client = Whop(token: "<token>")

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
<details><summary><code>client.swaps.<a href="/Sources/Resources/Swaps/SwapsClient.swift">list</a>(accountId: String, requestOptions: RequestOptions?) -> ListSwapsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the account's completed or pending swaps — currently just the latest one.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.swaps.list(accountId: "account_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Business or user account ID (biz_* / user_*).
    
</dd>
</dl>

<dl>
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

Swaps one token for another from the account's wallet, or converts between fiat currencies in the account's ledger at the mid-market rate. Crypto swaps finish in the background — check the swap for its status.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.swaps.create(request: .init(
        accountId: "biz_xxxxxxxxxxxxxx",
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

Previews the price of a swap. Fiat pairs quote the in-ledger mid-market conversion — the same rate creating the swap fills at. No funds move and nothing is saved.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

Retrieves a single swap and its status.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
<details><summary><code>client.teamMembers.<a href="/Sources/Resources/TeamMembers/TeamMembersClient.swift">list</a>(accountId: String, status: ListTeamMembersRequestStatus?, userId: String?, role: ListTeamMembersRequestRole?, createdBefore: String?, createdAfter: String?, order: ListTeamMembersRequestOrder?, direction: ListTeamMembersRequestDirection?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListTeamMembersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists an account's team members, including pending invites (`status: "pending"`, `ausri_` ids; `user` is `null` for invites sent to an email with no Whop account yet). For accepted members, `email` requires the `company:authorized_user:email:read` scope and is `null` otherwise. Listing `role=workforce` is also allowed with the `bounty:create` scope.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.teamMembers.list(accountId: "account_id")
}

try await main()
```
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

**status:** `ListTeamMembersRequestStatus?` — Only return members with this status: `joined` (accepted members) or `pending` (pending invites). Both are returned by default.
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` — Only return the membership for this user ID, prefixed `user_`.
    
</dd>
</dl>

<dl>
<dd>

**role:** `ListTeamMembersRequestRole?` — Only return members with this role. `custom` matches members on a dashboard-managed custom role.
    
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

**order:** `ListTeamMembersRequestOrder?` — Field used to sort members.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `ListTeamMembersRequestDirection?` — Sort direction. Defaults to `desc`.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of members to return. Defaults to 20; maximum 100.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor for the next page of members.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of members to return from the end of the window.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Cursor to paginate backwards from.
    
</dd>
</dl>

<dl>
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

Adds a member to an account's team with a system role. Identify them by exactly one of `user_id` or `email`. If the person has not yet accepted — or the email does not belong to a Whop account yet — an invitation is sent instead and the response is `202` with `{ "object": "team_member_invite", "invitation_sent": true }`. If they already have a pending invite, the request fails with a `400`. Custom roles cannot be granted via the API. Granting the `workforce` role is also allowed with the `bounty:create` scope.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.teamMembers.create(request: .init(
        accountId: "biz_xxxxxxxxxxxxxx",
        role: .owner
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

Retrieves a team member by ID. `email` requires the `company:authorized_user:email:read` scope and is `null` otherwise.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**id:** `String` — Team member ID — `ausr_` for accepted members, `ausri_` for pending invites.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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

**id:** `String` — Team member ID — `ausr_` for accepted members, `ausri_` for pending invites.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

    _ = try await client.teamMembers.update(
        id: "id",
        request: .init(role: .owner)
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

**id:** `String` — Team member ID — `ausr_` for accepted members, `ausri_` for pending invites.
    
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

## Topups
<details><summary><code>client.topups.<a href="/Sources/Resources/Topups/TopupsClient.swift">create</a>(request: Requests.CreateTopupsRequest, requestOptions: RequestOptions?) -> Topup</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Add funds to a company's platform balance by charging a stored payment method. Top-ups have no fees or taxes and do not count as revenue.

Required permissions:
 - `payment:charge`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.topups.create(request: .init(
        amount: 6.9,
        companyId: "biz_xxxxxxxxxxxxxx",
        currency: .usd,
        paymentMethodId: "pmt_xxxxxxxxxxxxxx"
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

**request:** `Requests.CreateTopupsRequest` 
    
</dd>
</dl>

<dl>
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

Lists an account's transfers.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**originId:** `String?` — Filter to transfers sent from this account. Provide this or destination_id.
    
</dd>
</dl>

<dl>
<dd>

**destinationId:** `String?` — Filter to transfers received by this account. Provide this or origin_id.
    
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

**first:** `Int?` — Number of transfers to return from the start of the window.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor to fetch the page after (from page_info.end_cursor).
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of transfers to return from the end of the window.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Cursor to fetch the page before (from page_info.start_cursor).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.transfers.<a href="/Sources/Resources/Transfers/TransfersClient.swift">create</a>(request: Requests.CreateTransfersRequest, requestOptions: RequestOptions?) -> CreateTransfersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Moves money between accounts, or into a claim link anyone with the URL can redeem.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.transfers.create(request: .init(
        amount: 25,
        originId: "biz_xxxxxxxxxxxxxx"
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

**request:** `Requests.CreateTransfersRequest` 
    
</dd>
</dl>

<dl>
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

Lists the people and accounts you can send money to.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**query:** `String?` — Search anyone on Whop by name or username, plus your own accounts by name or ID. Omit it to get the team around the balance, the people you follow, and your own accounts. The list is the same whether the balance belongs to a company or to you. Searching from a `biz_` origin additionally requires the member:basic:read scope. A credential scoped to a single company is the exception to the search itself: it only ever sees that company's own people. Complete email addresses return no matches.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of recipients per page. Search queries preserve the dashboard's 20-result maximum.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor to fetch the page after (from page_info.end_cursor).
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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
<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">list</a>(query: String?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListUsersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Search for users by name or username, ranked by social proximity to the authenticated user. Returns the user's most recently followed users when no query is given.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**query:** `String?` — A search term to filter users by name or username.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — The number of users to return (max 50).
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor; returns users after this position.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — The number of users to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — A cursor; returns users before this position.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">me</a>(accountId: String?, includeBalanceHistory: Bool?, from: String?, to: String?, interval: MeUsersRequestInterval?, timeZone: String?, requestOptions: RequestOptions?) -> User</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the authenticated user — the self view of the user object. Same shape as `GET /users/{id}`, with the self-only fields populated: `email` (email-read scope), `staff` (Whop staff only, staff-read scope), `balance` and `earnings_usd` (balance-read scope), the opt-in `balance_history`, and every linked social account.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**accountId:** `String?` — When set, returns your account-specific profile overrides for this account.
    
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

Updates the authenticated user's global profile, or their profile override for an account when account_id is given. Not available to API keys.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">retrieve</a>(id: String, accountId: String?, includeBalanceHistory: Bool?, from: String?, to: String?, interval: RetrieveUsersRequestInterval?, timeZone: String?, requestOptions: RequestOptions?) -> User</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a user by `user_` tag or username, or the authenticated user with the reserved id `me`. Profiles include linked social accounts — reading your own profile returns every linked account, other profiles only what is public on Whop (the primary Discord and the X account). The self-only fields are populated only when the id is `me`: `email` (email-read scope), `staff` (Whop staff only, staff-read scope), `balance` and `earnings_usd` (balance-read scope), and the opt-in `balance_history`. They are always `null` when addressing a user by tag or username.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**accountId:** `String?` — When set, returns the user's account-specific profile overrides for this account.
    
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

Updates a user, addressed by `user_` tag, username, or the reserved id `me` for the authenticated user. A user token updates their own global profile; an API key updates the user's account-specific profile override (account_id required).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

Lists the recommended actions computed for the user: personal suggestions (e.g. start a business or become an affiliate) pooled with the highest-impact actions across the accounts the user owns. Business actions are tagged with their `account_id`/`account_name`; personal actions leave those `null`. Self-only: `id` must be `me` or the authenticated user's own tag/username.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

## Verifications
<details><summary><code>client.verifications.<a href="/Sources/Resources/Verifications/VerificationsClient.swift">list</a>(accountId: String, order: ListVerificationsRequestOrder?, direction: ListVerificationsRequestDirection?, requestOptions: RequestOptions?) -> ListVerificationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns verifications for an account, including their status and any required actions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.verifications.list(accountId: "account_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — Account or user ID whose verifications you want to list. Use a `biz_` account ID, or the caller's `user_` ID for personal verifications.
    
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

<details><summary><code>client.verifications.<a href="/Sources/Resources/Verifications/VerificationsClient.swift">create</a>(accountId: String, request: CreateVerificationsRequestBody, requestOptions: RequestOptions?) -> CreateVerificationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Starts a hosted verification session for an account or user, or returns the active session when one already exists. Any fields you include in the request body are used to prefill the session. Send `documents` (with `document_type`) to instead verify the person from identity documents included in this request — no hosted session involved. Send `share_token` to reuse a verification another Sumsub account has already completed for this person, instead of verifying them again. If the account already has an `approved` verification the request is rejected; unlink it first to start a new one.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.verifications.create(
        accountId: "account_id",
        request: CreateVerificationsRequestBody.individual(
            CreateVerificationsRequestBodyIndividual(

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

**accountId:** `String` — Account or user ID whose identity you want to verify. Use a `biz_` account ID for account verifications, or the caller's `user_` ID for personal verification.
    
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

Returns verifications for an account, including their status and any required actions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

Updates editable profile details or submits answers for items returned in `requested_information`. Once a verification is `approved` its profile details are locked and can no longer be edited.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

## Webhooks
<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">list</a>(accountId: String, appId: String?, includeAppWebhooks: Bool?, hasFailures: Bool?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListWebhooksResponse</code></summary>
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
    let client = Whop(token: "<token>")

    _ = try await client.webhooks.list(accountId: "account_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**accountId:** `String` — The unique identifier of the account to list webhooks for.
    
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

**first:** `Int?` — The number of webhooks to return (default 20, max 100).
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor; returns webhooks after this position.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — The number of webhooks to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — A cursor; returns webhooks before this position.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

Permanently deletes a webhook endpoint. Returns `true` on success, matching the legacy proxy response.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">listDeliveries</a>(id: String, first: Int?, after: String?, requestOptions: RequestOptions?) -> ListDeliveriesWebhooksResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of delivery attempts for a webhook, ordered by most recent first. Includes the request payload, response body, response code, and timing for each attempt.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.webhooks.listDeliveries(id: "id")
}

try await main()
```
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

**first:** `Int?` — The number of deliveries to return (default 50, max 100).
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor; returns deliveries after this position.
    
</dd>
</dl>

<dl>
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

Re-sends the exact payload of a past delivery to the webhook's current URL and returns the delivery result. By default the replay keeps the original `webhook-id`, so consumers that deduplicate on it can drop events they already processed. Pass `regenerate_id` to re-send under a freshly generated `webhook-id` instead, so a deduplicating consumer processes the replay as a new message. Only available for enabled webhooks on API version v1; deliveries are retained for 30 days.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

Re-sends the webhook's past deliveries within a time window, optionally limited to specific events or to messages whose most recent delivery attempt failed. Fire and forget: nothing about the replay is stored, and each re-send appears as a new entry in the webhook's delivery log. Each matching message is re-sent once, by default with its original `webhook-id`, so consumers that deduplicate are unaffected; pass `regenerate_ids` to re-send under freshly generated ids instead. Only available for enabled webhooks on API version v1; deliveries are retained for 30 days.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">deliveriesWebhook</a>(webhookId: String, after: String?, before: String?, first: Int?, last: Int?, requestOptions: RequestOptions?) -> DeliveriesWebhookResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of delivery attempts for a webhook, ordered by most recent first. Includes the request payload, response body, response code, and timing for each attempt.

Required permissions:
 - `developer:manage_webhook`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.webhooks.deliveriesWebhook(
        webhookId: "webhook_id",
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

**webhookId:** `String` — The unique identifier of the webhook to list deliveries for.
    
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

## Withdrawals
<details><summary><code>client.withdrawals.<a href="/Sources/Resources/Withdrawals/WithdrawalsClient.swift">list</a>(after: String?, before: String?, first: Int?, last: Int?, companyId: String, direction: Direction?, createdBefore: Date?, createdAfter: Date?, requestOptions: RequestOptions?) -> ListWithdrawalsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of withdrawals for a company, with optional sorting and date filtering.

Required permissions:
 - `payout:withdrawal:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.withdrawals.list(
        first: 42,
        last: 42,
        companyId: "biz_xxxxxxxxxxxxxx",
        createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
        createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
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

**companyId:** `String` — The unique identifier of the company to list withdrawals for.
    
</dd>
</dl>

<dl>
<dd>

**direction:** `Direction?` 
    
</dd>
</dl>

<dl>
<dd>

**createdBefore:** `Date?` — Only return withdrawals created before this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**createdAfter:** `Date?` — Only return withdrawals created after this timestamp.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.withdrawals.<a href="/Sources/Resources/Withdrawals/WithdrawalsClient.swift">create</a>(request: Requests.CreateWithdrawalsRequest, requestOptions: RequestOptions?) -> Withdrawal</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a withdrawal request for a ledger account

Required permissions:
 - `payout:withdraw_funds`
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
    let client = Whop(token: "<token>")

    _ = try await client.withdrawals.create(request: .init(
        amount: 6.9,
        companyId: "biz_xxxxxxxxxxxxxx",
        currency: .usd
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

**request:** `Requests.CreateWithdrawalsRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.withdrawals.<a href="/Sources/Resources/Withdrawals/WithdrawalsClient.swift">retrieve</a>(id: String, requestOptions: RequestOptions?) -> Withdrawal</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves the details of an existing withdrawal.

Required permissions:
 - `payout:withdrawal:read`
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
    let client = Whop(token: "<token>")

    _ = try await client.withdrawals.retrieve(id: "wdrl_xxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the withdrawal to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.withdrawals.<a href="/Sources/Resources/Withdrawals/WithdrawalsClient.swift">generatePdf</a>(id: String, requestOptions: RequestOptions?) -> GeneratePdfWithdrawalsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Generates a withdrawal PDF invoice and returns a temporary download URL.

Required permissions:
 - `payout:withdrawal:read`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.withdrawals.generatePdf(id: "wdrl_xxxxxxxxxxxxx")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The unique identifier of the withdrawal to generate a PDF for.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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

Updates the account's preferences. Each top-level key present in the body is replaced as a whole; omitted keys are left untouched. `ads_triple_whale_integration` takes the Data-In API key to connect with, or `null` to disconnect. `ads_payment_methods` always requires a `primary` entry. `backup` is optional and any pairing is allowed — two cards, `card`+`platform_balance`, or a single method — so a card-only advertiser can fund ads without a platform balance. The `primary` and `backup` must be different sources. A `platform_balance` entry may omit `id` to use the account's default Whop balance. Configuring a `card` requires a user token; account API keys can set up platform-balance billing only.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

**first:** `Int?` — Number of submissions to return from the start of the window.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor to paginate forwards from.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of submissions to return from the end of the window.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Cursor to paginate backwards from.
    
</dd>
</dl>

<dl>
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
    let client = Whop(token: "<token>")

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

## Members Logs
<details><summary><code>client.members.logs.<a href="/Sources/Resources/Members/Logs/LogsClient.swift">list</a>(id: String, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListLogsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists activity for a member and all of their non-drafted memberships, most recent first.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**first:** `Int?` — Number of log entries to return from the start of the window.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor to paginate forwards from.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of log entries to return from the end of the window.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Cursor to paginate backwards from.
    
</dd>
</dl>

<dl>
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

Lists the platform's visible notification topics — the categories users can set notification preferences on. App-created topics are internal and not returned.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**first:** `Int?` — The number of topics to return (default 20, max 100).
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor; returns topics after this position.
    
</dd>
</dl>

<dl>
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
<details><summary><code>client.partners.businesses.<a href="/Sources/Resources/Partners/Businesses/BusinessesClient.swift">list</a>(status: ListBusinessesRequestStatus?, hasEarnings: Bool?, first: Int?, after: String?, last: Int?, before: String?, order: ListBusinessesRequestOrder?, direction: ListBusinessesRequestDirection?, createdBefore: String?, createdAfter: String?, referredUserId: String?, referredUsername: String?, tier: ListBusinessesRequestTier?, requestOptions: RequestOptions?) -> ListBusinessesResponse</code></summary>
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
    let client = Whop(token: "<token>")

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

**first:** `Int?` — Number of partner businesses to return from the start of the window.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor to fetch the page after (from page_info.end_cursor).
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of partner businesses to return from the end of the window.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Cursor to fetch the page before (from page_info.start_cursor).
    
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

**tier:** `ListBusinessesRequestTier?` — Filter to only first-tier referrals or only second-tier referrals.
    
</dd>
</dl>

<dl>
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

Retrieves a single referred business and its referral terms.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

## Partners Businesses Earnings
<details><summary><code>client.partners.businesses.earnings.<a href="/Sources/Resources/Partners/Businesses/Earnings/EarningsClient.swift">list</a>(id: String, status: ListEarningsRequestStatus?, incomeSource: [ListEarningsRequestIncomeSourceItem]?, first: Int?, after: String?, last: Int?, before: String?, order: ListEarningsRequestOrder?, direction: ListEarningsRequestDirection?, createdBefore: String?, createdAfter: String?, requestOptions: RequestOptions?) -> ListEarningsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the earnings Whop pays out for one referred business's activity, most recent first.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**first:** `Int?` 
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` 
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` 
    
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

## Payouts Methods
<details><summary><code>client.payouts.methods.<a href="/Sources/Resources/Payouts/Methods/MethodsClient.swift">list</a>(accountId: String?, userId: String?, status: ListMethodsRequestStatus?, amount: Double?, currency: String?, includeLimits: Bool?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListMethodsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the bank accounts, wallets, and crypto addresses an account or user can withdraw to, newest first.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**amount:** `Double?` — Optional withdrawal amount in whole currency units, for example `250.00`. When provided, each method includes a quote with the estimated fee, amount received, and delivery date for that amount.
    
</dd>
</dl>

<dl>
<dd>

**currency:** `String?` — Currency code of the amount, for example `usd`. Only meaningful with amount or include_limits.
    
</dd>
</dl>

<dl>
<dd>

**includeLimits:** `Bool?` — When true, the response also carries limits — the live per-speed payout caps the account's payout requests are validated against, in the requested currency. Requires the payout:withdrawal:read scope.
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — Number of payout methods to return from the start of the window.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor to fetch the page after (from page_info.end_cursor).
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of payout methods to return from the end of the window.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Cursor to fetch the page before (from page_info.start_cursor).
    
</dd>
</dl>

<dl>
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

Saves a new place an account or user can withdraw to. Sensitive details are vaulted in transit and never stored raw.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

Changes the label used to identify a saved payout method.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.payouts.methods.update(
        id: "id",
        request: .init(nickname: "Primary checking")
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

## Payouts SupportedMethods
<details><summary><code>client.payouts.supportedMethods.<a href="/Sources/Resources/Payouts/SupportedMethods/SupportedMethodsClient.swift">list</a>(accountId: String?, userId: String?, country: String?, amount: Double?, currency: String?, supportedPayoutMethodId: String?, destinationCurrency: String?, first: Int?, after: String?, last: Int?, before: String?, requestOptions: RequestOptions?) -> ListSupportedMethodsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Lists the payout methods an account or user is eligible to add.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**amount:** `Double?` — Optional withdrawal amount in whole currency units, for example `250.00`. When provided, each destination includes per-currency fee and delivery quotes.
    
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

**first:** `Int?` — Number of supported payout methods to return from the start of the window.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — Cursor to fetch the page after (from page_info.end_cursor).
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — Number of supported payout methods to return from the end of the window.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — Cursor to fetch the page before (from page_info.start_cursor).
    
</dd>
</dl>

<dl>
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

Lists the authenticated user's own OAuth grants — one per app they have authorized, per account they authorized it for. The list is always the caller's own; there is no parameter for reading another user's grants. Requires a user session: an API key or an OAuth token is refused, so an app can never enumerate the other apps a user has authorized.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**first:** `Int?` — The number of grants to return (default 20, max 100).
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor; returns grants after this position.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — The number of grants to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — A cursor; returns grants before this position.
    
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

Completes the OAuth authorization step for the authenticated user: records their consent for the scopes an app asked for and mints the authorization code to hand back to it. Returns the grant, plus a `redirect_url` carrying that code — the one and only time it is returned. Exchange the code at `POST /oauth/token` with the verifier for `code_challenge`. Requires a user session, because consent has to come from the account holder: an API key or an OAuth token is refused, so an app can never authorize itself. Send an `Idempotency-Key` to make a retry safe — a replay returns the original `redirect_url` and its code rather than issuing a second one.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.users.oauthGrants.create(request: .init(
        clientId: "app_xxxxxxxxxxxxxx",
        codeChallenge: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        codeChallengeMethod: .s256,
        redirectUri: "https://Booking.Shinetime.example:8443/oauth/Callback/",
        requestedScopes: [
            "profile"
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

Lists the authenticated user's own passkeys, newest first. The list is always the caller's own; there is no parameter for reading another user's passkeys. Requires a user session: an API key or an OAuth token is refused, because a passkey confirms the account holder before a sensitive action and no app may enumerate one.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**first:** `Int?` — The number of passkeys to return (default 20, max 100).
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor; returns passkeys after this position.
    
</dd>
</dl>

<dl>
<dd>

**last:** `Int?` — The number of passkeys to return from the end of the range.
    
</dd>
</dl>

<dl>
<dd>

**before:** `String?` — A cursor; returns passkeys before this position.
    
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

Registers a passkey for the authenticated user from the attestation a browser produced for a `registration` challenge. Mint that challenge first with `POST /users/me/passkeys/challenge`; it is single-use and expires 5 minutes after it is issued. Requires a user session.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

    _ = try await client.users.passkeys.create(request: .init(
        attestationObject: "YXR0ZXN0YXRpb24",
        clientDataJson: "Y2xpZW50LWRhdGE",
        credentialId: "bmV3LWNyZWRlbnRpYWw",
        nickname: "Work laptop"
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

<details><summary><code>client.users.passkeys.<a href="/Sources/Resources/Users/Passkeys/PasskeysClient.swift">challenge</a>(request: Requests.ChallengePasskeysRequest, requestOptions: RequestOptions?) -> ChallengePasskeysResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Mints the challenge a browser needs to run a WebAuthn ceremony against the authenticated user's own passkeys. A `registration` challenge enrolls a new passkey; a `deletion` challenge is bound to the one passkey named by `passkey_id` and proves the user still holds it. Challenges are single-use and expire 5 minutes after they are issued, so send a fresh `Idempotency-Key` per ceremony — a replayed key returns the original challenge, which may already have expired. Requires a user session.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

Retrieves the authenticated user's settings document. Addressed only as `me` — the document always belongs to the session user.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

## Users Preferences Notifications
<details><summary><code>client.users.preferences.notifications.<a href="/Sources/Resources/Users/Preferences/Notifications/PreferencesNotificationsClient.swift">set</a>(request: Requests.SetNotificationsRequest, requestOptions: RequestOptions?) -> SetNotificationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Sets the authenticated user's notification preferences. Each preference is addressed by `scope`, not by id, so a scope read back from either list endpoint can be sent straight here.

A scope naming an experience with no topic sets that experience's level, and accepts all three levels. Any other scope sets a topic override, which is binary — `all` or `nothing` — and requires a `channel`.

`level: null` clears the preference. Preferences are stored as overrides, so clearing one means the scope inherits its default again rather than being switched off.

The batch is applied in one transaction: if any entry is rejected, none are written. Experience levels are applied before topic overrides, because setting a level replaces every topic preference for that experience — so an override sent alongside a level wins. The response reports what each scope now resolves to, in the order the entries were sent.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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
    let client = Whop(token: "<token>")

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

**first:** `Int?` — The number of preferences to return.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor; returns preferences after this position.
    
</dd>
</dl>

<dl>
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

Lists the authenticated user's topic-scoped notification preferences, plus user-agnostic platform defaults. Each filter matches preferences scoped to its value or not narrowed on that dimension. Per-experience levels are listed separately, by `GET /users/me/preferences/notifications/experiences`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import WhopSDK

private func main() async throws {
    let client = Whop(token: "<token>")

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

**accountId:** `String?` — Only return preferences scoped to this account's member notifications (`biz_` tag).
    
</dd>
</dl>

<dl>
<dd>

**teamAccountId:** `String?` — Only return preferences scoped to this account's team notifications (`biz_` tag).
    
</dd>
</dl>

<dl>
<dd>

**experienceId:** `String?` — Only return preferences scoped to this experience (`exp_` tag).
    
</dd>
</dl>

<dl>
<dd>

**topicId:** `String?` — Only return preferences scoped to this notification topic (`topic_` tag).
    
</dd>
</dl>

<dl>
<dd>

**first:** `Int?` — The number of preferences to return.
    
</dd>
</dl>

<dl>
<dd>

**after:** `String?` — A cursor; returns preferences after this position.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

