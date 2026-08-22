import Foundation

/// Description of a node (model) including its columns and associations.
public struct DescribeStatsResponseDescribeNode: Codable, Hashable, Sendable {
    /// The node path being described.
    public let node: String
    /// The query engine being used.
    public let engine: String
    /// Available columns.
    public let columns: [String]
    /// Columns that can be used for sorting.
    public let sortableColumns: [String]
    /// Available associations or child paths.
    public let associations: [DescribeStatsResponseDescribeNodeAssociationsItem]
    /// Available metrics for this node.
    public let metrics: [DescribeStatsResponseDescribeNodeMetricsItem]
    /// Sample data rows.
    public let sample: Nullable<[[String: JSONValue]]>
    /// Debug information.
    public let debug: Nullable<DescribeStatsResponseDescribeNodeDebug>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        node: String,
        engine: String,
        columns: [String],
        sortableColumns: [String],
        associations: [DescribeStatsResponseDescribeNodeAssociationsItem],
        metrics: [DescribeStatsResponseDescribeNodeMetricsItem],
        sample: Nullable<[[String: JSONValue]]>,
        debug: Nullable<DescribeStatsResponseDescribeNodeDebug>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.node = node
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
        self.node = try container.decode(String.self, forKey: .node)
        self.engine = try container.decode(String.self, forKey: .engine)
        self.columns = try container.decode([String].self, forKey: .columns)
        self.sortableColumns = try container.decode([String].self, forKey: .sortableColumns)
        self.associations = try container.decode([DescribeStatsResponseDescribeNodeAssociationsItem].self, forKey: .associations)
        self.metrics = try container.decode([DescribeStatsResponseDescribeNodeMetricsItem].self, forKey: .metrics)
        self.sample = try container.decode(Nullable<[[String: JSONValue]]>.self, forKey: .sample)
        self.debug = try container.decode(Nullable<DescribeStatsResponseDescribeNodeDebug>.self, forKey: .debug)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.node, forKey: .node)
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
        case node
        case engine
        case columns
        case sortableColumns = "sortable_columns"
        case associations
        case metrics
        case sample
        case debug
    }
}