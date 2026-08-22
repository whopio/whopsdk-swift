import Foundation

/// Description of a metric including its configuration and SQL.
public struct DescribeStatsResponseDescribeMetric: Codable, Hashable, Sendable {
    /// The metric name.
    public let metric: String
    /// The node path this metric operates on.
    public let node: String
    /// The query engine being used.
    public let engine: String
    /// The timestamp column used for time filtering.
    public let timestampColumn: String
    /// Query engines that support this metric.
    public let supportedEngines: [String]
    /// Columns that can be used for filtering.
    public let filterableColumns: [String]
    /// Columns that can be used for breakdowns.
    public let breakdownableColumns: [String]
    /// The generated SQL query.
    public let sql: Nullable<String>
    /// Debug information.
    public let debug: Nullable<DescribeStatsResponseDescribeMetricDebug>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        metric: String,
        node: String,
        engine: String,
        timestampColumn: String,
        supportedEngines: [String],
        filterableColumns: [String],
        breakdownableColumns: [String],
        sql: Nullable<String>,
        debug: Nullable<DescribeStatsResponseDescribeMetricDebug>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.metric = metric
        self.node = node
        self.engine = engine
        self.timestampColumn = timestampColumn
        self.supportedEngines = supportedEngines
        self.filterableColumns = filterableColumns
        self.breakdownableColumns = breakdownableColumns
        self.sql = sql
        self.debug = debug
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.metric = try container.decode(String.self, forKey: .metric)
        self.node = try container.decode(String.self, forKey: .node)
        self.engine = try container.decode(String.self, forKey: .engine)
        self.timestampColumn = try container.decode(String.self, forKey: .timestampColumn)
        self.supportedEngines = try container.decode([String].self, forKey: .supportedEngines)
        self.filterableColumns = try container.decode([String].self, forKey: .filterableColumns)
        self.breakdownableColumns = try container.decode([String].self, forKey: .breakdownableColumns)
        self.sql = try container.decode(Nullable<String>.self, forKey: .sql)
        self.debug = try container.decode(Nullable<DescribeStatsResponseDescribeMetricDebug>.self, forKey: .debug)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.metric, forKey: .metric)
        try container.encode(self.node, forKey: .node)
        try container.encode(self.engine, forKey: .engine)
        try container.encode(self.timestampColumn, forKey: .timestampColumn)
        try container.encode(self.supportedEngines, forKey: .supportedEngines)
        try container.encode(self.filterableColumns, forKey: .filterableColumns)
        try container.encode(self.breakdownableColumns, forKey: .breakdownableColumns)
        try container.encode(self.sql, forKey: .sql)
        try container.encode(self.debug, forKey: .debug)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case metric
        case node
        case engine
        case timestampColumn = "timestamp_column"
        case supportedEngines = "supported_engines"
        case filterableColumns = "filterable_columns"
        case breakdownableColumns = "breakdownable_columns"
        case sql
        case debug
    }
}