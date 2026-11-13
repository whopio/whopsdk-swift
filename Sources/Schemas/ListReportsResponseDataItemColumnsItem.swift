import Foundation

public struct ListReportsResponseDataItemColumnsItem: Codable, Hashable, Sendable {
    /// Metrics only. How to combine the metric across rows. `none` cannot be rebuilt from rows.
    public let aggregate: ListReportsResponseDataItemColumnsItemAggregate?
    /// Properties only. The breakdowns this property can ride along with.
    public let availableOn: [String]?
    /// Metrics only. The breakdowns the metric supports, or `null` for every one.
    public let breakdowns: Nullable<[String]>?
    /// Metrics only. Whether the metric is returned when `columns` is omitted.
    public let `default`: Bool?
    /// The column's key, as `columns` accepts it and as rows carry it.
    public let key: String
    /// The column's display name.
    public let name: String
    /// Properties only. `fixed` breakdowns list every value, zero-filled; `open` ones list values with activity.
    public let set: ListReportsResponseDataItemColumnsItemSet?
    /// Whether the column is an attribute of the row or a number measured over it.
    public let type: ListReportsResponseDataItemColumnsItemType
    /// Metrics only. `money` is a Money object, `rate` a decimal fraction, the rest numbers.
    public let unit: ListReportsResponseDataItemColumnsItemUnit?
    /// Metrics only. For `average` metrics, the column to weight by.
    public let weight: Nullable<String>?
    /// Metrics only. The window tokens the metric supports, or `null` for every one.
    public let windows: Nullable<[String]>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        aggregate: ListReportsResponseDataItemColumnsItemAggregate? = nil,
        availableOn: [String]? = nil,
        breakdowns: Nullable<[String]>? = nil,
        default: Bool? = nil,
        key: String,
        name: String,
        set: ListReportsResponseDataItemColumnsItemSet? = nil,
        type: ListReportsResponseDataItemColumnsItemType,
        unit: ListReportsResponseDataItemColumnsItemUnit? = nil,
        weight: Nullable<String>? = nil,
        windows: Nullable<[String]>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.aggregate = aggregate
        self.availableOn = availableOn
        self.breakdowns = breakdowns
        self.default = `default`
        self.key = key
        self.name = name
        self.set = set
        self.type = type
        self.unit = unit
        self.weight = weight
        self.windows = windows
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.aggregate = try container.decodeIfPresent(ListReportsResponseDataItemColumnsItemAggregate.self, forKey: .aggregate)
        self.availableOn = try container.decodeIfPresent([String].self, forKey: .availableOn)
        self.breakdowns = try container.decodeNullableIfPresent([String].self, forKey: .breakdowns)
        self.default = try container.decodeIfPresent(Bool.self, forKey: .default)
        self.key = try container.decode(String.self, forKey: .key)
        self.name = try container.decode(String.self, forKey: .name)
        self.set = try container.decodeIfPresent(ListReportsResponseDataItemColumnsItemSet.self, forKey: .set)
        self.type = try container.decode(ListReportsResponseDataItemColumnsItemType.self, forKey: .type)
        self.unit = try container.decodeIfPresent(ListReportsResponseDataItemColumnsItemUnit.self, forKey: .unit)
        self.weight = try container.decodeNullableIfPresent(String.self, forKey: .weight)
        self.windows = try container.decodeNullableIfPresent([String].self, forKey: .windows)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.aggregate, forKey: .aggregate)
        try container.encodeIfPresent(self.availableOn, forKey: .availableOn)
        try container.encodeNullableIfPresent(self.breakdowns, forKey: .breakdowns)
        try container.encodeIfPresent(self.default, forKey: .default)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.set, forKey: .set)
        try container.encode(self.type, forKey: .type)
        try container.encodeIfPresent(self.unit, forKey: .unit)
        try container.encodeNullableIfPresent(self.weight, forKey: .weight)
        try container.encodeNullableIfPresent(self.windows, forKey: .windows)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case aggregate
        case availableOn = "available_on"
        case breakdowns
        case `default`
        case key
        case name
        case set
        case type
        case unit
        case weight
        case windows
    }
}