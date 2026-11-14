import Foundation

public struct FinancingProviderCurrency: Codable, Hashable, Sendable {
    /// A currency checkout charges this provider in, lowercase ISO 4217.
    public let currency: FinancingProviderCurrencyCurrency
    /// The largest payment checkout offers this provider for in this currency. Null when checkout sets no maximum, or when the provider sets each merchant's limit itself (Splitit).
    public let maxAmount: Nullable<Money>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        currency: FinancingProviderCurrencyCurrency,
        maxAmount: Nullable<Money>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.currency = currency
        self.maxAmount = maxAmount
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currency = try container.decode(FinancingProviderCurrencyCurrency.self, forKey: .currency)
        self.maxAmount = try container.decode(Nullable<Money>.self, forKey: .maxAmount)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.maxAmount, forKey: .maxAmount)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case currency
        case maxAmount = "max_amount"
    }
}