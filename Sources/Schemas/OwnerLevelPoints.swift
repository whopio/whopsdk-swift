import Foundation

public struct OwnerLevelPoints: Codable, Hashable, Sendable {
    /// Points from paid Whop Ads charges, net of refunds: 10 for every dollar, rounded toward zero.
    public let ads: Int
    /// Points from captured Whop Card spend, net of refunds: 10 for every dollar, rounded toward zero.
    public let cards: Int
    /// Points from accounts the owner referred as a partner: 1 for every 3 they earn, rounded toward zero.
    public let partners: Int
    /// Points from perpetual trading volume filled through Whop: 1 for every dollar traded, rounded toward zero.
    public let trading: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        ads: Int,
        cards: Int,
        partners: Int,
        trading: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.ads = ads
        self.cards = cards
        self.partners = partners
        self.trading = trading
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ads = try container.decode(Int.self, forKey: .ads)
        self.cards = try container.decode(Int.self, forKey: .cards)
        self.partners = try container.decode(Int.self, forKey: .partners)
        self.trading = try container.decode(Int.self, forKey: .trading)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.ads, forKey: .ads)
        try container.encode(self.cards, forKey: .cards)
        try container.encode(self.partners, forKey: .partners)
        try container.encode(self.trading, forKey: .trading)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case ads
        case cards
        case partners
        case trading
    }
}