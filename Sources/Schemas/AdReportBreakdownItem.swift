import Foundation

/// Per-entity ad performance row. Returned when the `breakdown` arg on `adReport` is set.
public struct AdReportBreakdownItem: Codable, Hashable, Sendable {
    /// Per-bucket time series for this entity over the date range, ordered ascending by `bucketStart`. `null` when the `granularity` arg on `adReport` is omitted; otherwise contains rows at the requested grain (`daily` or `hourly`).
    public let granularity: Nullable<[AdReportBreakdownItemGranularityItem]>
    /// Tag of the entity (ad campaign, ad group, or ad).
    public let id: String
    /// The entity level of this row — matches the `breakdown` arg.
    public let level: AdReportBreakdownLevels
    /// Display name of the entity, when available.
    public let name: Nullable<String>
    /// Aggregate totals and rates for this entity over the date range.
    public let summary: AdReportBreakdownItemSummary
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        granularity: Nullable<[AdReportBreakdownItemGranularityItem]>,
        id: String,
        level: AdReportBreakdownLevels,
        name: Nullable<String>,
        summary: AdReportBreakdownItemSummary,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.granularity = granularity
        self.id = id
        self.level = level
        self.name = name
        self.summary = summary
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.granularity = try container.decode(Nullable<[AdReportBreakdownItemGranularityItem]>.self, forKey: .granularity)
        self.id = try container.decode(String.self, forKey: .id)
        self.level = try container.decode(AdReportBreakdownLevels.self, forKey: .level)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.summary = try container.decode(AdReportBreakdownItemSummary.self, forKey: .summary)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.granularity, forKey: .granularity)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.level, forKey: .level)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.summary, forKey: .summary)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case granularity
        case id
        case level
        case name
        case summary
    }
}