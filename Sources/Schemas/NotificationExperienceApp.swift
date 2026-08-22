import Foundation

public struct NotificationExperienceApp: Codable, Hashable, Sendable {
    /// Icon image URL. Always present — the default app icon when none is uploaded.
    public let iconUrl: String
    /// App ID, prefixed `app_`.
    public let id: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        iconUrl: String,
        id: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.iconUrl = iconUrl
        self.id = id
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.iconUrl = try container.decode(String.self, forKey: .iconUrl)
        self.id = try container.decode(String.self, forKey: .id)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.iconUrl, forKey: .iconUrl)
        try container.encode(self.id, forKey: .id)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case iconUrl = "icon_url"
        case id
    }
}