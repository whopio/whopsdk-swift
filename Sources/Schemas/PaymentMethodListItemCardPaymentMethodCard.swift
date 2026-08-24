import Foundation

/// The card-specific details for this payment method, including brand, last four digits, and expiration.
public struct PaymentMethodListItemCardPaymentMethodCard: Codable, Hashable, Sendable {
    /// The card network (e.g., visa, mastercard, amex). Null if the brand could not be determined.
    public let brand: Nullable<CardBrands>
    /// The two-digit expiration month of the card (1-12). Null if not available.
    public let expMonth: Nullable<Int>
    /// The two-digit expiration year of the card (e.g., 27 for 2027). Null if not available.
    public let expYear: Nullable<Int>
    /// Whether the card is past its expiration month. An expired card cannot take a new charge.
    public let expired: Bool
    /// A stable identifier for the underlying card. Two payment methods with the same fingerprint are the same card. Null if not available.
    public let fingerprint: Nullable<String>
    /// How the card is funded by the issuer. Null if the funding type could not be determined.
    public let fundingType: Nullable<CardFundingTypes>
    /// The last four digits of the card number. Null if not available.
    public let last4: Nullable<String>
    /// Whether this card was verified with 3D Secure, either when it was saved or on a payment that used it.
    public let threeDsVerified: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        brand: Nullable<CardBrands>,
        expMonth: Nullable<Int>,
        expYear: Nullable<Int>,
        expired: Bool,
        fingerprint: Nullable<String>,
        fundingType: Nullable<CardFundingTypes>,
        last4: Nullable<String>,
        threeDsVerified: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.brand = brand
        self.expMonth = expMonth
        self.expYear = expYear
        self.expired = expired
        self.fingerprint = fingerprint
        self.fundingType = fundingType
        self.last4 = last4
        self.threeDsVerified = threeDsVerified
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.brand = try container.decode(Nullable<CardBrands>.self, forKey: .brand)
        self.expMonth = try container.decode(Nullable<Int>.self, forKey: .expMonth)
        self.expYear = try container.decode(Nullable<Int>.self, forKey: .expYear)
        self.expired = try container.decode(Bool.self, forKey: .expired)
        self.fingerprint = try container.decode(Nullable<String>.self, forKey: .fingerprint)
        self.fundingType = try container.decode(Nullable<CardFundingTypes>.self, forKey: .fundingType)
        self.last4 = try container.decode(Nullable<String>.self, forKey: .last4)
        self.threeDsVerified = try container.decode(Bool.self, forKey: .threeDsVerified)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.brand, forKey: .brand)
        try container.encode(self.expMonth, forKey: .expMonth)
        try container.encode(self.expYear, forKey: .expYear)
        try container.encode(self.expired, forKey: .expired)
        try container.encode(self.fingerprint, forKey: .fingerprint)
        try container.encode(self.fundingType, forKey: .fundingType)
        try container.encode(self.last4, forKey: .last4)
        try container.encode(self.threeDsVerified, forKey: .threeDsVerified)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case brand
        case expMonth = "exp_month"
        case expYear = "exp_year"
        case expired
        case fingerprint
        case fundingType = "funding_type"
        case last4
        case threeDsVerified = "three_ds_verified"
    }
}