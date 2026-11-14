import Foundation

public struct TeamMember: Codable, Hashable, Sendable {
    /// The account this membership belongs to.
    public let account: AccountParent
    /// Custom role assigned to this member, or `null` when the member has a system role.
    public let authorizedRole: Nullable<TeamMemberAuthorizedRole>
    /// When the member joined the team or the invite was sent, as an ISO 8601 timestamp. A member who was a customer first keeps the date they were given their role.
    public let createdAt: String
    /// How many team members report directly to this member. `null` for invites.
    public let directReportsCount: Nullable<Int>
    /// The member's email address. For an invite to an email with no Whop account yet, this is the invited address. Otherwise it is `null` unless the caller holds the `company:authorized_user:email:read` scope.
    public let email: Nullable<String>
    /// Team member ID. Accepted members have an ID starting with `ausr_` or `mber_`, and pending invites one starting with `ausri_`. Treat it as opaque: both member prefixes are accepted wherever a team member ID is.
    public let id: String
    /// Whether this member is an agent (app-controlled account) rather than a human team member. Always `false` for invites.
    public let isAgent: Bool
    /// Whether this member or invite has the view-only Partner role, directly or through a custom role based on it. A Partner can read only the account's basic details.
    public let isPartner: Bool
    public let reportsToChain: Nullable<[TeamMemberManager]>
    /// The ID of the team member this member reports to, starting with `ausr_` or `mber_`; treat it as opaque. `null` when the member reports to the business directly, and for invites.
    public let reportsToId: Nullable<String>
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
        account: AccountParent,
        authorizedRole: Nullable<TeamMemberAuthorizedRole>,
        createdAt: String,
        directReportsCount: Nullable<Int>,
        email: Nullable<String>,
        id: String,
        isAgent: Bool,
        isPartner: Bool,
        reportsToChain: Nullable<[TeamMemberManager]>,
        reportsToId: Nullable<String>,
        role: TeamMemberRole,
        status: TeamMemberStatus,
        updatedAt: String,
        user: Nullable<UserSummary>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.authorizedRole = authorizedRole
        self.createdAt = createdAt
        self.directReportsCount = directReportsCount
        self.email = email
        self.id = id
        self.isAgent = isAgent
        self.isPartner = isPartner
        self.reportsToChain = reportsToChain
        self.reportsToId = reportsToId
        self.role = role
        self.status = status
        self.updatedAt = updatedAt
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decode(AccountParent.self, forKey: .account)
        self.authorizedRole = try container.decode(Nullable<TeamMemberAuthorizedRole>.self, forKey: .authorizedRole)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.directReportsCount = try container.decode(Nullable<Int>.self, forKey: .directReportsCount)
        self.email = try container.decode(Nullable<String>.self, forKey: .email)
        self.id = try container.decode(String.self, forKey: .id)
        self.isAgent = try container.decode(Bool.self, forKey: .isAgent)
        self.isPartner = try container.decode(Bool.self, forKey: .isPartner)
        self.reportsToChain = try container.decode(Nullable<[TeamMemberManager]>.self, forKey: .reportsToChain)
        self.reportsToId = try container.decode(Nullable<String>.self, forKey: .reportsToId)
        self.role = try container.decode(TeamMemberRole.self, forKey: .role)
        self.status = try container.decode(TeamMemberStatus.self, forKey: .status)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.user = try container.decode(Nullable<UserSummary>.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.authorizedRole, forKey: .authorizedRole)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.directReportsCount, forKey: .directReportsCount)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.isAgent, forKey: .isAgent)
        try container.encode(self.isPartner, forKey: .isPartner)
        try container.encode(self.reportsToChain, forKey: .reportsToChain)
        try container.encode(self.reportsToId, forKey: .reportsToId)
        try container.encode(self.role, forKey: .role)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case authorizedRole = "authorized_role"
        case createdAt = "created_at"
        case directReportsCount = "direct_reports_count"
        case email
        case id
        case isAgent = "is_agent"
        case isPartner = "is_partner"
        case reportsToChain = "reports_to_chain"
        case reportsToId = "reports_to_id"
        case role
        case status
        case updatedAt = "updated_at"
        case user
    }
}