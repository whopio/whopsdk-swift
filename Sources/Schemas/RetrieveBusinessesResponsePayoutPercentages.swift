import Foundation

/// The commission rate this referral pays for each income source, as a fraction (0.3 = 30%). A solo partner earns it directly; the team of a referring partner business splits it by their shares.
public struct RetrieveBusinessesResponsePayoutPercentages: Codable, Hashable, Sendable {
    /// Share of the referred business's Whop Ads spend.
    public let adSpend: Nullable<Float>
    /// Share of Whop's profit from card interchange.
    public let cardInterchange: Nullable<Float>
    /// Share of Whop's profit from product sales.
    public let sales: Float
    /// Share of Whop's profit from platform balance transfers.
    public let transfer: Nullable<Float>
    /// Share of Whop's profit from withdrawals.
    public let withdrawal: Nullable<Float>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        adSpend: Nullable<Float>,
        cardInterchange: Nullable<Float>,
        sales: Float,
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
        self.sales = try container.decode(Float.self, forKey: .sales)
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