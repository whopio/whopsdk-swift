import Foundation

public struct AppSummary: Codable, Hashable, Sendable {
    /// Account that develops the app.
    public let developer: AccountSummary
    /// App icon. Falls back to the default app icon when none is uploaded.
    public let icon: AppIcon
    /// App ID, prefixed `app_`.
    public let id: String
    /// App display name.
    public let name: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        developer: AccountSummary,
        icon: AppIcon,
        id: String,
        name: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.developer = developer
        self.icon = icon
        self.id = id
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.developer = try container.decode(AccountSummary.self, forKey: .developer)
        self.icon = try container.decode(AppIcon.self, forKey: .icon)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.developer, forKey: .developer)
        try container.encode(self.icon, forKey: .icon)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case developer
        case icon
        case id
        case name
    }
}