import Foundation

/// Debug information.
public struct DescribeStatsResponseDescribeMetricDebug: Codable, Hashable, Sendable {
    /// Unique request identifier for debugging.
    public let requestId: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        requestId: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.requestId = requestId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.requestId = try container.decode(Nullable<String>.self, forKey: .requestId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.requestId, forKey: .requestId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case requestId = "request_id"
    }
}