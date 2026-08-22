import Foundation

/// Tracking and attribution context.
public struct CreateEventsRequestContext: Codable, Hashable, Sendable {
    /// Ad campaign ID.
    public let adCampaignId: Nullable<String>?
    /// Ad ID.
    public let adId: Nullable<String>?
    /// Ad set ID.
    public let adSetId: Nullable<String>?
    /// Facebook click cookie (_fbc, format fb.1.{timestamp}.{fbclid}).
    public let fbc: Nullable<String>?
    /// Facebook click ID.
    public let fbclid: Nullable<String>?
    /// Facebook browser pixel ID.
    public let fbp: Nullable<String>?
    /// Client-side device fingerprint.
    public let fingerprint: Nullable<String>?
    /// Confidence score (0-1) for the device fingerprint.
    public let fingerprintConfidence: Nullable<Double>?
    /// Google Analytics client ID.
    public let ga: Nullable<String>?
    /// Google Ads gbraid click ID (iOS privacy).
    public let gbraid: Nullable<String>?
    /// Google click ID.
    public let gclid: Nullable<String>?
    /// Instagram session ID.
    public let igSid: Nullable<String>?
    /// IP address.
    public let ipAddress: Nullable<String>?
    /// Browser language (e.g. en-US).
    public let language: Nullable<String>?
    /// LinkedIn click ID.
    public let liFatId: Nullable<String>?
    /// Microsoft Advertising (Bing) click ID.
    public let msclkid: Nullable<String>?
    /// Reddit click ID.
    public let rdtCid: Nullable<String>?
    /// Snapchat click ID.
    public let sccid: Nullable<String>?
    /// Screen resolution (e.g. 1920x1080).
    public let screenResolution: Nullable<String>?
    /// IANA timezone (e.g. America/New_York).
    public let timezone: Nullable<String>?
    /// TikTok click ID.
    public let ttclid: Nullable<String>?
    /// TikTok pixel ID.
    public let ttp: Nullable<String>?
    /// X (Twitter) click ID.
    public let twclid: Nullable<String>?
    /// Browser user agent string.
    public let userAgent: Nullable<String>?
    /// UTM campaign parameter.
    public let utmCampaign: Nullable<String>?
    /// UTM content parameter.
    public let utmContent: Nullable<String>?
    /// UTM ID parameter.
    public let utmId: Nullable<String>?
    /// UTM medium parameter.
    public let utmMedium: Nullable<String>?
    /// UTM source parameter.
    public let utmSource: Nullable<String>?
    /// UTM term parameter.
    public let utmTerm: Nullable<String>?
    /// Google Ads wbraid click ID (iOS privacy).
    public let wbraid: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        adCampaignId: Nullable<String>? = nil,
        adId: Nullable<String>? = nil,
        adSetId: Nullable<String>? = nil,
        fbc: Nullable<String>? = nil,
        fbclid: Nullable<String>? = nil,
        fbp: Nullable<String>? = nil,
        fingerprint: Nullable<String>? = nil,
        fingerprintConfidence: Nullable<Double>? = nil,
        ga: Nullable<String>? = nil,
        gbraid: Nullable<String>? = nil,
        gclid: Nullable<String>? = nil,
        igSid: Nullable<String>? = nil,
        ipAddress: Nullable<String>? = nil,
        language: Nullable<String>? = nil,
        liFatId: Nullable<String>? = nil,
        msclkid: Nullable<String>? = nil,
        rdtCid: Nullable<String>? = nil,
        sccid: Nullable<String>? = nil,
        screenResolution: Nullable<String>? = nil,
        timezone: Nullable<String>? = nil,
        ttclid: Nullable<String>? = nil,
        ttp: Nullable<String>? = nil,
        twclid: Nullable<String>? = nil,
        userAgent: Nullable<String>? = nil,
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
        self.fbc = fbc
        self.fbclid = fbclid
        self.fbp = fbp
        self.fingerprint = fingerprint
        self.fingerprintConfidence = fingerprintConfidence
        self.ga = ga
        self.gbraid = gbraid
        self.gclid = gclid
        self.igSid = igSid
        self.ipAddress = ipAddress
        self.language = language
        self.liFatId = liFatId
        self.msclkid = msclkid
        self.rdtCid = rdtCid
        self.sccid = sccid
        self.screenResolution = screenResolution
        self.timezone = timezone
        self.ttclid = ttclid
        self.ttp = ttp
        self.twclid = twclid
        self.userAgent = userAgent
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
        self.fbc = try container.decodeNullableIfPresent(String.self, forKey: .fbc)
        self.fbclid = try container.decodeNullableIfPresent(String.self, forKey: .fbclid)
        self.fbp = try container.decodeNullableIfPresent(String.self, forKey: .fbp)
        self.fingerprint = try container.decodeNullableIfPresent(String.self, forKey: .fingerprint)
        self.fingerprintConfidence = try container.decodeNullableIfPresent(Double.self, forKey: .fingerprintConfidence)
        self.ga = try container.decodeNullableIfPresent(String.self, forKey: .ga)
        self.gbraid = try container.decodeNullableIfPresent(String.self, forKey: .gbraid)
        self.gclid = try container.decodeNullableIfPresent(String.self, forKey: .gclid)
        self.igSid = try container.decodeNullableIfPresent(String.self, forKey: .igSid)
        self.ipAddress = try container.decodeNullableIfPresent(String.self, forKey: .ipAddress)
        self.language = try container.decodeNullableIfPresent(String.self, forKey: .language)
        self.liFatId = try container.decodeNullableIfPresent(String.self, forKey: .liFatId)
        self.msclkid = try container.decodeNullableIfPresent(String.self, forKey: .msclkid)
        self.rdtCid = try container.decodeNullableIfPresent(String.self, forKey: .rdtCid)
        self.sccid = try container.decodeNullableIfPresent(String.self, forKey: .sccid)
        self.screenResolution = try container.decodeNullableIfPresent(String.self, forKey: .screenResolution)
        self.timezone = try container.decodeNullableIfPresent(String.self, forKey: .timezone)
        self.ttclid = try container.decodeNullableIfPresent(String.self, forKey: .ttclid)
        self.ttp = try container.decodeNullableIfPresent(String.self, forKey: .ttp)
        self.twclid = try container.decodeNullableIfPresent(String.self, forKey: .twclid)
        self.userAgent = try container.decodeNullableIfPresent(String.self, forKey: .userAgent)
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
        try container.encodeNullableIfPresent(self.fbc, forKey: .fbc)
        try container.encodeNullableIfPresent(self.fbclid, forKey: .fbclid)
        try container.encodeNullableIfPresent(self.fbp, forKey: .fbp)
        try container.encodeNullableIfPresent(self.fingerprint, forKey: .fingerprint)
        try container.encodeNullableIfPresent(self.fingerprintConfidence, forKey: .fingerprintConfidence)
        try container.encodeNullableIfPresent(self.ga, forKey: .ga)
        try container.encodeNullableIfPresent(self.gbraid, forKey: .gbraid)
        try container.encodeNullableIfPresent(self.gclid, forKey: .gclid)
        try container.encodeNullableIfPresent(self.igSid, forKey: .igSid)
        try container.encodeNullableIfPresent(self.ipAddress, forKey: .ipAddress)
        try container.encodeNullableIfPresent(self.language, forKey: .language)
        try container.encodeNullableIfPresent(self.liFatId, forKey: .liFatId)
        try container.encodeNullableIfPresent(self.msclkid, forKey: .msclkid)
        try container.encodeNullableIfPresent(self.rdtCid, forKey: .rdtCid)
        try container.encodeNullableIfPresent(self.sccid, forKey: .sccid)
        try container.encodeNullableIfPresent(self.screenResolution, forKey: .screenResolution)
        try container.encodeNullableIfPresent(self.timezone, forKey: .timezone)
        try container.encodeNullableIfPresent(self.ttclid, forKey: .ttclid)
        try container.encodeNullableIfPresent(self.ttp, forKey: .ttp)
        try container.encodeNullableIfPresent(self.twclid, forKey: .twclid)
        try container.encodeNullableIfPresent(self.userAgent, forKey: .userAgent)
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
        case fbc
        case fbclid
        case fbp
        case fingerprint
        case fingerprintConfidence = "fingerprint_confidence"
        case ga
        case gbraid
        case gclid
        case igSid = "ig_sid"
        case ipAddress = "ip_address"
        case language
        case liFatId = "li_fat_id"
        case msclkid
        case rdtCid = "rdt_cid"
        case sccid
        case screenResolution = "screen_resolution"
        case timezone
        case ttclid
        case ttp
        case twclid
        case userAgent = "user_agent"
        case utmCampaign = "utm_campaign"
        case utmContent = "utm_content"
        case utmId = "utm_id"
        case utmMedium = "utm_medium"
        case utmSource = "utm_source"
        case utmTerm = "utm_term"
        case wbraid
    }
}