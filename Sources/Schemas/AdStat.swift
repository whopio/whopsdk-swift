import Foundation

public struct AdStat: Codable, Hashable, Sendable {
    /// The ID of the ad's campaign, prefixed `adcamp_`.
    public let adCampaignId: String
    /// The ID of the ad's ad group, prefixed `adgrp_`.
    public let adGroupId: String
    /// The ad's ID, prefixed `ad_`, as sent.
    public let adId: String
    /// Always 0. Whop stores no clicks for a runner's hour: an ad's clicks are its Whop pixel page views, counted when its stats are shown.
    public let clicks: Int
    /// Start of the hour, as an ISO 8601 timestamp.
    public let hourStartedAt: String
    /// The ad's impressions in the hour.
    public let impressions: Int
    /// The spend recorded and paid for the ad in the hour, exactly as reported.
    public let spend: Money
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        adCampaignId: String,
        adGroupId: String,
        adId: String,
        clicks: Int,
        hourStartedAt: String,
        impressions: Int,
        spend: Money,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.adCampaignId = adCampaignId
        self.adGroupId = adGroupId
        self.adId = adId
        self.clicks = clicks
        self.hourStartedAt = hourStartedAt
        self.impressions = impressions
        self.spend = spend
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adCampaignId = try container.decode(String.self, forKey: .adCampaignId)
        self.adGroupId = try container.decode(String.self, forKey: .adGroupId)
        self.adId = try container.decode(String.self, forKey: .adId)
        self.clicks = try container.decode(Int.self, forKey: .clicks)
        self.hourStartedAt = try container.decode(String.self, forKey: .hourStartedAt)
        self.impressions = try container.decode(Int.self, forKey: .impressions)
        self.spend = try container.decode(Money.self, forKey: .spend)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.adCampaignId, forKey: .adCampaignId)
        try container.encode(self.adGroupId, forKey: .adGroupId)
        try container.encode(self.adId, forKey: .adId)
        try container.encode(self.clicks, forKey: .clicks)
        try container.encode(self.hourStartedAt, forKey: .hourStartedAt)
        try container.encode(self.impressions, forKey: .impressions)
        try container.encode(self.spend, forKey: .spend)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case adCampaignId = "ad_campaign_id"
        case adGroupId = "ad_group_id"
        case adId = "ad_id"
        case clicks
        case hourStartedAt = "hour_started_at"
        case impressions
        case spend
    }
}