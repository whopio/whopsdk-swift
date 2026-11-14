import Foundation

public struct PartnerPayoutTier: Codable, Hashable, Sendable {
    /// Default period during which a new referred business can generate commissions, measured from its attribution start. This is not a payout delay. Individual business terms can differ.
    public let duration: PartnerPayoutDuration
    public let rates: [PartnerPayoutRate]
    /// Referral tier: first for a directly referred business, or second for a business brought by a referred partner.
    public let tier: PartnerPayoutTierTier
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        duration: PartnerPayoutDuration,
        rates: [PartnerPayoutRate],
        tier: PartnerPayoutTierTier,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.duration = duration
        self.rates = rates
        self.tier = tier
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.duration = try container.decode(PartnerPayoutDuration.self, forKey: .duration)
        self.rates = try container.decode([PartnerPayoutRate].self, forKey: .rates)
        self.tier = try container.decode(PartnerPayoutTierTier.self, forKey: .tier)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.duration, forKey: .duration)
        try container.encode(self.rates, forKey: .rates)
        try container.encode(self.tier, forKey: .tier)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case duration
        case rates
        case tier
    }
}