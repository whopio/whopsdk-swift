import Foundation

public struct PostChatReactionCreatedPayloadDataChannel: Codable, Hashable, Sendable {
    public let experienceId: Nullable<String>?
    public let id: String
    public let type: PostChatReactionCreatedPayloadDataChannelType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        experienceId: Nullable<String>? = nil,
        id: String,
        type: PostChatReactionCreatedPayloadDataChannelType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.experienceId = experienceId
        self.id = id
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.experienceId = try container.decodeNullableIfPresent(String.self, forKey: .experienceId)
        self.id = try container.decode(String.self, forKey: .id)
        self.type = try container.decode(PostChatReactionCreatedPayloadDataChannelType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.experienceId, forKey: .experienceId)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case experienceId = "experience_id"
        case id
        case type
    }
}