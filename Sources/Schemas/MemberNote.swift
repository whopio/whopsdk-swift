import Foundation

public struct MemberNote: Codable, Hashable, Sendable {
    /// The user who wrote the note, or `null` when it was added by an API key or automatically by Whop.
    public let author: Nullable<UserSummary>
    /// The note text.
    public let content: String
    /// When the note was added, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Member note ID, prefixed `note_`.
    public let id: String
    /// The member the note is about, prefixed `mber_`.
    public let memberId: String
    /// The customer the note is about, prefixed `user_`.
    public let userId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        author: Nullable<UserSummary>,
        content: String,
        createdAt: String,
        id: String,
        memberId: String,
        userId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.author = author
        self.content = content
        self.createdAt = createdAt
        self.id = id
        self.memberId = memberId
        self.userId = userId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.author = try container.decode(Nullable<UserSummary>.self, forKey: .author)
        self.content = try container.decode(String.self, forKey: .content)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.memberId = try container.decode(String.self, forKey: .memberId)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.author, forKey: .author)
        try container.encode(self.content, forKey: .content)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.memberId, forKey: .memberId)
        try container.encode(self.userId, forKey: .userId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case author
        case content
        case createdAt = "created_at"
        case id
        case memberId = "member_id"
        case userId = "user_id"
    }
}