import Foundation

public final class SupportedMethodsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Lists the payout methods an account or user is eligible to add. Pass a result's ID as `supported_payout_method_id` to `POST /payouts/methods` to save one.
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
    ///     _ = try await client.payouts.supportedMethods.list()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter accountId: The owning account ID (a biz_ identifier). Provide this or user_id.
    /// - Parameter userId: The owning user ID (a user_ identifier). Provide this or account_id.
    /// - Parameter country: ISO 3166-1 alpha-2 country code for the bank account or wallet, such as `US`. Defaults to the country of supported_payout_method_id when one is given, otherwise the payout account's country.
    /// - Parameter amount: Optional payout amount in whole currency units, for example `250.00`. When provided, each destination includes per-currency fee and delivery quotes.
    /// - Parameter currency: Currency code of the amount, for example `usd`. Only meaningful with amount.
    /// - Parameter supportedPayoutMethodId: Narrows the list to one supported payout method (a podst_ identifier) and includes the required_fields needed to save it as a payout method.
    /// - Parameter destinationCurrency: Currency the supported payout method would deliver payouts in. Only meaningful with supported_payout_method_id; required fields vary by destination currency.
    /// - Parameter partyType: Who will own the payout method. `first_party` is the account itself. `third_party` is a recipient the account pays, saved with `recipient` on `POST /payouts/methods`, which needs no identity fields. Only meaningful with supported_payout_method_id.
    /// - Parameter includeIndividualBanks: Whether to list each bank as its own payout method in countries where people choose a bank by name. Each bank has `parent_id` set to the bank deposit method that lists it. When `false`, these countries list one bank deposit method instead.
    /// - Parameter first: Number of results to return from the start of the range.
    /// - Parameter after: Return results after this cursor. Use `page_info.end_cursor` from the previous response to fetch the next page.
    /// - Parameter last: Number of results to return from the end of the range.
    /// - Parameter before: Return results before this cursor. Use `page_info.start_cursor` from the previous response to fetch the previous page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(accountId: String? = nil, userId: String? = nil, country: String? = nil, amount: Double? = nil, currency: String? = nil, supportedPayoutMethodId: String? = nil, destinationCurrency: String? = nil, partyType: ListSupportedMethodsRequestPartyType? = nil, includeIndividualBanks: Bool? = nil, first: Int? = nil, after: String? = nil, last: Int? = nil, before: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListSupportedMethodsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payouts/supported_methods",
            queryParams: [
                "account_id": accountId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }, 
                "country": country.map { .string($0) }, 
                "amount": amount.map { .double($0) }, 
                "currency": currency.map { .string($0) }, 
                "supported_payout_method_id": supportedPayoutMethodId.map { .string($0) }, 
                "destination_currency": destinationCurrency.map { .string($0) }, 
                "party_type": partyType.map { .string($0.rawValue) }, 
                "include_individual_banks": includeIndividualBanks.map { .bool($0) }, 
                "first": first.map { .int($0) }, 
                "after": after.map { .string($0) }, 
                "last": last.map { .int($0) }, 
                "before": before.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListSupportedMethodsResponse.self
        )
    }
}