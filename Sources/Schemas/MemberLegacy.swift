import Foundation

/// A member represents a user's relationship with a company on Whop, including their access level, status, and spending history.
public struct MemberLegacy: Codable, Hashable, Sendable {
    /// The member's content access level. `admin` means their team role grants administrative content access, `customer` means they hold a valid product membership, and `no_access` means they cannot access company content.
    public let accessLevel: AccessLevel
    /// The company for the member.
    public let company: MemberLegacyCompany
    /// The member's token balance for this company. Computed live from the ledger, not from a cache.
    public let companyTokenBalance: Double
    /// The datetime the company member was created.
    public let createdAt: Date
    /// The unique identifier for the company member.
    public let id: String
    /// When the member joined the company
    public let joinedAt: Date
    /// The most recent action the member has taken.
    public let mostRecentAction: Nullable<MemberMostRecentActions>
    /// The time for the most recent action, if applicable.
    public let mostRecentActionAt: Nullable<Date>
    /// The phone number for the member, if available.
    public let phone: Nullable<String>
    /// The status of the member
    public let status: MemberStatuses
    /// The datetime the company member was last updated.
    public let updatedAt: Date
    /// How much money this customer has spent on the company's products and plans
    public let usdTotalSpent: Double
    /// The user for this member, if any.
    public let user: Nullable<MemberLegacyUser>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accessLevel: AccessLevel,
        company: MemberLegacyCompany,
        companyTokenBalance: Double,
        createdAt: Date,
        id: String,
        joinedAt: Date,
        mostRecentAction: Nullable<MemberMostRecentActions>,
        mostRecentActionAt: Nullable<Date>,
        phone: Nullable<String>,
        status: MemberStatuses,
        updatedAt: Date,
        usdTotalSpent: Double,
        user: Nullable<MemberLegacyUser>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accessLevel = accessLevel
        self.company = company
        self.companyTokenBalance = companyTokenBalance
        self.createdAt = createdAt
        self.id = id
        self.joinedAt = joinedAt
        self.mostRecentAction = mostRecentAction
        self.mostRecentActionAt = mostRecentActionAt
        self.phone = phone
        self.status = status
        self.updatedAt = updatedAt
        self.usdTotalSpent = usdTotalSpent
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accessLevel = try container.decode(AccessLevel.self, forKey: .accessLevel)
        self.company = try container.decode(MemberLegacyCompany.self, forKey: .company)
        self.companyTokenBalance = try container.decode(Double.self, forKey: .companyTokenBalance)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.joinedAt = try container.decode(Date.self, forKey: .joinedAt)
        self.mostRecentAction = try container.decode(Nullable<MemberMostRecentActions>.self, forKey: .mostRecentAction)
        self.mostRecentActionAt = try container.decode(Nullable<Date>.self, forKey: .mostRecentActionAt)
        self.phone = try container.decode(Nullable<String>.self, forKey: .phone)
        self.status = try container.decode(MemberStatuses.self, forKey: .status)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.usdTotalSpent = try container.decode(Double.self, forKey: .usdTotalSpent)
        self.user = try container.decode(Nullable<MemberLegacyUser>.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accessLevel, forKey: .accessLevel)
        try container.encode(self.company, forKey: .company)
        try container.encode(self.companyTokenBalance, forKey: .companyTokenBalance)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.joinedAt, forKey: .joinedAt)
        try container.encode(self.mostRecentAction, forKey: .mostRecentAction)
        try container.encode(self.mostRecentActionAt, forKey: .mostRecentActionAt)
        try container.encode(self.phone, forKey: .phone)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.usdTotalSpent, forKey: .usdTotalSpent)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accessLevel = "access_level"
        case company
        case companyTokenBalance = "company_token_balance"
        case createdAt = "created_at"
        case id
        case joinedAt = "joined_at"
        case mostRecentAction = "most_recent_action"
        case mostRecentActionAt = "most_recent_action_at"
        case phone
        case status
        case updatedAt = "updated_at"
        case usdTotalSpent = "usd_total_spent"
        case user
    }
}