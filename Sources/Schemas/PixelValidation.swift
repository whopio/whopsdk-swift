import Foundation

public struct PixelValidation: Codable, Hashable, Sendable {
    /// Whether an affiliate tracking SDK was found on the page at `url`. Supported platforms: Everflow.
    public let affiliateTrackingDetected: Bool
    /// False when the event lookup failed, meaning `host_events` and `last_seen_days` are incomplete.
    public let firingDataOk: Bool
    public let hostEvents: [String]
    /// Whether the pixel was seen. Without a `url` this answers for the whole account: true when it has sent events recently. With a `url` it answers for THAT page only — true when the page is hosted on Whop, when the page itself has sent events recently, or when the pixel was found in its source. Events the account sent from other pages do not make a given `url` installed.
    public let installed: Bool
    /// Event name to whole days since that event last fired, e.g. `{ "lead": 3 }`. Carries events that fired too long ago to count as installed, so you can prompt to re-check rather than report them missing.
    public let lastFiredDays: [String: JSONValue]
    /// Days since the pixel last sent an event, within a 30-day window. `null` when it hasn't sent one in that window — which includes a pixel installed moments ago.
    public let lastSeenDays: Nullable<Double>
    /// True when `url` is hosted on Whop, so no pixel snippet is required.
    public let nativeTracking: Bool
    public let pageEvents: [String]
    /// Whether the page could be loaded. `null` when the request included no URL, and `true` when events settled the answer without a fetch.
    public let reachable: Nullable<Bool>
    /// The URL that was checked, after normalization. `null` when the request didn't include one.
    public let url: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        affiliateTrackingDetected: Bool,
        firingDataOk: Bool,
        hostEvents: [String],
        installed: Bool,
        lastFiredDays: [String: JSONValue],
        lastSeenDays: Nullable<Double>,
        nativeTracking: Bool,
        pageEvents: [String],
        reachable: Nullable<Bool>,
        url: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.affiliateTrackingDetected = affiliateTrackingDetected
        self.firingDataOk = firingDataOk
        self.hostEvents = hostEvents
        self.installed = installed
        self.lastFiredDays = lastFiredDays
        self.lastSeenDays = lastSeenDays
        self.nativeTracking = nativeTracking
        self.pageEvents = pageEvents
        self.reachable = reachable
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.affiliateTrackingDetected = try container.decode(Bool.self, forKey: .affiliateTrackingDetected)
        self.firingDataOk = try container.decode(Bool.self, forKey: .firingDataOk)
        self.hostEvents = try container.decode([String].self, forKey: .hostEvents)
        self.installed = try container.decode(Bool.self, forKey: .installed)
        self.lastFiredDays = try container.decode([String: JSONValue].self, forKey: .lastFiredDays)
        self.lastSeenDays = try container.decode(Nullable<Double>.self, forKey: .lastSeenDays)
        self.nativeTracking = try container.decode(Bool.self, forKey: .nativeTracking)
        self.pageEvents = try container.decode([String].self, forKey: .pageEvents)
        self.reachable = try container.decode(Nullable<Bool>.self, forKey: .reachable)
        self.url = try container.decode(Nullable<String>.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.affiliateTrackingDetected, forKey: .affiliateTrackingDetected)
        try container.encode(self.firingDataOk, forKey: .firingDataOk)
        try container.encode(self.hostEvents, forKey: .hostEvents)
        try container.encode(self.installed, forKey: .installed)
        try container.encode(self.lastFiredDays, forKey: .lastFiredDays)
        try container.encode(self.lastSeenDays, forKey: .lastSeenDays)
        try container.encode(self.nativeTracking, forKey: .nativeTracking)
        try container.encode(self.pageEvents, forKey: .pageEvents)
        try container.encode(self.reachable, forKey: .reachable)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case affiliateTrackingDetected = "affiliate_tracking_detected"
        case firingDataOk = "firing_data_ok"
        case hostEvents = "host_events"
        case installed
        case lastFiredDays = "last_fired_days"
        case lastSeenDays = "last_seen_days"
        case nativeTracking = "native_tracking"
        case pageEvents = "page_events"
        case reachable
        case url
    }
}