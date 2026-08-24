import Foundation

public enum DescribeStatsResponse: Codable, Hashable, Sendable {
    /// Description of a metric including its configuration and SQL.
    case describeMetric(DescribeStatsResponseDescribeMetric)
    /// Description of a node (model) including its columns and associations.
    case describeNode(DescribeStatsResponseDescribeNode)
    /// Root schema description showing available nodes, views, and metrics.
    case describeRoot(DescribeStatsResponseDescribeRoot)
    /// Description of an API resource view including its columns and associations.
    case describeView(DescribeStatsResponseDescribeView)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminant = try container.decode(String.self, forKey: .typename)
        switch discriminant {
        case "DescribeMetric":
            self = .describeMetric(try DescribeStatsResponseDescribeMetric(from: decoder))
        case "DescribeNode":
            self = .describeNode(try DescribeStatsResponseDescribeNode(from: decoder))
        case "DescribeRoot":
            self = .describeRoot(try DescribeStatsResponseDescribeRoot(from: decoder))
        case "DescribeView":
            self = .describeView(try DescribeStatsResponseDescribeView(from: decoder))
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Unknown shape discriminant value: \(discriminant)"
                )
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .describeMetric(let data):
            try container.encode("DescribeMetric", forKey: .typename)
            try data.encode(to: encoder)
        case .describeNode(let data):
            try container.encode("DescribeNode", forKey: .typename)
            try data.encode(to: encoder)
        case .describeRoot(let data):
            try container.encode("DescribeRoot", forKey: .typename)
            try data.encode(to: encoder)
        case .describeView(let data):
            try container.encode("DescribeView", forKey: .typename)
            try data.encode(to: encoder)
        }
    }

    enum CodingKeys: String, CodingKey, CaseIterable {
        case typename
    }
}