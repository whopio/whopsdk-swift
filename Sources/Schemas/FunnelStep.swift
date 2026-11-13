import Foundation

public struct FunnelStep: Codable, Hashable, Sendable {
    /// The Whop app build ID attached to the event. Comma-separated alternatives are ORed; different filters are ANDed.
    public let appBuildId: String?
    /// The event's app id. Comma-separated alternatives are ORed; different filters are ANDed.
    public let appId: String?
    /// The event's browser. Comma-separated alternatives are ORed; different filters are ANDed.
    public let browser: String?
    /// The event's city. Comma-separated alternatives are ORed; different filters are ANDed.
    public let city: String?
    /// The event's country. Comma-separated alternatives are ORed; different filters are ANDed.
    public let country: String?
    /// The custom event name. Requires event=pixel.custom. Comma-separated alternatives are ORed; different filters are ANDed.
    public let customName: String?
    /// The event's device. Comma-separated alternatives are ORed; different filters are ANDed.
    public let device: String?
    /// The event name, such as pixel.page, pixel.custom, experiment.exposure, or payment.completed. Exactly one event per step.
    public let event: String
    /// An experiment ID owned by account_id. Requires event=experiment.exposure. Comma-separated alternatives are ORed; different filters are ANDed.
    public let experimentId: String?
    /// The event's hostname. Comma-separated alternatives are ORed; different filters are ANDed.
    public let hostname: String?
    /// The event's os. Comma-separated alternatives are ORed; different filters are ANDed.
    public let os: String?
    /// The URL pathname. Use * to match zero or more characters, including slashes. Other characters match literally. Missing pages do not match. Comma-separated alternatives are ORed; different filters are ANDed.
    public let page: String?
    /// The plan ID attached to the event. Comma-separated alternatives are ORed; different filters are ANDed.
    public let planId: String?
    /// The product ID attached to the event. Comma-separated alternatives are ORed; different filters are ANDed.
    public let productId: String?
    /// The Whop ad-click source of this page view, not conversion attribution. Use whop:* for any Whop ad click, whop:<campaign>:* for a campaign, or whop:<campaign>:<group>:<ad> for an exact ad. Only ad-click page-view events support source. With breakdown_by=source, trailing :* levels select campaign, ad-group, or ad detail. Comma-separated alternatives are ORed; different filters are ANDed.
    public let source: String?
    /// The event's utm source. Comma-separated alternatives are ORed; different filters are ANDed.
    public let utmSource: String?
    /// The exposed variant name. Requires event=experiment.exposure. Comma-separated alternatives are ORed; different filters are ANDed.
    public let variant: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        appBuildId: String? = nil,
        appId: String? = nil,
        browser: String? = nil,
        city: String? = nil,
        country: String? = nil,
        customName: String? = nil,
        device: String? = nil,
        event: String,
        experimentId: String? = nil,
        hostname: String? = nil,
        os: String? = nil,
        page: String? = nil,
        planId: String? = nil,
        productId: String? = nil,
        source: String? = nil,
        utmSource: String? = nil,
        variant: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.appBuildId = appBuildId
        self.appId = appId
        self.browser = browser
        self.city = city
        self.country = country
        self.customName = customName
        self.device = device
        self.event = event
        self.experimentId = experimentId
        self.hostname = hostname
        self.os = os
        self.page = page
        self.planId = planId
        self.productId = productId
        self.source = source
        self.utmSource = utmSource
        self.variant = variant
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.appBuildId = try container.decodeIfPresent(String.self, forKey: .appBuildId)
        self.appId = try container.decodeIfPresent(String.self, forKey: .appId)
        self.browser = try container.decodeIfPresent(String.self, forKey: .browser)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.customName = try container.decodeIfPresent(String.self, forKey: .customName)
        self.device = try container.decodeIfPresent(String.self, forKey: .device)
        self.event = try container.decode(String.self, forKey: .event)
        self.experimentId = try container.decodeIfPresent(String.self, forKey: .experimentId)
        self.hostname = try container.decodeIfPresent(String.self, forKey: .hostname)
        self.os = try container.decodeIfPresent(String.self, forKey: .os)
        self.page = try container.decodeIfPresent(String.self, forKey: .page)
        self.planId = try container.decodeIfPresent(String.self, forKey: .planId)
        self.productId = try container.decodeIfPresent(String.self, forKey: .productId)
        self.source = try container.decodeIfPresent(String.self, forKey: .source)
        self.utmSource = try container.decodeIfPresent(String.self, forKey: .utmSource)
        self.variant = try container.decodeIfPresent(String.self, forKey: .variant)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.appBuildId, forKey: .appBuildId)
        try container.encodeIfPresent(self.appId, forKey: .appId)
        try container.encodeIfPresent(self.browser, forKey: .browser)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.customName, forKey: .customName)
        try container.encodeIfPresent(self.device, forKey: .device)
        try container.encode(self.event, forKey: .event)
        try container.encodeIfPresent(self.experimentId, forKey: .experimentId)
        try container.encodeIfPresent(self.hostname, forKey: .hostname)
        try container.encodeIfPresent(self.os, forKey: .os)
        try container.encodeIfPresent(self.page, forKey: .page)
        try container.encodeIfPresent(self.planId, forKey: .planId)
        try container.encodeIfPresent(self.productId, forKey: .productId)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.utmSource, forKey: .utmSource)
        try container.encodeIfPresent(self.variant, forKey: .variant)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case appBuildId = "app_build_id"
        case appId = "app_id"
        case browser
        case city
        case country
        case customName = "custom_name"
        case device
        case event
        case experimentId = "experiment_id"
        case hostname
        case os
        case page
        case planId = "plan_id"
        case productId = "product_id"
        case source
        case utmSource = "utm_source"
        case variant
    }
}