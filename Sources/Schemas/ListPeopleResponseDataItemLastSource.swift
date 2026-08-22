import Foundation

/// Where a visit came from: a whop ad click, a lead form, an external ad, or a referring site.
public struct ListPeopleResponseDataItemLastSource: Codable, Hashable, Sendable {
    public let ad: Nullable<ListPeopleResponseDataItemLastSourceAd>?
    public let adGroup: Nullable<ListPeopleResponseDataItemLastSourceAdGroup>?
    public let campaign: Nullable<ListPeopleResponseDataItemLastSourceCampaign>?
    public let domain: Nullable<String>?
    public let occurredAt: Nullable<Date>?
    public let platform: Nullable<String>?
    public let type: ListPeopleResponseDataItemLastSourceType
    public let utmSource: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        ad: Nullable<ListPeopleResponseDataItemLastSourceAd>? = nil,
        adGroup: Nullable<ListPeopleResponseDataItemLastSourceAdGroup>? = nil,
        campaign: Nullable<ListPeopleResponseDataItemLastSourceCampaign>? = nil,
        domain: Nullable<String>? = nil,
        occurredAt: Nullable<Date>? = nil,
        platform: Nullable<String>? = nil,
        type: ListPeopleResponseDataItemLastSourceType,
        utmSource: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.ad = ad
        self.adGroup = adGroup
        self.campaign = campaign
        self.domain = domain
        self.occurredAt = occurredAt
        self.platform = platform
        self.type = type
        self.utmSource = utmSource
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ad = try container.decodeNullableIfPresent(ListPeopleResponseDataItemLastSourceAd.self, forKey: .ad)
        self.adGroup = try container.decodeNullableIfPresent(ListPeopleResponseDataItemLastSourceAdGroup.self, forKey: .adGroup)
        self.campaign = try container.decodeNullableIfPresent(ListPeopleResponseDataItemLastSourceCampaign.self, forKey: .campaign)
        self.domain = try container.decodeNullableIfPresent(String.self, forKey: .domain)
        self.occurredAt = try container.decodeNullableIfPresent(Date.self, forKey: .occurredAt)
        self.platform = try container.decodeNullableIfPresent(String.self, forKey: .platform)
        self.type = try container.decode(ListPeopleResponseDataItemLastSourceType.self, forKey: .type)
        self.utmSource = try container.decodeNullableIfPresent(String.self, forKey: .utmSource)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.ad, forKey: .ad)
        try container.encodeNullableIfPresent(self.adGroup, forKey: .adGroup)
        try container.encodeNullableIfPresent(self.campaign, forKey: .campaign)
        try container.encodeNullableIfPresent(self.domain, forKey: .domain)
        try container.encodeNullableIfPresent(self.occurredAt, forKey: .occurredAt)
        try container.encodeNullableIfPresent(self.platform, forKey: .platform)
        try container.encode(self.type, forKey: .type)
        try container.encodeNullableIfPresent(self.utmSource, forKey: .utmSource)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case ad
        case adGroup = "ad_group"
        case campaign
        case domain
        case occurredAt = "occurred_at"
        case platform
        case type
        case utmSource = "utm_source"
    }
}