import Foundation

/// An optional payout method to connect for estimated savings. The quote still uses the requested saved method.
public struct CreateQuotePayoutsResponseRecommendedMethod: Codable, Hashable, Sendable {
    /// Two-letter ISO country code for connecting the method.
    public let country: String
    /// Currency to select when connecting the method.
    public let destinationCurrency: String
    /// Estimated arrival when paying out with the suggested method, when available.
    public let estimatedArrival: Nullable<Date>
    /// Estimated total cost, including same-currency exchange-rate loss.
    public let estimatedFee: Money
    /// Estimated increase in the delivered amount after fees compared with this quote.
    public let estimatedSavings: Money
    /// Display name of the suggested payout method.
    public let name: String
    /// Supported payout method to connect, prefixed `podst_`.
    public let supportedPayoutMethodId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        country: String,
        destinationCurrency: String,
        estimatedArrival: Nullable<Date>,
        estimatedFee: Money,
        estimatedSavings: Money,
        name: String,
        supportedPayoutMethodId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.country = country
        self.destinationCurrency = destinationCurrency
        self.estimatedArrival = estimatedArrival
        self.estimatedFee = estimatedFee
        self.estimatedSavings = estimatedSavings
        self.name = name
        self.supportedPayoutMethodId = supportedPayoutMethodId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.country = try container.decode(String.self, forKey: .country)
        self.destinationCurrency = try container.decode(String.self, forKey: .destinationCurrency)
        self.estimatedArrival = try container.decode(Nullable<Date>.self, forKey: .estimatedArrival)
        self.estimatedFee = try container.decode(Money.self, forKey: .estimatedFee)
        self.estimatedSavings = try container.decode(Money.self, forKey: .estimatedSavings)
        self.name = try container.decode(String.self, forKey: .name)
        self.supportedPayoutMethodId = try container.decode(String.self, forKey: .supportedPayoutMethodId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.country, forKey: .country)
        try container.encode(self.destinationCurrency, forKey: .destinationCurrency)
        try container.encode(self.estimatedArrival, forKey: .estimatedArrival)
        try container.encode(self.estimatedFee, forKey: .estimatedFee)
        try container.encode(self.estimatedSavings, forKey: .estimatedSavings)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.supportedPayoutMethodId, forKey: .supportedPayoutMethodId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case country
        case destinationCurrency = "destination_currency"
        case estimatedArrival = "estimated_arrival"
        case estimatedFee = "estimated_fee"
        case estimatedSavings = "estimated_savings"
        case name
        case supportedPayoutMethodId = "supported_payout_method_id"
    }
}