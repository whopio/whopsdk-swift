import Foundation

/// The caller's own cut of each income source on this business, as a fraction of the same base as `payout_percentages` (0.12 = 12%). A solo partner's cut is the whole rate. On a referring partner business's deal it is the caller's team share of the rate: a closer earns their share, a manager earns their share minus the share of the person below them, and a deal participant earns their cut. Null when the caller earns nothing on this business, as with an account API key.
public struct ResendInviteBusinessesResponseMyPayoutPercentages: Codable, Hashable, Sendable {
    /// The caller's share of the referred business's Whop Ads spend.
    public let adSpend: Nullable<Float>
    /// The caller's share of Whop's profit from card interchange.
    public let cardInterchange: Nullable<Float>
    /// The caller's share of Whop's profit from product sales.
    public let sales: Nullable<Float>
    /// The caller's share of Whop's profit from platform balance transfers.
    public let transfer: Nullable<Float>
    /// The caller's share of Whop's profit from withdrawals.
    public let withdrawal: Nullable<Float>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        adSpend: Nullable<Float>,
        cardInterchange: Nullable<Float>,
        sales: Nullable<Float>,
        transfer: Nullable<Float>,
        withdrawal: Nullable<Float>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.adSpend = adSpend
        self.cardInterchange = cardInterchange
        self.sales = sales
        self.transfer = transfer
        self.withdrawal = withdrawal
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adSpend = try container.decode(Nullable<Float>.self, forKey: .adSpend)
        self.cardInterchange = try container.decode(Nullable<Float>.self, forKey: .cardInterchange)
        self.sales = try container.decode(Nullable<Float>.self, forKey: .sales)
        self.transfer = try container.decode(Nullable<Float>.self, forKey: .transfer)
        self.withdrawal = try container.decode(Nullable<Float>.self, forKey: .withdrawal)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.adSpend, forKey: .adSpend)
        try container.encode(self.cardInterchange, forKey: .cardInterchange)
        try container.encode(self.sales, forKey: .sales)
        try container.encode(self.transfer, forKey: .transfer)
        try container.encode(self.withdrawal, forKey: .withdrawal)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case adSpend = "ad_spend"
        case cardInterchange = "card_interchange"
        case sales
        case transfer
        case withdrawal
    }
}