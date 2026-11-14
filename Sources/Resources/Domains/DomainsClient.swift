import Foundation

public final class DomainsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists your domains. Filter by account, app, status, hostname, or the state of a capability.
    ///
    /// Pass `search` to find domains to buy instead: the exact domain first, even when taken, then your name on popular extensions, then suggestions. Pass `tlds` to check only the extensions you choose. Results aren't reserved.
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
    ///     _ = try await client.domains.list(tlds: [
    ///         "com"
    ///     ])
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Only domains belonging to this account, prefixed biz_.
    /// - Parameter appId: Only domains whose website serves this app, prefixed app_.
    /// - Parameter status: Only domains with this status: the most pressing state of their capabilities, or `idle` when they want nothing.
    /// - Parameter order: Field to sort by. Domains with the same value keep their creation order in the same direction.
    /// - Parameter direction: Sort direction.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter search: A name or domain to find domains to buy, such as `example` or `example.com`; a subdomain or URL searches its registrable domain. Returns domains with `availability` instead of your domains, without other filters or pagination.
    /// - Parameter tlds: With `search`, check only these extensions, such as `com` or `co.uk`, returned in this order. Repeat for several, up to 100.
    /// - Parameter domain: Only your domain with this hostname, such as `example.com`.
    /// - Parameter verification: Only domains with verification in this state, such as `ready`, or `any` for every domain that has verification.
    /// - Parameter registration: Only domains with registration in this state, such as `ready`, or `any` for every domain that has registration.
    /// - Parameter platform: Only domains with platform in this state, such as `ready`, or `any` for every domain that has platform.
    /// - Parameter subdomain: Only domains with subdomain in this state, such as `ready`, or `any` for every domain that has subdomain.
    /// - Parameter website: Only domains with website in this state, such as `ready`, or `any` for every domain that has website.
    /// - Parameter applePay: Only domains with apple_pay in this state, such as `ready`, or `any` for every domain that has apple_pay.
    /// - Parameter pixel: Only domains with pixel in this state, such as `ready`, or `any` for every domain that has pixel.
    /// - Parameter email: Only domains with email in this state, such as `ready`, or `any` for every domain that has email.
    /// - Parameter transfer: Only domains with transfer in this state, such as `ready`, or `any` for every domain that has transfer.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, appId: String? = nil, status: ListDomainsRequestStatus? = nil, order: ListDomainsRequestOrder? = nil, direction: ListDomainsRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, search: String? = nil, tlds: [String]? = nil, domain: String? = nil, verification: ListDomainsRequestVerification? = nil, registration: ListDomainsRequestRegistration? = nil, platform: ListDomainsRequestPlatform? = nil, subdomain: ListDomainsRequestSubdomain? = nil, website: ListDomainsRequestWebsite? = nil, applePay: ListDomainsRequestApplePay? = nil, pixel: ListDomainsRequestPixel? = nil, email: ListDomainsRequestEmail? = nil, transfer: ListDomainsRequestTransfer? = nil, requestOptions: RequestOptions? = nil) async throws -> ListDomainsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/domains",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "app_id": appId.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "search": search.map { .string($0) }, 
                "tlds": tlds.map { .stringArray($0) }, 
                "domain": domain.map { .string($0) }, 
                "verification": verification.map { .string($0.rawValue) }, 
                "registration": registration.map { .string($0.rawValue) }, 
                "platform": platform.map { .string($0.rawValue) }, 
                "subdomain": subdomain.map { .string($0.rawValue) }, 
                "website": website.map { .string($0.rawValue) }, 
                "apple_pay": applePay.map { .string($0.rawValue) }, 
                "pixel": pixel.map { .string($0.rawValue) }, 
                "email": email.map { .string($0.rawValue) }, 
                "transfer": transfer.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: ListDomainsResponse.self
        )
    }

    /// Adds a domain to your account with the capabilities you want.
    ///
    /// Pass `registration` to buy the domain through Whop; it's the default when you pass no capability. Pay its `amount_due` at `purchase_url`, or pass `registration.payment_method_id` to charge a saved card. Whop then registers it, runs its DNS, and renews it every year while `auto_renew` is on.
    ///
    /// Pass `registration.auth_code` to transfer in a domain you own at another registrar. The transfer starts once its `amount_due` is paid, or at once when `amount_due` is `null`. While `registration.phase` is `transferring`, its `issues` say what the transfer needs from you.
    ///
    /// Pass `verification` to connect a domain you registered elsewhere: its `issues` list the TXT and routing records to publish. A subdomain of a domain this account bought through Whop takes `subdomain` by default, and Whop publishes its DNS records itself. Pass `website` with an `app_id` to serve that app on the domain.
    ///
    /// To change a domain you already have, update it instead. Adding a domain this account deleted revives it under its original ID.
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
    ///     _ = try await client.domains.create(request: .init(domain: "www.bought.com"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateDomainsRequest, requestOptions: RequestOptions? = nil) async throws -> Domain {
        return try await httpClient.performRequest(
            method: .post,
            path: "/domains",
            body: request,
            requestOptions: requestOptions,
            responseType: Domain.self
        )
    }

    /// Retrieves a domain by ID or hostname. Both return the same domain, shown as fully as you can see it: everything for your own accounts, and only who has it and what it serves for anyone else.
    ///
    /// A hostname no domain on Whop has comes back with its `availability` instead.
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
    ///     _ = try await client.domains.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Domain ID, prefixed `dom_`, or a hostname such as `example.com`; a bare name looks up `.com`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> Domain {
        return try await httpClient.performRequest(
            method: .get,
            path: "/domains/\(id)",
            requestOptions: requestOptions,
            responseType: Domain.self
        )
    }

    /// Removes the domain from your account and releases its capabilities in the background. Deleting an unpaid purchase cancels it, and deleting a transfer cancels it and refunds it while the current registrar can still stop it. A registered domain can't be deleted; turn off `auto_renew` and it's released after it expires. Adding the domain to this account again revives it under the same ID.
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
    ///     _ = try await client.domains.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Domain ID, prefixed `dom_`, or a hostname such as `example.com`; a bare name looks up `.com`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> Domain {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/domains/\(id)",
            requestOptions: requestOptions,
            responseType: Domain.self
        )
    }

    /// Changes a domain's capabilities or metadata. Pass a capability to add it or change its settings, or `null` to release it; capabilities you leave out don't change. Passing a capability that needs action again retries it. Releasing every capability keeps the domain, `idle`; delete it to remove it.
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
    ///     _ = try await client.domains.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Domain ID, prefixed `dom_`, or a hostname such as `example.com`; a bare name looks up `.com`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateDomainsRequest, requestOptions: RequestOptions? = nil) async throws -> Domain {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/domains/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Domain.self
        )
    }

    /// Checks the domain's DNS, payment, and provider state again now instead of at its next scheduled check. Returns the domain as saved; retrieve it again to see the result.
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
    ///     _ = try await client.domains.check(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Domain ID, prefixed `dom_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func check(id: String, requestOptions: RequestOptions? = nil) async throws -> Domain {
        return try await httpClient.performRequest(
            method: .post,
            path: "/domains/\(id)/check",
            requestOptions: requestOptions,
            responseType: Domain.self
        )
    }
}