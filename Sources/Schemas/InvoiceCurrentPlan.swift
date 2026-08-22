import Foundation

/// The plan that this invoice charges for.
public struct InvoiceCurrentPlan: Codable, Hashable, Sendable {
    /// The currency used for all prices on this plan (e.g., 'usd', 'eur'). All monetary amounts on the plan are denominated in this currency.
    public let currency: Currencies
    /// A text description of the plan visible to customers. Maximum 1000 characters. Null if no description is set.
    public let description: Nullable<String>
    /// The formatted price (including currency) for the plan.
    public let formattedPrice: String
    /// The unique identifier for the plan.
    public let id: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        currency: Currencies,
        description: Nullable<String>,
        formattedPrice: String,
        id: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.currency = currency
        self.description = description
        self.formattedPrice = formattedPrice
        self.id = id
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currency = try container.decode(Currencies.self, forKey: .currency)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.formattedPrice = try container.decode(String.self, forKey: .formattedPrice)
        self.id = try container.decode(String.self, forKey: .id)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.formattedPrice, forKey: .formattedPrice)
        try container.encode(self.id, forKey: .id)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case currency
        case description
        case formattedPrice = "formatted_price"
        case id
    }
}