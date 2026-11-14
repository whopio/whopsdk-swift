import Foundation

public struct AccountEconomicIntelligenceOffer: Codable, Hashable, Sendable {
    /// Whether this offer renews every period until auto-renew is turned off, rather than ending after one.
    public let autoRenew: Bool
    /// The length of each period Economic Intelligence renews for, in `duration_unit`, such as `3` for 3 days.
    public let duration: Int
    /// The unit of time the duration is in (hours or days)
    public let durationUnit: AccountEconomicIntelligenceOfferDurationUnit
    /// Percentage of payment volume charged while Economic Intelligence is on, such as `3` for 3%.
    public let feePercentage: Double
    /// The unique identifier for this offer. Pass this value as `economic_intelligence_duration_key` to turn it on. Only `3_days`, the auto-renew offer, is offered. The other keys identify periods bought before it became the only plan.
    public let key: AccountEconomicIntelligenceOfferKey
    /// Whether Whop recommends this offer. At most one offer is recommended.
    public let recommended: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        autoRenew: Bool,
        duration: Int,
        durationUnit: AccountEconomicIntelligenceOfferDurationUnit,
        feePercentage: Double,
        key: AccountEconomicIntelligenceOfferKey,
        recommended: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.autoRenew = autoRenew
        self.duration = duration
        self.durationUnit = durationUnit
        self.feePercentage = feePercentage
        self.key = key
        self.recommended = recommended
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.autoRenew = try container.decode(Bool.self, forKey: .autoRenew)
        self.duration = try container.decode(Int.self, forKey: .duration)
        self.durationUnit = try container.decode(AccountEconomicIntelligenceOfferDurationUnit.self, forKey: .durationUnit)
        self.feePercentage = try container.decode(Double.self, forKey: .feePercentage)
        self.key = try container.decode(AccountEconomicIntelligenceOfferKey.self, forKey: .key)
        self.recommended = try container.decode(Bool.self, forKey: .recommended)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.autoRenew, forKey: .autoRenew)
        try container.encode(self.duration, forKey: .duration)
        try container.encode(self.durationUnit, forKey: .durationUnit)
        try container.encode(self.feePercentage, forKey: .feePercentage)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.recommended, forKey: .recommended)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case autoRenew = "auto_renew"
        case duration
        case durationUnit = "duration_unit"
        case feePercentage = "fee_percentage"
        case key
        case recommended
    }
}