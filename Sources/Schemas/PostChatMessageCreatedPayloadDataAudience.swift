import Foundation

public struct PostChatMessageCreatedPayloadDataAudience: Codable, Hashable, Sendable {
    public let type: PostChatMessageCreatedPayloadDataAudienceType
    public let userIds: Nullable<[String]>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: PostChatMessageCreatedPayloadDataAudienceType,
        userIds: Nullable<[String]>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.userIds = userIds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(PostChatMessageCreatedPayloadDataAudienceType.self, forKey: .type)
        self.userIds = try container.decodeNullableIfPresent([String].self, forKey: .userIds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encodeNullableIfPresent(self.userIds, forKey: .userIds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case userIds = "user_ids"
    }
}