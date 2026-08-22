import Foundation

public struct ListStatsResponseDataItem: Codable, Hashable, Sendable {
    /// A short description of what the metric measures.
    public let description: String
    /// The metric's key. Pass it to GET /stats/{metric} to query its values.
    public let key: String
    /// Human-readable display name for the metric.
    public let name: String
    /// The properties you can use with this metric — pass one as a filter (property=value) to narrow the series, or as breakdown_by=property to split it.
    public let properties: [String]
    /// How to read the metric's values: count is an integer, currency is a decimal amount, and percent is a number where 1.6 means 1.6%.
    public let unit: ListStatsResponseDataItemUnit
    /// Snapshot metrics only: the trailing windows you can pass as snapshot_window, for example 30d. Absent on live metrics, which use from/to instead.
    public let windows: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        description: String,
        key: String,
        name: String,
        properties: [String],
        unit: ListStatsResponseDataItemUnit,
        windows: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.description = description
        self.key = key
        self.name = name
        self.properties = properties
        self.unit = unit
        self.windows = windows
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = try container.decode(String.self, forKey: .description)
        self.key = try container.decode(String.self, forKey: .key)
        self.name = try container.decode(String.self, forKey: .name)
        self.properties = try container.decode([String].self, forKey: .properties)
        self.unit = try container.decode(ListStatsResponseDataItemUnit.self, forKey: .unit)
        self.windows = try container.decodeIfPresent([String].self, forKey: .windows)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.properties, forKey: .properties)
        try container.encode(self.unit, forKey: .unit)
        try container.encodeIfPresent(self.windows, forKey: .windows)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case description
        case key
        case name
        case properties
        case unit
        case windows
    }
}