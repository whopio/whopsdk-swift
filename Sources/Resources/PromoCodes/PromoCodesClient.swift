import Foundation

public final class PromoCodesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists an account's promo codes.
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
    ///     _ = try await client.promoCodes.list(
    ///         accountId: "account_id",
    ///         productIds: [
    ///             "prod_xxxxxxxxxxxxxx"
    ///         ],
    ///         variantIds: [
    ///             "plan_xxxxxxxxxxxxxx"
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: Account whose promo codes are listed (`biz_` tag).
    /// - Parameter status: Promo-code status. `expired` groups inactive and archived codes.
    /// - Parameter productIds: Only promo codes scoped to these product IDs.
    /// - Parameter variantIds: Only promo codes scoped to these variant IDs.
    /// - Parameter createdBefore: Only promo codes created before this ISO 8601 timestamp.
    /// - Parameter createdAfter: Only promo codes created after this ISO 8601 timestamp.
    /// - Parameter order: Sort field.
    /// - Parameter direction: Sort direction.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter includeTotalCount: Set to `true` to return the number of matching results in `page_info.total_count`. Send `first=0` as well to return the count without any results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String, status: ListPromoCodesRequestStatus? = nil, productIds: [String]? = nil, variantIds: [String]? = nil, createdBefore: Date? = nil, createdAfter: Date? = nil, order: ListPromoCodesRequestOrder? = nil, direction: ListPromoCodesRequestDirection? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, includeTotalCount: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> ListPromoCodesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/promo_codes",
            queryParams: [
                "account_id": .string(accountId), 
                "status": status.map { .string($0.rawValue) }, 
                "product_ids": productIds.map { .stringArray($0) }, 
                "variant_ids": variantIds.map { .stringArray($0) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "created_after": createdAfter.map { .date($0) }, 
                "order": order.map { .string($0.rawValue) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }, 
                "include_total_count": includeTotalCount.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListPromoCodesResponse.self
        )
    }

    /// Creates a promo code for an account.
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
    ///     _ = try await client.promoCodes.create(request: .init(
    ///         accountId: "biz_xxxxxxxxxxxxxx",
    ///         amountOff: 25,
    ///         baseCurrency: .usd,
    ///         code: "AFFILIATE25",
    ///         newUsersOnly: true,
    ///         promoDurationMonths: 3,
    ///         promoType: .percentage
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreatePromoCodesRequest, requestOptions: RequestOptions? = nil) async throws -> PromoCode {
        return try await httpClient.performRequest(
            method: .post,
            path: "/promo_codes",
            body: request,
            requestOptions: requestOptions,
            responseType: PromoCode.self
        )
    }

    /// Retrieves a promo code by ID.
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
    ///     _ = try await client.promoCodes.retrieve(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Promo code ID (`promo_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, requestOptions: RequestOptions? = nil) async throws -> PromoCode {
        return try await httpClient.performRequest(
            method: .get,
            path: "/promo_codes/\(id)",
            requestOptions: requestOptions,
            responseType: PromoCode.self
        )
    }

    /// Archives a promo code so it cannot be used in future checkouts.
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
    ///     _ = try await client.promoCodes.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Promo code ID (`promo_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeletePromoCodesResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/promo_codes/\(id)",
            requestOptions: requestOptions,
            responseType: DeletePromoCodesResponse.self
        )
    }

    /// Turns an inactive promo code back on so it can be redeemed at checkout.
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
    ///     _ = try await client.promoCodes.activate(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Promo code ID (`promo_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func activate(id: String, requestOptions: RequestOptions? = nil) async throws -> PromoCode {
        return try await httpClient.performRequest(
            method: .post,
            path: "/promo_codes/\(id)/activate",
            requestOptions: requestOptions,
            responseType: PromoCode.self
        )
    }

    /// Turns off an active promo code so it can no longer be redeemed at checkout.
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
    ///     _ = try await client.promoCodes.deactivate(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Promo code ID (`promo_` tag).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func deactivate(id: String, requestOptions: RequestOptions? = nil) async throws -> PromoCode {
        return try await httpClient.performRequest(
            method: .post,
            path: "/promo_codes/\(id)/deactivate",
            requestOptions: requestOptions,
            responseType: PromoCode.self
        )
    }
}