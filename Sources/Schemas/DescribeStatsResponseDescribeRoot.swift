import Foundation

/// Root schema description showing available nodes, views, and metrics.
public struct DescribeStatsResponseDescribeRoot: Codable, Hashable, Sendable {
    /// Available root nodes.
    public let nodes: [String]
    /// Available API resource views.
    public let views: [String]
    /// Available metrics.
    public let metrics: [DescribeStatsResponseDescribeRootMetricsItem]
    /// Debug information.
    public let debug: Nullable<DescribeStatsResponseDescribeRootDebug>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        nodes: [String],
        views: [String],
        metrics: [DescribeStatsResponseDescribeRootMetricsItem],
        debug: Nullable<DescribeStatsResponseDescribeRootDebug>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.nodes = nodes
        self.views = views
        self.metrics = metrics
        self.debug = debug
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.nodes = try container.decode([String].self, forKey: .nodes)
        self.views = try container.decode([String].self, forKey: .views)
        self.metrics = try container.decode([DescribeStatsResponseDescribeRootMetricsItem].self, forKey: .metrics)
        self.debug = try container.decode(Nullable<DescribeStatsResponseDescribeRootDebug>.self, forKey: .debug)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.nodes, forKey: .nodes)
        try container.encode(self.views, forKey: .views)
        try container.encode(self.metrics, forKey: .metrics)
        try container.encode(self.debug, forKey: .debug)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case nodes
        case views
        case metrics
        case debug
    }
}