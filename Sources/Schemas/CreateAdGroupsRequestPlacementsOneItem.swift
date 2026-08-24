import Foundation

public struct CreateAdGroupsRequestPlacementsOneItem: Codable, Hashable, Sendable {
    /// Platform the ads run on.
    public let platform: CreateAdGroupsRequestPlacementsOneItemPlatform
    /// Positions to target within the platform, such as `feed` or `story`. Omit to target all of the platform's positions.
    public let positions: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        platform: CreateAdGroupsRequestPlacementsOneItemPlatform,
        positions: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.platform = platform
        self.positions = positions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.platform = try container.decode(CreateAdGroupsRequestPlacementsOneItemPlatform.self, forKey: .platform)
        self.positions = try container.decodeIfPresent([String].self, forKey: .positions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.platform, forKey: .platform)
        try container.encodeIfPresent(self.positions, forKey: .positions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case platform
        case positions
    }
}