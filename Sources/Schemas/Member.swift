import Foundation

public struct Member: Codable, Hashable, Sendable {
    /// What the member can reach on the account: `customer` for paying members, `admin` for team members, `no_access` once every grant has lapsed.
    public let accessLevel: MemberAccessLevel
    /// The account this member belongs to, prefixed `biz_`.
    public let accountId: String
    /// When the member record was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Member ID, prefixed `mber_`.
    public let id: String
    /// When the member first joined the account, as an ISO 8601 timestamp.
    public let joinedAt: String
    /// When the member last opened the account's content, as an ISO 8601 timestamp. `null` if they never have.
    public let lastAccessedAt: Nullable<String>
    /// `joined` while the member is part of the account, `left` after they leave.
    public let status: MemberStatus
    /// The user behind this member. `null` when the buyer is another business rather than a person.
    public let user: Nullable<UserSummary>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accessLevel: MemberAccessLevel,
        accountId: String,
        createdAt: String,
        id: String,
        joinedAt: String,
        lastAccessedAt: Nullable<String>,
        status: MemberStatus,
        user: Nullable<UserSummary>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accessLevel = accessLevel
        self.accountId = accountId
        self.createdAt = createdAt
        self.id = id
        self.joinedAt = joinedAt
        self.lastAccessedAt = lastAccessedAt
        self.status = status
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accessLevel = try container.decode(MemberAccessLevel.self, forKey: .accessLevel)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.joinedAt = try container.decode(String.self, forKey: .joinedAt)
        self.lastAccessedAt = try container.decode(Nullable<String>.self, forKey: .lastAccessedAt)
        self.status = try container.decode(MemberStatus.self, forKey: .status)
        self.user = try container.decode(Nullable<UserSummary>.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accessLevel, forKey: .accessLevel)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.joinedAt, forKey: .joinedAt)
        try container.encode(self.lastAccessedAt, forKey: .lastAccessedAt)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accessLevel = "access_level"
        case accountId = "account_id"
        case createdAt = "created_at"
        case id
        case joinedAt = "joined_at"
        case lastAccessedAt = "last_accessed_at"
        case status
        case user
    }
}