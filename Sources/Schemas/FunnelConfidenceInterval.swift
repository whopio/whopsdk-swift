import Foundation

public struct FunnelConfidenceInterval: Codable, Hashable, Sendable {
    /// The lower confidence bound, in percent or percentage points for a difference.
    public let lower: Double
    /// The upper confidence bound, in percent or percentage points for a difference.
    public let upper: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        lower: Double,
        upper: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.lower = lower
        self.upper = upper
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.lower = try container.decode(Double.self, forKey: .lower)
        self.upper = try container.decode(Double.self, forKey: .upper)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.lower, forKey: .lower)
        try container.encode(self.upper, forKey: .upper)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case lower
        case upper
    }
}