import Foundation

public struct AdGroupPlacement: Codable, Hashable, Sendable {
    /// Publisher platform where the ad is eligible to appear.
    public let platform: AdGroupPlacementPlatform
    public let positions: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        platform: AdGroupPlacementPlatform,
        positions: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.platform = platform
        self.positions = positions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.platform = try container.decode(AdGroupPlacementPlatform.self, forKey: .platform)
        self.positions = try container.decode([String].self, forKey: .positions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.platform, forKey: .platform)
        try container.encode(self.positions, forKey: .positions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case platform
        case positions
    }
}