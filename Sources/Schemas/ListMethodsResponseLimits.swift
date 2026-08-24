import Foundation

/// The live per-speed payout caps for the account in the requested currency — the numbers a payout request is validated against at submit time, so clients can cap an amount input at a value the request will accept. Only present when include_limits is true.
public struct ListMethodsResponseLimits: Codable, Hashable, Sendable {
    /// The currency the caps are denominated in.
    public let currency: String
    /// Caps for instant-speed payouts, which additionally draw on pending funds.
    public let instant: ListMethodsResponseLimitsInstant
    public let object: ListMethodsResponseLimitsObject
    /// Caps for standard-speed payouts, which draw on settled funds only.
    public let standard: ListMethodsResponseLimitsStandard
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        currency: String,
        instant: ListMethodsResponseLimitsInstant,
        object: ListMethodsResponseLimitsObject,
        standard: ListMethodsResponseLimitsStandard,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.currency = currency
        self.instant = instant
        self.object = object
        self.standard = standard
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.instant = try container.decode(ListMethodsResponseLimitsInstant.self, forKey: .instant)
        self.object = try container.decode(ListMethodsResponseLimitsObject.self, forKey: .object)
        self.standard = try container.decode(ListMethodsResponseLimitsStandard.self, forKey: .standard)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.instant, forKey: .instant)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.standard, forKey: .standard)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case currency
        case instant
        case object
        case standard
    }
}