import Foundation

/// Description of an API resource view including its columns and associations.
public struct DescribeStatsResponseDescribeView: Codable, Hashable, Sendable {
    /// The view name being described.
    public let view: String
    /// The API resource name.
    public let resource: String
    /// The underlying model class.
    public let model: String
    /// The query engine being used.
    public let engine: String
    /// Available columns.
    public let columns: [String]
    /// Columns that can be used for sorting.
    public let sortableColumns: [String]
    /// Available associations.
    public let associations: [DescribeStatsResponseDescribeViewAssociationsItem]
    /// Available metrics.
    public let metrics: [DescribeStatsResponseDescribeViewMetricsItem]
    /// Sample data rows.
    public let sample: Nullable<[[String: JSONValue]]>
    /// Debug information.
    public let debug: Nullable<DescribeStatsResponseDescribeViewDebug>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        view: String,
        resource: String,
        model: String,
        engine: String,
        columns: [String],
        sortableColumns: [String],
        associations: [DescribeStatsResponseDescribeViewAssociationsItem],
        metrics: [DescribeStatsResponseDescribeViewMetricsItem],
        sample: Nullable<[[String: JSONValue]]>,
        debug: Nullable<DescribeStatsResponseDescribeViewDebug>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.view = view
        self.resource = resource
        self.model = model
        self.engine = engine
        self.columns = columns
        self.sortableColumns = sortableColumns
        self.associations = associations
        self.metrics = metrics
        self.sample = sample
        self.debug = debug
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.view = try container.decode(String.self, forKey: .view)
        self.resource = try container.decode(String.self, forKey: .resource)
        self.model = try container.decode(String.self, forKey: .model)
        self.engine = try container.decode(String.self, forKey: .engine)
        self.columns = try container.decode([String].self, forKey: .columns)
        self.sortableColumns = try container.decode([String].self, forKey: .sortableColumns)
        self.associations = try container.decode([DescribeStatsResponseDescribeViewAssociationsItem].self, forKey: .associations)
        self.metrics = try container.decode([DescribeStatsResponseDescribeViewMetricsItem].self, forKey: .metrics)
        self.sample = try container.decode(Nullable<[[String: JSONValue]]>.self, forKey: .sample)
        self.debug = try container.decode(Nullable<DescribeStatsResponseDescribeViewDebug>.self, forKey: .debug)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.view, forKey: .view)
        try container.encode(self.resource, forKey: .resource)
        try container.encode(self.model, forKey: .model)
        try container.encode(self.engine, forKey: .engine)
        try container.encode(self.columns, forKey: .columns)
        try container.encode(self.sortableColumns, forKey: .sortableColumns)
        try container.encode(self.associations, forKey: .associations)
        try container.encode(self.metrics, forKey: .metrics)
        try container.encode(self.sample, forKey: .sample)
        try container.encode(self.debug, forKey: .debug)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case view
        case resource
        case model
        case engine
        case columns
        case sortableColumns = "sortable_columns"
        case associations
        case metrics
        case sample
        case debug
    }
}