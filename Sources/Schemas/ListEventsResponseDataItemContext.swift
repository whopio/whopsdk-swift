import Foundation

public struct ListEventsResponseDataItemContext: Codable, Hashable, Sendable {
    public let adCampaignId: Nullable<String>?
    /// Stable identity for the ad click this event belongs to. Every event from one click carries the same value, so events group into clicks without re-deriving them.
    public let adClickId: Nullable<String>?
    /// How the ad click was identified: the network's click-id param (`fbclid`, `ttclid`, `gclid`, `gbraid`, `wbraid`, `twclid`) or `synthetic` when the click carried none.
    public let adClickType: Nullable<String>?
    public let adId: Nullable<String>?
    public let adSetId: Nullable<String>?
    /// How this event counts as an acquisition touch, using the same rule attribution credits a conversion with. `ad_click` and `lead_form` resolved to a Whop ad; `external_ad_click` is a paid click on a campaign run outside Whop; `referrer` is organic. Null when the event is not a touch.
    public let sourceType: Nullable<ListEventsResponseDataItemContextSourceType>?
    public let utmCampaign: Nullable<String>?
    public let utmContent: Nullable<String>?
    public let utmMedium: Nullable<String>?
    public let utmSource: Nullable<String>?
    public let utmTerm: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        adCampaignId: Nullable<String>? = nil,
        adClickId: Nullable<String>? = nil,
        adClickType: Nullable<String>? = nil,
        adId: Nullable<String>? = nil,
        adSetId: Nullable<String>? = nil,
        sourceType: Nullable<ListEventsResponseDataItemContextSourceType>? = nil,
        utmCampaign: Nullable<String>? = nil,
        utmContent: Nullable<String>? = nil,
        utmMedium: Nullable<String>? = nil,
        utmSource: Nullable<String>? = nil,
        utmTerm: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.adCampaignId = adCampaignId
        self.adClickId = adClickId
        self.adClickType = adClickType
        self.adId = adId
        self.adSetId = adSetId
        self.sourceType = sourceType
        self.utmCampaign = utmCampaign
        self.utmContent = utmContent
        self.utmMedium = utmMedium
        self.utmSource = utmSource
        self.utmTerm = utmTerm
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adCampaignId = try container.decodeNullableIfPresent(String.self, forKey: .adCampaignId)
        self.adClickId = try container.decodeNullableIfPresent(String.self, forKey: .adClickId)
        self.adClickType = try container.decodeNullableIfPresent(String.self, forKey: .adClickType)
        self.adId = try container.decodeNullableIfPresent(String.self, forKey: .adId)
        self.adSetId = try container.decodeNullableIfPresent(String.self, forKey: .adSetId)
        self.sourceType = try container.decodeNullableIfPresent(ListEventsResponseDataItemContextSourceType.self, forKey: .sourceType)
        self.utmCampaign = try container.decodeNullableIfPresent(String.self, forKey: .utmCampaign)
        self.utmContent = try container.decodeNullableIfPresent(String.self, forKey: .utmContent)
        self.utmMedium = try container.decodeNullableIfPresent(String.self, forKey: .utmMedium)
        self.utmSource = try container.decodeNullableIfPresent(String.self, forKey: .utmSource)
        self.utmTerm = try container.decodeNullableIfPresent(String.self, forKey: .utmTerm)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.adCampaignId, forKey: .adCampaignId)
        try container.encodeNullableIfPresent(self.adClickId, forKey: .adClickId)
        try container.encodeNullableIfPresent(self.adClickType, forKey: .adClickType)
        try container.encodeNullableIfPresent(self.adId, forKey: .adId)
        try container.encodeNullableIfPresent(self.adSetId, forKey: .adSetId)
        try container.encodeNullableIfPresent(self.sourceType, forKey: .sourceType)
        try container.encodeNullableIfPresent(self.utmCampaign, forKey: .utmCampaign)
        try container.encodeNullableIfPresent(self.utmContent, forKey: .utmContent)
        try container.encodeNullableIfPresent(self.utmMedium, forKey: .utmMedium)
        try container.encodeNullableIfPresent(self.utmSource, forKey: .utmSource)
        try container.encodeNullableIfPresent(self.utmTerm, forKey: .utmTerm)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case adCampaignId = "ad_campaign_id"
        case adClickId = "ad_click_id"
        case adClickType = "ad_click_type"
        case adId = "ad_id"
        case adSetId = "ad_set_id"
        case sourceType = "source_type"
        case utmCampaign = "utm_campaign"
        case utmContent = "utm_content"
        case utmMedium = "utm_medium"
        case utmSource = "utm_source"
        case utmTerm = "utm_term"
    }
}