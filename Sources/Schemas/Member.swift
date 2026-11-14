import Foundation

public struct Member: Codable, Hashable, Sendable {
    /// What the member can reach on the account: `customer` for paying members, `admin` for team members, `no_access` once every grant has lapsed.
    public let accessLevel: MemberAccessLevel
    /// The account this member belongs to, prefixed `biz_`.
    public let accountId: String
    /// When the member record was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// The name to show for this member: the user's name, or their username when they have not set one. The buying business's name when `user` is `null`.
    public let displayName: String
    /// The user's gross income across Whop, in USD, refreshed periodically. `null` when the user hides their earnings or the buyer is another business.
    public let earningsUsd: Nullable<UserEarningsAmount>
    /// The user's email address. `null` without `member:email:read` on the account, when the buyer is another business, or when the user has no assigned email.
    public let email: Nullable<String>
    /// Member ID, prefixed `mber_`.
    public let id: String
    /// When the member first joined the account, as an ISO 8601 timestamp.
    public let joinedAt: String
    /// When the member last opened the account's content, as an ISO 8601 timestamp. `null` if they never have.
    public let lastAccessedAt: Nullable<String>
    /// What happened at `last_activity_at`. `object` says which kind of activity it is. `null` without `support_chat:read` on the account, or when `last_activity_at` is `null`.
    public let lastActivity: Nullable<MemberLastActivity>
    /// When the member and the account last interacted, as an ISO 8601 timestamp. For example, a message in the member's support chat.
    public let lastActivityAt: Nullable<String>
    /// Your own key-value data stored on this member. `null` when none is set.
    public let metadata: Nullable<[String: JSONValue]>
    /// The member's latest lifecycle state on the account, derived from their memberships, such as `paid_subscriber`, `canceling`, or `churned`. `null` until it is first computed.
    public let mostRecentAction: Nullable<MemberMostRecentAction>
    /// When `most_recent_action` took effect, as an ISO 8601 timestamp. `null` when `most_recent_action` is `null`.
    public let mostRecentActionAt: Nullable<String>
    /// The name the account gave this customer with `PATCH /members/:id`. Invoices show it as the customer name on every invoice for this member, in place of the user's own name. `null` when the account has not set one.
    public let name: Nullable<String>
    /// The member's phone number: the most recent number collected (or verified) at checkout, otherwise their account number when they have shared one with this seller. `null` without `member:phone:read` on the account, or when there is neither.
    public let phoneNumber: Nullable<String>
    /// `joined` while the member is part of the account, `left` after they leave.
    public let status: MemberStatus
    /// The member's current token balance for this account, computed from token transactions.
    public let tokenBalance: Double
    /// `unsubscribed` once the member opts out of the account's marketing communications, `null` while they're subscribed. Only the member can change it.
    public let unsubscribeStatus: Nullable<MemberUnsubscribeStatus>
    /// How much the member has spent on the account's products, in USD.
    public let usdTotalSpent: Money
    /// The user behind this member. `null` when the buyer is another business rather than a person.
    public let user: Nullable<MemberUser>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accessLevel: MemberAccessLevel,
        accountId: String,
        createdAt: String,
        displayName: String,
        earningsUsd: Nullable<UserEarningsAmount>,
        email: Nullable<String>,
        id: String,
        joinedAt: String,
        lastAccessedAt: Nullable<String>,
        lastActivity: Nullable<MemberLastActivity>,
        lastActivityAt: Nullable<String>,
        metadata: Nullable<[String: JSONValue]>,
        mostRecentAction: Nullable<MemberMostRecentAction>,
        mostRecentActionAt: Nullable<String>,
        name: Nullable<String>,
        phoneNumber: Nullable<String>,
        status: MemberStatus,
        tokenBalance: Double,
        unsubscribeStatus: Nullable<MemberUnsubscribeStatus>,
        usdTotalSpent: Money,
        user: Nullable<MemberUser>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accessLevel = accessLevel
        self.accountId = accountId
        self.createdAt = createdAt
        self.displayName = displayName
        self.earningsUsd = earningsUsd
        self.email = email
        self.id = id
        self.joinedAt = joinedAt
        self.lastAccessedAt = lastAccessedAt
        self.lastActivity = lastActivity
        self.lastActivityAt = lastActivityAt
        self.metadata = metadata
        self.mostRecentAction = mostRecentAction
        self.mostRecentActionAt = mostRecentActionAt
        self.name = name
        self.phoneNumber = phoneNumber
        self.status = status
        self.tokenBalance = tokenBalance
        self.unsubscribeStatus = unsubscribeStatus
        self.usdTotalSpent = usdTotalSpent
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accessLevel = try container.decode(MemberAccessLevel.self, forKey: .accessLevel)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.displayName = try container.decode(String.self, forKey: .displayName)
        self.earningsUsd = try container.decode(Nullable<UserEarningsAmount>.self, forKey: .earningsUsd)
        self.email = try container.decode(Nullable<String>.self, forKey: .email)
        self.id = try container.decode(String.self, forKey: .id)
        self.joinedAt = try container.decode(String.self, forKey: .joinedAt)
        self.lastAccessedAt = try container.decode(Nullable<String>.self, forKey: .lastAccessedAt)
        self.lastActivity = try container.decode(Nullable<MemberLastActivity>.self, forKey: .lastActivity)
        self.lastActivityAt = try container.decode(Nullable<String>.self, forKey: .lastActivityAt)
        self.metadata = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .metadata)
        self.mostRecentAction = try container.decode(Nullable<MemberMostRecentAction>.self, forKey: .mostRecentAction)
        self.mostRecentActionAt = try container.decode(Nullable<String>.self, forKey: .mostRecentActionAt)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.phoneNumber = try container.decode(Nullable<String>.self, forKey: .phoneNumber)
        self.status = try container.decode(MemberStatus.self, forKey: .status)
        self.tokenBalance = try container.decode(Double.self, forKey: .tokenBalance)
        self.unsubscribeStatus = try container.decode(Nullable<MemberUnsubscribeStatus>.self, forKey: .unsubscribeStatus)
        self.usdTotalSpent = try container.decode(Money.self, forKey: .usdTotalSpent)
        self.user = try container.decode(Nullable<MemberUser>.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accessLevel, forKey: .accessLevel)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.displayName, forKey: .displayName)
        try container.encode(self.earningsUsd, forKey: .earningsUsd)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.joinedAt, forKey: .joinedAt)
        try container.encode(self.lastAccessedAt, forKey: .lastAccessedAt)
        try container.encode(self.lastActivity, forKey: .lastActivity)
        try container.encode(self.lastActivityAt, forKey: .lastActivityAt)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.mostRecentAction, forKey: .mostRecentAction)
        try container.encode(self.mostRecentActionAt, forKey: .mostRecentActionAt)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.phoneNumber, forKey: .phoneNumber)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.tokenBalance, forKey: .tokenBalance)
        try container.encode(self.unsubscribeStatus, forKey: .unsubscribeStatus)
        try container.encode(self.usdTotalSpent, forKey: .usdTotalSpent)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accessLevel = "access_level"
        case accountId = "account_id"
        case createdAt = "created_at"
        case displayName = "display_name"
        case earningsUsd = "earnings_usd"
        case email
        case id
        case joinedAt = "joined_at"
        case lastAccessedAt = "last_accessed_at"
        case lastActivity = "last_activity"
        case lastActivityAt = "last_activity_at"
        case metadata
        case mostRecentAction = "most_recent_action"
        case mostRecentActionAt = "most_recent_action_at"
        case name
        case phoneNumber = "phone_number"
        case status
        case tokenBalance = "token_balance"
        case unsubscribeStatus = "unsubscribe_status"
        case usdTotalSpent = "usd_total_spent"
        case user
    }
}