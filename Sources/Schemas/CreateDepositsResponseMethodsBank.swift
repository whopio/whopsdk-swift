import Foundation

/// Bank deposit details. Only present when bank deposits are active for the destination account.
public struct CreateDepositsResponseMethodsBank: Codable, Hashable, Sendable {
    /// Bank transfer currencies available for this deposit.
    public let currencies: [CreateDepositsResponseMethodsBankCurrenciesItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        currencies: [CreateDepositsResponseMethodsBankCurrenciesItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.currencies = currencies
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currencies = try container.decode([CreateDepositsResponseMethodsBankCurrenciesItem].self, forKey: .currencies)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.currencies, forKey: .currencies)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case currencies
    }
}