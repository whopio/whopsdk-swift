import Foundation

public final class VariantsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists an account's variants, leaving out variants generated for a legacy invoice; retrieve one of those by ID. To list a product's public, buyable variants without authentication, omit `account_id` and pass `product_ids`.
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
    ///     _ = try await client.variants.list(
    ///         releaseMethods: [
    ///             "buy_now"
    ///         ],
    ///         visibilities: [
    ///             "visible"
    ///         ],
    ///         billingTypes: [
    ///             "renewal"
    ///         ],
    ///         productIds: [
    ///             "prod_xxxxxxxxxxxxxx"
    ///         ],
    ///         presentmentCurrency: .value("auto"),
    ///         ipAddress: .value("203.0.113.7"),
    ///         presentmentCountry: .value("JP")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The unique identifier of the account to list variants for. Required unless `product_ids` is provided for a public product-variant read.
    /// - Parameter direction: The sort direction for results. Defaults to descending.
    /// - Parameter order: The field to sort results by. Defaults to created_at.
    /// - Parameter releaseMethods: Filter to only variants matching these release methods.
    /// - Parameter visibilities: Filter to only variants matching these visibility states.
    /// - Parameter billingTypes: Filter to only variants matching these billing types.
    /// - Parameter productIds: Filter to only variants belonging to these product identifiers. When `account_id` is omitted, this is required and the response is publicly readable: only visible, non-invoice variants are returned.
    /// - Parameter createdBefore: Only return variants created before this timestamp.
    /// - Parameter createdAfter: Only return variants created after this timestamp.
    /// - Parameter presentmentCurrency: The currency to state each variant's prices in. Omit it, or send null, for each variant's own currency. `auto` states them in the currency of the country Whop places the buyer in: by `ip_address` when your server sends one, and by the request's own IP address otherwise. To choose that country instead, send `presentment_country` in place of this. A three-letter ISO 4217 code, such as `eur`, states them in that currency. A variant converts only where a payment quote for it would be priced in that currency, and stays in its own currency otherwise: a renewing variant, one with adaptive pricing off, a currency no payment method can collect, or `auto` for a buyer Whop cannot place in a country. Converted prices are an estimate at the current exchange rate. Nothing is held: the payment quote the buyer pays from fixes the rate.
    /// - Parameter ipAddress: The buyer's IP address, when your server reads on their behalf. Needs an API key; any other caller is placed by its own request. Where `presentment_currency` `auto` finds the buyer's local currency, and where a payment method must be able to collect it.
    /// - Parameter presentmentCountry: The country to state each variant's prices for, as an ISO 3166-1 alpha-2 code such as `JP`, when the buyer chose one: a store's country picker. States them in the currency `auto` would for a buyer in that country, so send it instead of `presentment_currency`, never with it. Whether a payment method can collect that currency is still judged where the buyer is: by `ip_address`, else by the request's own IP address. A country Whop has no currency for is ignored, and the prices are stated as `auto` would state them.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, direction: ListVariantsRequestDirection? = nil, order: ListVariantsRequestOrder? = nil, releaseMethods: [String]? = nil, visibilities: [String]? = nil, billingTypes: [String]? = nil, productIds: [String]? = nil, createdBefore: String? = nil, createdAfter: String? = nil, presentmentCurrency: Nullable<String>? = nil, ipAddress: Nullable<String>? = nil, presentmentCountry: Nullable<String>? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListVariantsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/variants",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "order": order.map { .string($0.rawValue) }, 
                "release_methods": releaseMethods.map { .stringArray($0) }, 
                "visibilities": visibilities.map { .stringArray($0) }, 
                "billing_types": billingTypes.map { .stringArray($0) }, 
                "product_ids": productIds.map { .stringArray($0) }, 
                "created_before": createdBefore.map { .string($0) }, 
                "created_after": createdAfter.map { .string($0) }, 
                "presentment_currency": presentmentCurrency?.wrappedValue.map { .string($0) }, 
                "ip_address": ipAddress?.wrappedValue.map { .string($0) }, 
                "presentment_country": presentmentCountry?.wrappedValue.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListVariantsResponse.self
        )
    }

    /// Creates a pricing variant for a product, defining the billing interval, price, and availability customers buy it with.
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
    ///     _ = try await client.variants.create(request: .init())
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func create(request: Requests.CreateVariantsRequest, requestOptions: RequestOptions? = nil) async throws -> Variant {
        return try await httpClient.performRequest(
            method: .post,
            path: "/variants",
            body: request,
            requestOptions: requestOptions,
            responseType: Variant.self
        )
    }

    /// Retrieves a variant. Requires no authentication; fields that need a permission are `null` for callers without it.
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
    ///     _ = try await client.variants.retrieve(
    ///         id: "id",
    ///         presentmentCurrency: .value("auto"),
    ///         ipAddress: .value("203.0.113.7"),
    ///         presentmentCountry: .value("JP")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Variant ID, prefixed `plan_`.
    /// - Parameter presentmentCurrency: The currency to state each variant's prices in. Omit it, or send null, for each variant's own currency. `auto` states them in the currency of the country Whop places the buyer in: by `ip_address` when your server sends one, and by the request's own IP address otherwise. To choose that country instead, send `presentment_country` in place of this. A three-letter ISO 4217 code, such as `eur`, states them in that currency. A variant converts only where a payment quote for it would be priced in that currency, and stays in its own currency otherwise: a renewing variant, one with adaptive pricing off, a currency no payment method can collect, or `auto` for a buyer Whop cannot place in a country. Converted prices are an estimate at the current exchange rate. Nothing is held: the payment quote the buyer pays from fixes the rate.
    /// - Parameter ipAddress: The buyer's IP address, when your server reads on their behalf. Needs an API key; any other caller is placed by its own request. Where `presentment_currency` `auto` finds the buyer's local currency, and where a payment method must be able to collect it.
    /// - Parameter presentmentCountry: The country to state each variant's prices for, as an ISO 3166-1 alpha-2 code such as `JP`, when the buyer chose one: a store's country picker. States them in the currency `auto` would for a buyer in that country, so send it instead of `presentment_currency`, never with it. Whether a payment method can collect that currency is still judged where the buyer is: by `ip_address`, else by the request's own IP address. A country Whop has no currency for is ignored, and the prices are stated as `auto` would state them.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, presentmentCurrency: Nullable<String>? = nil, ipAddress: Nullable<String>? = nil, presentmentCountry: Nullable<String>? = nil, requestOptions: RequestOptions? = nil) async throws -> Variant {
        return try await httpClient.performRequest(
            method: .get,
            path: "/variants/\(id)",
            queryParams: [
                "presentment_currency": presentmentCurrency?.wrappedValue.map { .string($0) }, 
                "ip_address": ipAddress?.wrappedValue.map { .string($0) }, 
                "presentment_country": presentmentCountry?.wrappedValue.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: Variant.self
        )
    }

    /// Deletes a variant from a product. It stops selling immediately; existing memberships on it are unaffected.
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
    ///     _ = try await client.variants.delete(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Variant ID, prefixed `plan_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> DeleteVariantsResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/variants/\(id)",
            requestOptions: requestOptions,
            responseType: DeleteVariantsResponse.self
        )
    }

    /// Updates a variant's pricing, billing interval, visibility, stock, and other settings.
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
    ///     _ = try await client.variants.update(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Variant ID, prefixed `plan_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func update(id: String, request: Requests.UpdateVariantsRequest, requestOptions: RequestOptions? = nil) async throws -> Variant {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/variants/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: Variant.self
        )
    }

    /// Deprecated. Quote tax with `POST /payment_quotes` instead. Previews tax for a variant before checkout, based on the buyer's location.
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
    ///     _ = try await client.variants.calculateTax(
    ///         id: "id",
    ///         request: .init(address: .value(CalculateTaxVariantsRequestAddress(
    ///             country: "DE",
    ///             postalCode: .value("10115")
    ///         )))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: Variant ID, prefixed `plan_`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func calculateTax(id: String, request: Requests.CalculateTaxVariantsRequest, requestOptions: RequestOptions? = nil) async throws -> CalculateTaxVariantsResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/variants/\(id)/calculate_tax",
            body: request,
            requestOptions: requestOptions,
            responseType: CalculateTaxVariantsResponse.self
        )
    }
}