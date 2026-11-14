import Foundation

public struct PlatformTrendsReportsResponseDataReportsItemWindow: Codable, Hashable, Sendable {
    /// Always `null` for a range window.
    public let asOf: Nullable<String>
    /// Start of the data that answered the window, as an ISO 8601 timestamp. `null` for `all_time`.
    public let from: Nullable<String>
    /// The window as requested, such as `30d` or `prev:7d`.
    public let key: String
    /// Always `range` for this report.
    public let kind: PlatformTrendsReportsResponseDataReportsItemWindowKind
    /// The zone the window's boundaries fall in.
    public let timeZone: String
    /// End of the data that answered the window, exclusive, as an ISO 8601 timestamp.
    public let to: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        asOf: Nullable<String>,
        from: Nullable<String>,
        key: String,
        kind: PlatformTrendsReportsResponseDataReportsItemWindowKind,
        timeZone: String,
        to: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.asOf = asOf
        self.from = from
        self.key = key
        self.kind = kind
        self.timeZone = timeZone
        self.to = to
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.asOf = try container.decode(Nullable<String>.self, forKey: .asOf)
        self.from = try container.decode(Nullable<String>.self, forKey: .from)
        self.key = try container.decode(String.self, forKey: .key)
        self.kind = try container.decode(PlatformTrendsReportsResponseDataReportsItemWindowKind.self, forKey: .kind)
        self.timeZone = try container.decode(String.self, forKey: .timeZone)
        self.to = try container.decode(Nullable<String>.self, forKey: .to)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.asOf, forKey: .asOf)
        try container.encode(self.from, forKey: .from)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.kind, forKey: .kind)
        try container.encode(self.timeZone, forKey: .timeZone)
        try container.encode(self.to, forKey: .to)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case asOf = "as_of"
        case from
        case key
        case kind
        case timeZone = "time_zone"
        case to
    }
}