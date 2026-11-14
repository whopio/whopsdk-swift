import Foundation

public struct MessageCustomAuthor: Codable, Hashable, Sendable {
    /// Webhook display name, or null to use the user's name.
    public let displayName: Nullable<String>
    /// Webhook profile image, or null to use the user's image.
    public let profilePicture: Nullable<File>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        displayName: Nullable<String>,
        profilePicture: Nullable<File>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.displayName = displayName
        self.profilePicture = profilePicture
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.displayName = try container.decode(Nullable<String>.self, forKey: .displayName)
        self.profilePicture = try container.decode(Nullable<File>.self, forKey: .profilePicture)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.displayName, forKey: .displayName)
        try container.encode(self.profilePicture, forKey: .profilePicture)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case displayName = "display_name"
        case profilePicture = "profile_picture"
    }
}