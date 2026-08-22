import Foundation

/// An ads performance report. Always returns a summary. The `granularity` field contains a per-bucket time series when the `granularity` arg is set; the `breakdown` field contains per-entity rows when the `breakdown` arg is set.
public struct AdReport: Codable, Hashable, Sendable {
    /// Per-entity rows over the date range. `null` when the `breakdown` arg on `adReport` is omitted; otherwise contains one row per ad campaign, ad group, or ad inside the requested scope at the requested level.
    public let breakdown: Nullable<[AdReportBreakdownItem]>
    /// Per-bucket time series over the date range, ordered ascending by `bucketStart`. `null` when the `granularity` arg on `adReport` is omitted; otherwise contains rows at the requested grain (`daily` or `hourly`).
    public let granularity: Nullable<[AdReportGranularityItem]>
    /// Aggregate totals and rates over the date range.
    public let summary: AdReportSummary
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        breakdown: Nullable<[AdReportBreakdownItem]>,
        granularity: Nullable<[AdReportGranularityItem]>,
        summary: AdReportSummary,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.breakdown = breakdown
        self.granularity = granularity
        self.summary = summary
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.breakdown = try container.decode(Nullable<[AdReportBreakdownItem]>.self, forKey: .breakdown)
        self.granularity = try container.decode(Nullable<[AdReportGranularityItem]>.self, forKey: .granularity)
        self.summary = try container.decode(AdReportSummary.self, forKey: .summary)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.breakdown, forKey: .breakdown)
        try container.encode(self.granularity, forKey: .granularity)
        try container.encode(self.summary, forKey: .summary)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case breakdown
        case granularity
        case summary
    }
}