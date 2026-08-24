import Foundation

/// Exact usage breakdowns for the person's browser traffic (distinct events per value).
public struct RetrievePeopleResponseUsage: Codable, Hashable, Sendable {
    public let browser: [RetrievePeopleResponseUsageBrowserItem]?
    public let city: [RetrievePeopleResponseUsageCityItem]?
    public let country: [RetrievePeopleResponseUsageCountryItem]?
    public let device: [RetrievePeopleResponseUsageDeviceItem]?
    public let ip: [RetrievePeopleResponseUsageIpItem]?
    public let os: [RetrievePeopleResponseUsageOsItem]?
    public let referrer: [RetrievePeopleResponseUsageReferrerItem]?
    public let timezone: [RetrievePeopleResponseUsageTimezoneItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        browser: [RetrievePeopleResponseUsageBrowserItem]? = nil,
        city: [RetrievePeopleResponseUsageCityItem]? = nil,
        country: [RetrievePeopleResponseUsageCountryItem]? = nil,
        device: [RetrievePeopleResponseUsageDeviceItem]? = nil,
        ip: [RetrievePeopleResponseUsageIpItem]? = nil,
        os: [RetrievePeopleResponseUsageOsItem]? = nil,
        referrer: [RetrievePeopleResponseUsageReferrerItem]? = nil,
        timezone: [RetrievePeopleResponseUsageTimezoneItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.browser = browser
        self.city = city
        self.country = country
        self.device = device
        self.ip = ip
        self.os = os
        self.referrer = referrer
        self.timezone = timezone
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.browser = try container.decodeIfPresent([RetrievePeopleResponseUsageBrowserItem].self, forKey: .browser)
        self.city = try container.decodeIfPresent([RetrievePeopleResponseUsageCityItem].self, forKey: .city)
        self.country = try container.decodeIfPresent([RetrievePeopleResponseUsageCountryItem].self, forKey: .country)
        self.device = try container.decodeIfPresent([RetrievePeopleResponseUsageDeviceItem].self, forKey: .device)
        self.ip = try container.decodeIfPresent([RetrievePeopleResponseUsageIpItem].self, forKey: .ip)
        self.os = try container.decodeIfPresent([RetrievePeopleResponseUsageOsItem].self, forKey: .os)
        self.referrer = try container.decodeIfPresent([RetrievePeopleResponseUsageReferrerItem].self, forKey: .referrer)
        self.timezone = try container.decodeIfPresent([RetrievePeopleResponseUsageTimezoneItem].self, forKey: .timezone)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.browser, forKey: .browser)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.device, forKey: .device)
        try container.encodeIfPresent(self.ip, forKey: .ip)
        try container.encodeIfPresent(self.os, forKey: .os)
        try container.encodeIfPresent(self.referrer, forKey: .referrer)
        try container.encodeIfPresent(self.timezone, forKey: .timezone)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case browser
        case city
        case country
        case device
        case ip
        case os
        case referrer
        case timezone
    }
}