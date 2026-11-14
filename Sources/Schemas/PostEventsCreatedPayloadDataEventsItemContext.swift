import Foundation

/// UTM parameters, ad click ids and ad ids, as the page reported them. Keys the event did not carry are left out.
public struct PostEventsCreatedPayloadDataEventsItemContext: Codable, Hashable, Sendable {
    public let adCampaignId: Nullable<String>?
    public let adId: Nullable<String>?
    public let adSetId: Nullable<String>?
    public let fbclid: Nullable<String>?
    public let gbraid: Nullable<String>?
    public let gclid: Nullable<String>?
    public let igSid: Nullable<String>?
    public let liFatId: Nullable<String>?
    public let msclkid: Nullable<String>?
    public let rdtCid: Nullable<String>?
    public let sccid: Nullable<String>?
    public let ttclid: Nullable<String>?
    public let twclid: Nullable<String>?
    public let utmCampaign: Nullable<String>?
    public let utmContent: Nullable<String>?
    public let utmId: Nullable<String>?
    public let utmMedium: Nullable<String>?
    public let utmSource: Nullable<String>?
    public let utmTerm: Nullable<String>?
    public let wbraid: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        adCampaignId: Nullable<String>? = nil,
        adId: Nullable<String>? = nil,
        adSetId: Nullable<String>? = nil,
        fbclid: Nullable<String>? = nil,
        gbraid: Nullable<String>? = nil,
        gclid: Nullable<String>? = nil,
        igSid: Nullable<String>? = nil,
        liFatId: Nullable<String>? = nil,
        msclkid: Nullable<String>? = nil,
        rdtCid: Nullable<String>? = nil,
        sccid: Nullable<String>? = nil,
        ttclid: Nullable<String>? = nil,
        twclid: Nullable<String>? = nil,
        utmCampaign: Nullable<String>? = nil,
        utmContent: Nullable<String>? = nil,
        utmId: Nullable<String>? = nil,
        utmMedium: Nullable<String>? = nil,
        utmSource: Nullable<String>? = nil,
        utmTerm: Nullable<String>? = nil,
        wbraid: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.adCampaignId = adCampaignId
        self.adId = adId
        self.adSetId = adSetId
        self.fbclid = fbclid
        self.gbraid = gbraid
        self.gclid = gclid
        self.igSid = igSid
        self.liFatId = liFatId
        self.msclkid = msclkid
        self.rdtCid = rdtCid
        self.sccid = sccid
        self.ttclid = ttclid
        self.twclid = twclid
        self.utmCampaign = utmCampaign
        self.utmContent = utmContent
        self.utmId = utmId
        self.utmMedium = utmMedium
        self.utmSource = utmSource
        self.utmTerm = utmTerm
        self.wbraid = wbraid
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adCampaignId = try container.decodeNullableIfPresent(String.self, forKey: .adCampaignId)
        self.adId = try container.decodeNullableIfPresent(String.self, forKey: .adId)
        self.adSetId = try container.decodeNullableIfPresent(String.self, forKey: .adSetId)
        self.fbclid = try container.decodeNullableIfPresent(String.self, forKey: .fbclid)
        self.gbraid = try container.decodeNullableIfPresent(String.self, forKey: .gbraid)
        self.gclid = try container.decodeNullableIfPresent(String.self, forKey: .gclid)
        self.igSid = try container.decodeNullableIfPresent(String.self, forKey: .igSid)
        self.liFatId = try container.decodeNullableIfPresent(String.self, forKey: .liFatId)
        self.msclkid = try container.decodeNullableIfPresent(String.self, forKey: .msclkid)
        self.rdtCid = try container.decodeNullableIfPresent(String.self, forKey: .rdtCid)
        self.sccid = try container.decodeNullableIfPresent(String.self, forKey: .sccid)
        self.ttclid = try container.decodeNullableIfPresent(String.self, forKey: .ttclid)
        self.twclid = try container.decodeNullableIfPresent(String.self, forKey: .twclid)
        self.utmCampaign = try container.decodeNullableIfPresent(String.self, forKey: .utmCampaign)
        self.utmContent = try container.decodeNullableIfPresent(String.self, forKey: .utmContent)
        self.utmId = try container.decodeNullableIfPresent(String.self, forKey: .utmId)
        self.utmMedium = try container.decodeNullableIfPresent(String.self, forKey: .utmMedium)
        self.utmSource = try container.decodeNullableIfPresent(String.self, forKey: .utmSource)
        self.utmTerm = try container.decodeNullableIfPresent(String.self, forKey: .utmTerm)
        self.wbraid = try container.decodeNullableIfPresent(String.self, forKey: .wbraid)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.adCampaignId, forKey: .adCampaignId)
        try container.encodeNullableIfPresent(self.adId, forKey: .adId)
        try container.encodeNullableIfPresent(self.adSetId, forKey: .adSetId)
        try container.encodeNullableIfPresent(self.fbclid, forKey: .fbclid)
        try container.encodeNullableIfPresent(self.gbraid, forKey: .gbraid)
        try container.encodeNullableIfPresent(self.gclid, forKey: .gclid)
        try container.encodeNullableIfPresent(self.igSid, forKey: .igSid)
        try container.encodeNullableIfPresent(self.liFatId, forKey: .liFatId)
        try container.encodeNullableIfPresent(self.msclkid, forKey: .msclkid)
        try container.encodeNullableIfPresent(self.rdtCid, forKey: .rdtCid)
        try container.encodeNullableIfPresent(self.sccid, forKey: .sccid)
        try container.encodeNullableIfPresent(self.ttclid, forKey: .ttclid)
        try container.encodeNullableIfPresent(self.twclid, forKey: .twclid)
        try container.encodeNullableIfPresent(self.utmCampaign, forKey: .utmCampaign)
        try container.encodeNullableIfPresent(self.utmContent, forKey: .utmContent)
        try container.encodeNullableIfPresent(self.utmId, forKey: .utmId)
        try container.encodeNullableIfPresent(self.utmMedium, forKey: .utmMedium)
        try container.encodeNullableIfPresent(self.utmSource, forKey: .utmSource)
        try container.encodeNullableIfPresent(self.utmTerm, forKey: .utmTerm)
        try container.encodeNullableIfPresent(self.wbraid, forKey: .wbraid)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case adCampaignId = "ad_campaign_id"
        case adId = "ad_id"
        case adSetId = "ad_set_id"
        case fbclid
        case gbraid
        case gclid
        case igSid = "ig_sid"
        case liFatId = "li_fat_id"
        case msclkid
        case rdtCid = "rdt_cid"
        case sccid
        case ttclid
        case twclid
        case utmCampaign = "utm_campaign"
        case utmContent = "utm_content"
        case utmId = "utm_id"
        case utmMedium = "utm_medium"
        case utmSource = "utm_source"
        case utmTerm = "utm_term"
        case wbraid
    }
}