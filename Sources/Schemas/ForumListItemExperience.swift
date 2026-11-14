import Foundation

/// The parent experience that this forum belongs to.
public struct ForumListItemExperience: Codable, Hashable, Sendable {
    /// The unique identifier for the experience.
    public let id: String
    /// Whether this experience is publicly visible to all users, including those without a membership.
    public let isPublic: Bool
    /// The display name of this experience shown to users in the product navigation. Maximum 255 characters.
    public let name: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        isPublic: Bool,
        name: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.isPublic = isPublic
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.isPublic = try container.decode(Bool.self, forKey: .isPublic)
        self.name = try container.decode(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.isPublic, forKey: .isPublic)
        try container.encode(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case isPublic = "is_public"
        case name
    }
}