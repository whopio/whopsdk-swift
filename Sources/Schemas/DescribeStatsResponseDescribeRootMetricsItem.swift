import Foundation

public struct DescribeStatsResponseDescribeRootMetricsItem: Codable, Hashable, Sendable {
    /// The metric name.
    public let name: String
    /// The node path this metric operates on.
    public let nodePath: String
    /// Query engines that support this metric.
    public let supportedEngines: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        nodePath: String,
        supportedEngines: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.nodePath = nodePath
        self.supportedEngines = supportedEngines
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.nodePath = try container.decode(String.self, forKey: .nodePath)
        self.supportedEngines = try container.decode([String].self, forKey: .supportedEngines)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.nodePath, forKey: .nodePath)
        try container.encode(self.supportedEngines, forKey: .supportedEngines)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case nodePath = "node_path"
        case supportedEngines = "supported_engines"
    }
}