import Foundation

/// The card data associated with the payment method, if its a debit or credit card.
public struct PaymentPaymentMethodCard: Codable, Hashable, Sendable {
    /// The card network (e.g., visa, mastercard, amex). Null if the brand could not be determined.
    public let brand: Nullable<CardBrands>
    /// The two-digit expiration month of the card (1-12). Null if not available.
    public let expMonth: Nullable<Int>
    /// The two-digit expiration year of the card (e.g., 27 for 2027). Null if not available.
    public let expYear: Nullable<Int>
    /// A stable identifier for the underlying card. Two payment methods with the same fingerprint are the same card. Null if not available.
    public let fingerprint: Nullable<String>
    /// The last four digits of the card number. Null if not available.
    public let last4: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        brand: Nullable<CardBrands>,
        expMonth: Nullable<Int>,
        expYear: Nullable<Int>,
        fingerprint: Nullable<String>,
        last4: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.brand = brand
        self.expMonth = expMonth
        self.expYear = expYear
        self.fingerprint = fingerprint
        self.last4 = last4
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.brand = try container.decode(Nullable<CardBrands>.self, forKey: .brand)
        self.expMonth = try container.decode(Nullable<Int>.self, forKey: .expMonth)
        self.expYear = try container.decode(Nullable<Int>.self, forKey: .expYear)
        self.fingerprint = try container.decode(Nullable<String>.self, forKey: .fingerprint)
        self.last4 = try container.decode(Nullable<String>.self, forKey: .last4)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.brand, forKey: .brand)
        try container.encode(self.expMonth, forKey: .expMonth)
        try container.encode(self.expYear, forKey: .expYear)
        try container.encode(self.fingerprint, forKey: .fingerprint)
        try container.encode(self.last4, forKey: .last4)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case brand
        case expMonth = "exp_month"
        case expYear = "exp_year"
        case fingerprint
        case last4
    }
}