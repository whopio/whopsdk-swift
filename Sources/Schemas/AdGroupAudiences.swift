import Foundation

public struct AdGroupAudiences: Codable, Hashable, Sendable {
    public let exclude: [String]
    public let include: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        exclude: [String],
        include: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.exclude = exclude
        self.include = include
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.exclude = try container.decode([String].self, forKey: .exclude)
        self.include = try container.decode([String].self, forKey: .include)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.exclude, forKey: .exclude)
        try container.encode(self.include, forKey: .include)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case exclude
        case include
    }
}