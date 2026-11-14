import Foundation

/// The promo code used for this payment.
public struct PaymentLegacyPromoCode: Codable, Hashable, Sendable {
    /// The discount amount. Interpretation depends on promo_type: if 'percentage', this is the percentage (e.g., 20 means 20% off); if 'flat_amount', this is dollars off (e.g., 10.00 means $10.00 off).
    public let amountOff: Double
    /// The monetary currency of the promo code.
    public let baseCurrency: Currencies
    /// The specific code used to apply the promo at checkout.
    public let code: Nullable<String>
    /// The unique identifier for the promo code.
    public let id: String
    /// The number of months the promo is applied for.
    public let numberOfIntervals: Nullable<Int>
    /// The type (% or flat amount) of the promo.
    public let promoType: PromoTypes
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amountOff: Double,
        baseCurrency: Currencies,
        code: Nullable<String>,
        id: String,
        numberOfIntervals: Nullable<Int>,
        promoType: PromoTypes,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amountOff = amountOff
        self.baseCurrency = baseCurrency
        self.code = code
        self.id = id
        self.numberOfIntervals = numberOfIntervals
        self.promoType = promoType
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amountOff = try container.decode(Double.self, forKey: .amountOff)
        self.baseCurrency = try container.decode(Currencies.self, forKey: .baseCurrency)
        self.code = try container.decode(Nullable<String>.self, forKey: .code)
        self.id = try container.decode(String.self, forKey: .id)
        self.numberOfIntervals = try container.decode(Nullable<Int>.self, forKey: .numberOfIntervals)
        self.promoType = try container.decode(PromoTypes.self, forKey: .promoType)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.amountOff, forKey: .amountOff)
        try container.encode(self.baseCurrency, forKey: .baseCurrency)
        try container.encode(self.code, forKey: .code)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.numberOfIntervals, forKey: .numberOfIntervals)
        try container.encode(self.promoType, forKey: .promoType)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amountOff = "amount_off"
        case baseCurrency = "base_currency"
        case code
        case id
        case numberOfIntervals = "number_of_intervals"
        case promoType = "promo_type"
    }
}