import Foundation

public final class PaymentMethodsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of payment methods for a member or company, or for the authenticated user when neither is given, with optional filtering by creation date. A payment method is a stored representation of how a customer intends to pay, such as a card, bank account, or digital wallet.
    ///
    /// Required permissions:
    ///  - `member:payment_methods:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.paymentMethods.list(
    ///         first: 42,
    ///         last: 42,
    ///         memberId: "mber_xxxxxxxxxxxxx",
    ///         companyId: "biz_xxxxxxxxxxxxxx",
    ///         createdBefore: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601),
    ///         createdAfter: try! Date("2023-12-01T05:00:00Z", strategy: .iso8601)
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter after: Returns the elements in the list that come after the specified cursor.
    /// - Parameter before: Returns the elements in the list that come before the specified cursor.
    /// - Parameter first: Returns the first _n_ elements from the list.
    /// - Parameter last: Returns the last _n_ elements from the list.
    /// - Parameter memberId: The unique identifier of the member to list payment methods for. Omit this and company_id to list your own saved payment methods.
    /// - Parameter companyId: The unique identifier of the company. Provide either this or member_id, not both. Omit both to address your own saved payment methods.
    /// - Parameter createdBefore: Only return payment methods created before this timestamp.
    /// - Parameter createdAfter: Only return payment methods created after this timestamp.
    /// - Parameter paymentMethodTypes: Only return payment methods of these types. Pass the eligible `type` values from the payment method types catalogue so the list holds nothing the purchase cannot take. An empty list returns no payment methods.
    /// - Parameter cardBrands: Only return cards on these networks, such as the networks the seller accepts. Payment methods that are not cards are unaffected.
    /// - Parameter cardFundingTypes: Only return cards funded this way. A card whose funding could not be determined is excluded, and payment methods that are not cards are unaffected.
    /// - Parameter hasPayerDocument: Filter cards by whether they carry the payer identity document their payment provider requires. Payment methods that are not cards are unaffected.
    /// - Parameter expired: Filter by expiry. Only a card can expire, so `false` keeps every payment method that is not past its expiration month and `true` returns expired cards alone.
    /// - Parameter broken: Filter by whether the stored credential has permanently stopped charging, such as a vault entry its provider closed.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func list(after: String? = nil, before: String? = nil, first: Int? = nil, last: Int? = nil, memberId: String? = nil, companyId: String? = nil, direction: Direction? = nil, createdBefore: Date? = nil, createdAfter: Date? = nil, futureUsage: FutureUsageTypes? = nil, paymentMethodTypes: [PaymentMethodTypes]? = nil, cardBrands: [CardBrands]? = nil, cardFundingTypes: [CardFundingTypes]? = nil, hasPayerDocument: Bool? = nil, expired: Bool? = nil, broken: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> ListPaymentMethodsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payment_methods",
            queryParams: [
                "after": after.map { .string($0) }, 
                "before": before.map { .string($0) }, 
                "first": first.map { .int($0) }, 
                "last": last.map { .int($0) }, 
                "member_id": memberId.map { .string($0) }, 
                "company_id": companyId.map { .string($0) }, 
                "direction": direction.map { .string($0.rawValue) }, 
                "created_before": createdBefore.map { .date($0) }, 
                "created_after": createdAfter.map { .date($0) }, 
                "future_usage": futureUsage.map { .string($0.rawValue) }, 
                "payment_method_types": paymentMethodTypes.map { .unknown($0) }, 
                "card_brands": cardBrands.map { .unknown($0) }, 
                "card_funding_types": cardFundingTypes.map { .unknown($0) }, 
                "has_payer_document": hasPayerDocument.map { .bool($0) }, 
                "expired": expired.map { .bool($0) }, 
                "broken": broken.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListPaymentMethodsResponse.self
        )
    }

    /// Retrieves the details of an existing payment method. Addresses a member's wallet when member_id or company_id is given, otherwise your own.
    ///
    /// Required permissions:
    ///  - `member:payment_methods:read`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.paymentMethods.retrieve(
    ///         id: "payt_xxxxxxxxxxxxx",
    ///         companyId: "biz_xxxxxxxxxxxxxx",
    ///         memberId: "mber_xxxxxxxxxxxxx"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the payment method.
    /// - Parameter companyId: The unique identifier of the company. Provide either this or member_id, not both. Omit both to address your own saved payment methods.
    /// - Parameter memberId: The unique identifier of the member. Provide either this or company_id, not both. Omit both to address your own saved payment methods.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(id: String, companyId: String? = nil, memberId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> PaymentMethod {
        return try await httpClient.performRequest(
            method: .get,
            path: "/payment_methods/\(id)",
            queryParams: [
                "company_id": companyId.map { .string($0) }, 
                "member_id": memberId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: PaymentMethod.self
        )
    }

    /// Delete a saved payment method. Cannot delete a payment method attached to an active subscription.
    ///
    /// Required permissions:
    ///  - `member:payment_methods:manage`
    ///
    /// ```swift
    /// import Foundation
    /// import WhopSDK
    ///
    /// private func main() async throws {
    ///     let client = Whop(token: "<token>")
    ///
    ///     _ = try await client.paymentMethods.deletePaymentMethod(
    ///         id: "payt_xxxxxxxxxxxxx",
    ///         companyId: "biz_xxxxxxxxxxxxxx",
    ///         memberId: "mber_xxxxxxxxxxxxx"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The unique identifier of the payment method to delete.
    /// - Parameter companyId: The unique identifier of the company. Provide either this or member_id, not both. Omit both to address your own saved payment methods.
    /// - Parameter memberId: The unique identifier of the member. Provide either this or company_id, not both. Omit both to address your own saved payment methods.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func deletePaymentMethod(id: String, companyId: String? = nil, memberId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> Bool {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/payment_methods/\(id)",
            queryParams: [
                "company_id": companyId.map { .string($0) }, 
                "member_id": memberId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: Bool.self
        )
    }
}