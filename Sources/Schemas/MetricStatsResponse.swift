import Foundation

/// Result from a stats query (raw, metric, or SQL).
public struct MetricStatsResponse: Codable, Hashable, Sendable {
    /// Column names in the order they appear in each data row.
    public let columns: Nullable<[String]>
    /// Array of data rows, where each row is an array of values matching the columns order.
    public let data: Nullable<[[String: JSONValue]]>
    /// Debug information including engine and SQL.
    public let debug: Nullable<MetricStatsResponseDebug>
    /// The node path that was queried.
    public let node: Nullable<String>
    /// Pagination information.
    public let pagination: Nullable<MetricStatsResponsePagination>
    /// The typename of this object
    public let typename: MetricStatsResponseTypename
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        columns: Nullable<[String]>,
        data: Nullable<[[String: JSONValue]]>,
        debug: Nullable<MetricStatsResponseDebug>,
        node: Nullable<String>,
        pagination: Nullable<MetricStatsResponsePagination>,
        typename: MetricStatsResponseTypename,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.columns = columns
        self.data = data
        self.debug = debug
        self.node = node
        self.pagination = pagination
        self.typename = typename
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.columns = try container.decode(Nullable<[String]>.self, forKey: .columns)
        self.data = try container.decode(Nullable<[[String: JSONValue]]>.self, forKey: .data)
        self.debug = try container.decode(Nullable<MetricStatsResponseDebug>.self, forKey: .debug)
        self.node = try container.decode(Nullable<String>.self, forKey: .node)
        self.pagination = try container.decode(Nullable<MetricStatsResponsePagination>.self, forKey: .pagination)
        self.typename = try container.decode(MetricStatsResponseTypename.self, forKey: .typename)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.columns, forKey: .columns)
        try container.encode(self.data, forKey: .data)
        try container.encode(self.debug, forKey: .debug)
        try container.encode(self.node, forKey: .node)
        try container.encode(self.pagination, forKey: .pagination)
        try container.encode(self.typename, forKey: .typename)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case columns
        case data
        case debug
        case node
        case pagination
        case typename
    }
}