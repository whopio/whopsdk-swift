import Foundation

public struct TeamMember: Codable, Hashable, Sendable {
    /// The account this membership belongs to, prefixed `biz_`.
    public let accountId: String
    /// Custom role assigned to this member, or `null` when the member has a system role.
    public let authorizedRole: Nullable<TeamMemberAuthorizedRole>
    /// When the member joined or the invite was sent, as an ISO 8601 timestamp.
    public let createdAt: String
    /// The member's email address. For accepted members, `null` unless the caller holds the email read scope; for invites, the invited address.
    public let email: Nullable<String>
    /// Team member ID — `ausr_` for accepted members, `ausri_` for pending invites.
    public let id: String
    /// Whether this member is an agent (app-controlled account) rather than a human team member. Always `false` for invites.
    public let isAgent: Bool
    /// The member's role on the account. `custom` means a bespoke dashboard-managed role; the API can read but not grant it.
    public let role: TeamMemberRole
    /// `joined` for accepted members, `pending` while the invite is pending.
    public let status: TeamMemberStatus
    /// When the membership was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// The user behind this team membership. `null` for an invite sent to an email with no Whop account yet.
    public let user: Nullable<UserSummary>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        authorizedRole: Nullable<TeamMemberAuthorizedRole>,
        createdAt: String,
        email: Nullable<String>,
        id: String,
        isAgent: Bool,
        role: TeamMemberRole,
        status: TeamMemberStatus,
        updatedAt: String,
        user: Nullable<UserSummary>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.authorizedRole = authorizedRole
        self.createdAt = createdAt
        self.email = email
        self.id = id
        self.isAgent = isAgent
        self.role = role
        self.status = status
        self.updatedAt = updatedAt
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.authorizedRole = try container.decode(Nullable<TeamMemberAuthorizedRole>.self, forKey: .authorizedRole)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.email = try container.decode(Nullable<String>.self, forKey: .email)
        self.id = try container.decode(String.self, forKey: .id)
        self.isAgent = try container.decode(Bool.self, forKey: .isAgent)
        self.role = try container.decode(TeamMemberRole.self, forKey: .role)
        self.status = try container.decode(TeamMemberStatus.self, forKey: .status)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.user = try container.decode(Nullable<UserSummary>.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.authorizedRole, forKey: .authorizedRole)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.isAgent, forKey: .isAgent)
        try container.encode(self.role, forKey: .role)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case authorizedRole = "authorized_role"
        case createdAt = "created_at"
        case email
        case id
        case isAgent = "is_agent"
        case role
        case status
        case updatedAt = "updated_at"
        case user
    }
}