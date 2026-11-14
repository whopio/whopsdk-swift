import Foundation

public struct PlatformTrendsReportsResponseDataColumnsItem: Codable, Hashable, Sendable {
    /// Metrics only. How to combine the metric across rows.
    public let aggregate: PlatformTrendsReportsResponseDataColumnsItemAggregate?
    /// The column's key on each row.
    public let key: String
    /// The column's display name.
    public let name: String
    /// An attribute of the row, or a number measured over it.
    public let type: PlatformTrendsReportsResponseDataColumnsItemType
    /// Metrics only. Sets the value's JSON type.
    public let unit: PlatformTrendsReportsResponseDataColumnsItemUnit?
    /// Metrics only. The column an `average` metric is weighted by.
    public let weight: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        aggregate: PlatformTrendsReportsResponseDataColumnsItemAggregate? = nil,
        key: String,
        name: String,
        type: PlatformTrendsReportsResponseDataColumnsItemType,
        unit: PlatformTrendsReportsResponseDataColumnsItemUnit? = nil,
        weight: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.aggregate = aggregate
        self.key = key
        self.name = name
        self.type = type
        self.unit = unit
        self.weight = weight
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.aggregate = try container.decodeIfPresent(PlatformTrendsReportsResponseDataColumnsItemAggregate.self, forKey: .aggregate)
        self.key = try container.decode(String.self, forKey: .key)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(PlatformTrendsReportsResponseDataColumnsItemType.self, forKey: .type)
        self.unit = try container.decodeIfPresent(PlatformTrendsReportsResponseDataColumnsItemUnit.self, forKey: .unit)
        self.weight = try container.decodeNullableIfPresent(String.self, forKey: .weight)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.aggregate, forKey: .aggregate)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.unit, forKey: .unit)
        try container.encodeNullableIfPresent(self.weight, forKey: .weight)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case aggregate
        case key
        case name
        case type
        case unit
        case weight
    }
}