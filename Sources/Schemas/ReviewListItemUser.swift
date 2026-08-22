import Foundation

/// The user account of the person who wrote this review.
public struct ReviewListItemUser: Codable, Hashable, Sendable {
    /// The unique identifier for the user.
    public let id: String
    /// The user's display name shown on their public profile.
    public let name: Nullable<String>
    /// The user's unique username shown on their public profile.
    public let username: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        name: Nullable<String>,
        username: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.username = username
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.username = try container.decode(String.self, forKey: .username)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.username, forKey: .username)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case username
    }
}