import Foundation

public struct User: Codable, Hashable, Sendable {
    /// The user's balance: personal cash + crypto + in-flight treasury deposits, plus account balances for accounts they own. Computed only on the self view (retrieved with the reserved id `me`) for callers with balance-read scope; `null` otherwise.
    public let balance: Nullable<UserBalance>
    /// The user's cumulative wallet balance over time (USD `{ t, v }` points plus last/min/max), for the balance chart. Opt in with `include_balance_history=true` when retrieving yourself with the reserved id `me`; populated only for callers with balance-read scope and `null` otherwise. A user with no wallet activity returns an empty series.
    public let balanceHistory: Nullable<UserBalanceHistory>
    /// The user's profile banner wrapper. `null` when the user has no banner.
    public let banner: Nullable<UserBanner>
    /// The user's biography
    public let bio: Nullable<String>
    /// When the user was created, as an ISO 8601 timestamp
    public let createdAt: String
    /// The user's gross USD income over time. Populated only on single-user self reads for callers with balance-read scope; `null` otherwise.
    public let earningsUsd: Nullable<UserEarnings>
    /// The user's email address. Populated only on the self view (retrieved with the reserved id `me`) for callers with email-read scope; `null` otherwise, or while the account has no confirmed email yet.
    public let email: Nullable<String>
    /// User ID, prefixed `user_`.
    public let id: String
    /// The user's display name
    public let name: Nullable<String>
    /// Avatar wrapper; its `url` is always present, using a generated placeholder when the user set no picture.
    public let profilePicture: UserProfilePicture
    public let socialAccounts: [SocialAccount]
    /// Whop staff access flags. Populated only on the self view (retrieved with the reserved id `me`) for callers with staff-read scope; `null` there for every user who is not Whop staff, and always `null` elsewhere.
    public let staff: Nullable<UserStaffAccess>
    /// The user's unique username
    public let username: String
    /// Identity verification status for the user's `individual` (KYC) and `business` (KYB) profiles. Each is `null` until created, otherwise a `status` of `not_started`, `pending`, `approved`, or `rejected`.
    public let verification: [String: JSONValue]
    /// When the user became an enrolled Whop Partner, as an ISO 8601 timestamp. `null` if never enrolled.
    public let whopPartnerEnabledAt: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        balance: Nullable<UserBalance>,
        balanceHistory: Nullable<UserBalanceHistory>,
        banner: Nullable<UserBanner>,
        bio: Nullable<String>,
        createdAt: String,
        earningsUsd: Nullable<UserEarnings>,
        email: Nullable<String>,
        id: String,
        name: Nullable<String>,
        profilePicture: UserProfilePicture,
        socialAccounts: [SocialAccount],
        staff: Nullable<UserStaffAccess>,
        username: String,
        verification: [String: JSONValue],
        whopPartnerEnabledAt: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.balance = balance
        self.balanceHistory = balanceHistory
        self.banner = banner
        self.bio = bio
        self.createdAt = createdAt
        self.earningsUsd = earningsUsd
        self.email = email
        self.id = id
        self.name = name
        self.profilePicture = profilePicture
        self.socialAccounts = socialAccounts
        self.staff = staff
        self.username = username
        self.verification = verification
        self.whopPartnerEnabledAt = whopPartnerEnabledAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.balance = try container.decode(Nullable<UserBalance>.self, forKey: .balance)
        self.balanceHistory = try container.decode(Nullable<UserBalanceHistory>.self, forKey: .balanceHistory)
        self.banner = try container.decode(Nullable<UserBanner>.self, forKey: .banner)
        self.bio = try container.decode(Nullable<String>.self, forKey: .bio)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.earningsUsd = try container.decode(Nullable<UserEarnings>.self, forKey: .earningsUsd)
        self.email = try container.decode(Nullable<String>.self, forKey: .email)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.profilePicture = try container.decode(UserProfilePicture.self, forKey: .profilePicture)
        self.socialAccounts = try container.decode([SocialAccount].self, forKey: .socialAccounts)
        self.staff = try container.decode(Nullable<UserStaffAccess>.self, forKey: .staff)
        self.username = try container.decode(String.self, forKey: .username)
        self.verification = try container.decode([String: JSONValue].self, forKey: .verification)
        self.whopPartnerEnabledAt = try container.decode(Nullable<String>.self, forKey: .whopPartnerEnabledAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.balance, forKey: .balance)
        try container.encode(self.balanceHistory, forKey: .balanceHistory)
        try container.encode(self.banner, forKey: .banner)
        try container.encode(self.bio, forKey: .bio)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.earningsUsd, forKey: .earningsUsd)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.profilePicture, forKey: .profilePicture)
        try container.encode(self.socialAccounts, forKey: .socialAccounts)
        try container.encode(self.staff, forKey: .staff)
        try container.encode(self.username, forKey: .username)
        try container.encode(self.verification, forKey: .verification)
        try container.encode(self.whopPartnerEnabledAt, forKey: .whopPartnerEnabledAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case balance
        case balanceHistory = "balance_history"
        case banner
        case bio
        case createdAt = "created_at"
        case earningsUsd = "earnings_usd"
        case email
        case id
        case name
        case profilePicture = "profile_picture"
        case socialAccounts = "social_accounts"
        case staff
        case username
        case verification
        case whopPartnerEnabledAt = "whop_partner_enabled_at"
    }
}