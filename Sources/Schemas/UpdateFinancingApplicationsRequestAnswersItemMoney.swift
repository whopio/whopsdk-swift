import Foundation

/// Price answer, such as `max_product_price`. `null` clears the price.
public struct UpdateFinancingApplicationsRequestAnswersItemMoney: Codable, Hashable, Sendable {
    /// Positive exact decimal amount in major units, such as 1234.56. At most 12 whole digits and the currency's fractional precision.
    public let amount: String
    /// Currency of the maximum product price.
    public let currency: UpdateFinancingApplicationsRequestAnswersItemMoneyCurrency
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: String,
        currency: UpdateFinancingApplicationsRequestAnswersItemMoneyCurrency,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.currency = currency
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(String.self, forKey: .amount)
        self.currency = try container.decode(UpdateFinancingApplicationsRequestAnswersItemMoneyCurrency.self, forKey: .currency)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amount, forKey: .amount)
        try container.encode(self.currency, forKey: .currency)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case currency
    }
}