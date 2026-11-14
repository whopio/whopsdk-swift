import Foundation

public struct PlatformTrendsReportsResponseData: Codable, Hashable, Sendable {
    /// What each row is, or `null` for one total row per window.
    public let breakdownBy: Nullable<String>
    /// The breakdown first, then each requested property and metric, in row order.
    public let columns: [PlatformTrendsReportsResponseDataColumnsItem]
    /// When the data was read, as an ISO 8601 timestamp.
    public let dataAsOf: String
    /// The report's key.
    public let report: String
    /// One entry per requested window, in request order. Rows line up by index across entries.
    public let reports: [PlatformTrendsReportsResponseDataReportsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        breakdownBy: Nullable<String>,
        columns: [PlatformTrendsReportsResponseDataColumnsItem],
        dataAsOf: String,
        report: String,
        reports: [PlatformTrendsReportsResponseDataReportsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.breakdownBy = breakdownBy
        self.columns = columns
        self.dataAsOf = dataAsOf
        self.report = report
        self.reports = reports
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.breakdownBy = try container.decode(Nullable<String>.self, forKey: .breakdownBy)
        self.columns = try container.decode([PlatformTrendsReportsResponseDataColumnsItem].self, forKey: .columns)
        self.dataAsOf = try container.decode(String.self, forKey: .dataAsOf)
        self.report = try container.decode(String.self, forKey: .report)
        self.reports = try container.decode([PlatformTrendsReportsResponseDataReportsItem].self, forKey: .reports)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.breakdownBy, forKey: .breakdownBy)
        try container.encode(self.columns, forKey: .columns)
        try container.encode(self.dataAsOf, forKey: .dataAsOf)
        try container.encode(self.report, forKey: .report)
        try container.encode(self.reports, forKey: .reports)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case breakdownBy = "breakdown_by"
        case columns
        case dataAsOf = "data_as_of"
        case report
        case reports
    }
}