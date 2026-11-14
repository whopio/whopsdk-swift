import Foundation

public final class PaymentMethodDomainsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the payment method domains registered for your account and its subaccounts. Deprecated: list domains with `GET /domains` and the `apple_pay` filter instead.
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
    ///     _ = try await client.paymentMethodDomains.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Only domains registered for this account (`biz_` tag). Defaults to the caller's account plus its subaccounts.
    /// - Parameter hostname: Only the domain with this exact hostname.
    /// - Parameter status: Only domains with this verification status.
    /// - Parameter provider: Only domains registered with this wallet provider.
    /// - Parameter createdBefore: Only domains created before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Only domains created after this ISO 8601 timestamp.
    /// - Parameter order: Sort field.
    /// - Parameter direction: Sort direction.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, hostname: String? = nil, status: ListPaymentMethodDomainsRequestStatus? = nil, provider: ListPaymentMethodDomainsRequestProvider? = nil, createdBefore: Date? = nil, createdAfter: Date? = nil, order: ListPaymentMethodDomainsRequestOrder? = nil, direction: ListPaymentMethodDomainsRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListPaymentMethodDomainsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payment_method_domains",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "hostname": hostname.map { .string($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "provider": provider.map { .string($0.rawValue) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "created_after": createdAfter.map { .date($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListPaymentMethodDomainsResponse.self
        )
    }

    /// Registers a hostname with the wallet provider and attempts verification inline. Returns `verified` when the provider fetched the domain-association file (for Apple Pay, `/.well-known/apple-developer-merchantid-domain-association`), or `pending` when it could not: host the file, then retry with `POST /payment_method_domains/:id/verify`. Deprecated: add Apple Pay with `POST /domains` and `apple_pay: {}` instead.
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
    ///     _ = try await client.paymentMethodDomains.create(request: .init(hostname: "pending.shinetime.com"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreatePaymentMethodDomainsRequest, requestOptions: RequestOptions? = nil) async throws -> PaymentMethodDomain {
        return try await httpClient.performRequest(
            method: .post,
            path: "/payment_method_domains",
            body: request,
            requestOptions: requestOptions,
            responseType: PaymentMethodDomain.self
        )
    }

    /// Retrieves a payment method domain to check its verification status. Deprecated: retrieve the domain with `GET /domains/{id}` instead, using the same ID.
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
    ///     _ = try await client.paymentMethodDomains.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the payment method domain, prefixed `pmd_` or `dom_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> PaymentMethodDomain {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payment_method_domains/\(id)",
            requestOptions: requestOptions,
            responseType: PaymentMethodDomain.self
        )
    }

    /// Unregisters a payment method domain so its wallet payment methods stop rendering there. Deprecated: remove Apple Pay with `PATCH /domains/{id}` and `apple_pay: null` instead. `DELETE /domains/{id}` removes the whole domain, including any website on it.
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
    ///     _ = try await client.paymentMethodDomains.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the payment method domain, prefixed `pmd_` or `dom_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeletePaymentMethodDomainsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/payment_method_domains/\(id)",
            requestOptions: requestOptions,
            responseType: DeletePaymentMethodDomainsResponse.self
        )
    }

    /// Re-attempts provider verification of a pending domain once the association file is hosted. Fails with a `bad_request` explaining what to fix; verifying an already `verified` domain is a no-op. Deprecated: check the domain with `POST /domains/{id}/check` instead.
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
    ///     _ = try await client.paymentMethodDomains.verify(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the payment method domain, prefixed `pmd_` or `dom_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func verify(id: String, requestOptions: RequestOptions? = nil) async throws -> PaymentMethodDomain {
        return try await httpClient.performRequest(
            method: .post,
            path: "/payment_method_domains/\(id)/verify",
            requestOptions: requestOptions,
            responseType: PaymentMethodDomain.self
        )
    }
}