import Foundation

public struct NotificationExperience: Codable, Hashable, Sendable {
    /// App the experience belongs to.
    public let app: Nullable<NotificationExperienceApp>
    /// Experience ID, prefixed `exp_`.
    public let id: String
    /// Display name of the experience.
    public let name: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        app: Nullable<NotificationExperienceApp>,
        id: String,
        name: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.app = app
        self.id = id
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.app = try container.decode(Nullable<NotificationExperienceApp>.self, forKey: .app)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.app, forKey: .app)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case app
        case id
        case name
    }
}