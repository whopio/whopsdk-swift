import Foundation

/// The app that powers this experience, defining its interface and behavior.
public struct ExperienceListItemApp: Codable, Hashable, Sendable {
    /// The icon image for this app, displayed on the app store, product pages, checkout, and as the default icon for experiences using this app.
    public let icon: Nullable<ExperienceListItemAppIcon>
    /// The unique identifier for the app.
    public let id: String
    /// The display name of this app shown on the app store and in experience navigation. Maximum 30 characters.
    public let name: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        icon: Nullable<ExperienceListItemAppIcon>,
        id: String,
        name: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.icon = icon
        self.id = id
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.icon = try container.decode(Nullable<ExperienceListItemAppIcon>.self, forKey: .icon)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.icon, forKey: .icon)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case icon
        case id
        case name
    }
}