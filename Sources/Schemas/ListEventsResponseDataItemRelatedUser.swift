import Foundation

public struct ListEventsResponseDataItemRelatedUser: Codable, Hashable, Sendable {
    public let avatarUrl: Nullable<String>?
    public let id: String?
    public let name: Nullable<String>?
    public let username: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        avatarUrl: Nullable<String>? = nil,
        id: String? = nil,
        name: Nullable<String>? = nil,
        username: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.avatarUrl = avatarUrl
        self.id = id
        self.name = name
        self.username = username
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.avatarUrl = try container.decodeNullableIfPresent(String.self, forKey: .avatarUrl)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.name = try container.decodeNullableIfPresent(String.self, forKey: .name)
        self.username = try container.decodeNullableIfPresent(String.self, forKey: .username)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.avatarUrl, forKey: .avatarUrl)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.name, forKey: .name)
        try container.encodeNullableIfPresent(self.username, forKey: .username)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case avatarUrl = "avatar_url"
        case id
        case name
        case username
    }
}