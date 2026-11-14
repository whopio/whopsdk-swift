import Foundation

public struct User: Codable, Hashable, Sendable {
    /// The user's balance: personal cash + other holdings + deposits still in flight, plus account balances for accounts they own. Computed only on the self view (retrieved with the reserved id `me`) for callers with balance-read scope; `null` otherwise, or when `include_balance=false`.
    public let balance: Nullable<UserBalance>
    /// The user's cumulative wallet balance over time (USD `{ t, v }` points plus last/min/max), for the balance chart. Opt in with `include_balance_history=true` when retrieving yourself with the reserved id `me`; populated only for callers with balance-read scope and `null` otherwise. A user with no wallet activity returns an empty series.
    public let balanceHistory: Nullable<UserBalanceHistory>
    public let balances: [AccountBalanceToken]
    /// The user's profile banner wrapper. `null` when the user has no banner.
    public let banner: Nullable<UserBanner>
    /// The user's biography
    public let bio: Nullable<String>
    /// Where the user's personal card application stands. Populated only on the self view (retrieved with the reserved id `me`) for callers with balance-read scope; `null` otherwise, or when the user has never applied for a card.
    public let cards: Nullable<AccountCards>
    /// The user's city, derived from their IP address. `null` when unknown or the user turned off location sharing.
    public let city: Nullable<String>
    /// The user's country as an ISO 3166-1 alpha-2 code, derived from their IP address. `null` when unknown or the user turned off location sharing.
    public let country: Nullable<String>
    /// When the user was created, as an ISO 8601 timestamp
    public let createdAt: String
    /// The user's date of birth as an ISO 8601 date, like `1998-04-23`. Populated only on the self view (retrieved with the reserved id `me`) for callers with email-read scope; `null` otherwise, or when the user has not set one.
    public let dateOfBirth: Nullable<String>
    /// The user's gross USD income over time, including a Partner commission breakdown. Populated only on single-user self reads for callers with balance-read scope; `null` otherwise.
    public let earningsUsd: Nullable<UserEarnings>
    /// The user's email address. Populated only on the self view (retrieved with the reserved id `me`) for callers with email-read scope; `null` otherwise, or while the account has no confirmed email yet.
    public let email: Nullable<String>
    /// User ID, prefixed `user_`.
    public let id: String
    /// The user's Whop Levels progress, counted across every account they own. Populated only on the self view (retrieved with the reserved id `me`) for callers with balance-read scope; `null` otherwise, and when none of their accounts are in Whop Levels.
    public let level: Nullable<OwnerLevel>
    /// The user's display name
    public let name: Nullable<String>
    /// Avatar wrapper. Its `url` is always present, and is a generated placeholder when the user set no picture.
    public let profilePicture: UserProfilePicture
    public let socialLinks: [UserSocialLink]
    /// The user's state or region, derived from their IP address. `null` when unknown or the user turned off location sharing.
    public let state: Nullable<String>
    /// Total USD value of the user's personal holdings in `balances`, across those with known exchange rates. Computed only on the self view (retrieved with the reserved id `me`) for callers with balance-read scope; `null` otherwise, when `include_balance=false`, or when the balance source is unavailable.
    public let totalUsd: Nullable<String>
    /// The trading account address, a snapshot of its margin and open positions, and its WebSocket subscriptions. Opt in with `include_trading=true` when retrieving `me`. `null` otherwise, without trading permission, or without an Ethereum wallet.
    public let trading: Nullable<TradingAccount>
    /// The user's unique username
    public let username: String
    /// Identity verification status for the user's `individual` (KYC) and `business` (KYB) profiles. Each is `null` until created, otherwise a `status` of `not_started`, `pending`, `approved`, or `rejected`.
    public let verification: [String: JSONValue]
    /// When the user became an enrolled Whop Partner, as an ISO 8601 timestamp. `null` if never enrolled.
    public let whopPartnerEnabledAt: Nullable<String>
    /// Number of accounts the user referred to Whop as a Whop Partner that have processed more than $1 in volume attributed to the user. Populated only when retrieving a single user who is a Verified Whop Partner; `null` otherwise.
    public let whopPartnerOnboardedAccountsCount: Nullable<Int>
    /// When the user became a Verified Whop Partner, as an ISO 8601 timestamp. `null` for users who are not Verified Whop Partners, including partners who left the program and suspended users.
    public let whopPartnerVerifiedAt: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        balance: Nullable<UserBalance>,
        balanceHistory: Nullable<UserBalanceHistory>,
        balances: [AccountBalanceToken],
        banner: Nullable<UserBanner>,
        bio: Nullable<String>,
        cards: Nullable<AccountCards>,
        city: Nullable<String>,
        country: Nullable<String>,
        createdAt: String,
        dateOfBirth: Nullable<String>,
        earningsUsd: Nullable<UserEarnings>,
        email: Nullable<String>,
        id: String,
        level: Nullable<OwnerLevel>,
        name: Nullable<String>,
        profilePicture: UserProfilePicture,
        socialLinks: [UserSocialLink],
        state: Nullable<String>,
        totalUsd: Nullable<String>,
        trading: Nullable<TradingAccount>,
        username: String,
        verification: [String: JSONValue],
        whopPartnerEnabledAt: Nullable<String>,
        whopPartnerOnboardedAccountsCount: Nullable<Int>,
        whopPartnerVerifiedAt: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.balance = balance
        self.balanceHistory = balanceHistory
        self.balances = balances
        self.banner = banner
        self.bio = bio
        self.cards = cards
        self.city = city
        self.country = country
        self.createdAt = createdAt
        self.dateOfBirth = dateOfBirth
        self.earningsUsd = earningsUsd
        self.email = email
        self.id = id
        self.level = level
        self.name = name
        self.profilePicture = profilePicture
        self.socialLinks = socialLinks
        self.state = state
        self.totalUsd = totalUsd
        self.trading = trading
        self.username = username
        self.verification = verification
        self.whopPartnerEnabledAt = whopPartnerEnabledAt
        self.whopPartnerOnboardedAccountsCount = whopPartnerOnboardedAccountsCount
        self.whopPartnerVerifiedAt = whopPartnerVerifiedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.balance = try container.decode(Nullable<UserBalance>.self, forKey: .balance)
        self.balanceHistory = try container.decode(Nullable<UserBalanceHistory>.self, forKey: .balanceHistory)
        self.balances = try container.decode([AccountBalanceToken].self, forKey: .balances)
        self.banner = try container.decode(Nullable<UserBanner>.self, forKey: .banner)
        self.bio = try container.decode(Nullable<String>.self, forKey: .bio)
        self.cards = try container.decode(Nullable<AccountCards>.self, forKey: .cards)
        self.city = try container.decode(Nullable<String>.self, forKey: .city)
        self.country = try container.decode(Nullable<String>.self, forKey: .country)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.dateOfBirth = try container.decode(Nullable<String>.self, forKey: .dateOfBirth)
        self.earningsUsd = try container.decode(Nullable<UserEarnings>.self, forKey: .earningsUsd)
        self.email = try container.decode(Nullable<String>.self, forKey: .email)
        self.id = try container.decode(String.self, forKey: .id)
        self.level = try container.decode(Nullable<OwnerLevel>.self, forKey: .level)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.profilePicture = try container.decode(UserProfilePicture.self, forKey: .profilePicture)
        self.socialLinks = try container.decode([UserSocialLink].self, forKey: .socialLinks)
        self.state = try container.decode(Nullable<String>.self, forKey: .state)
        self.totalUsd = try container.decode(Nullable<String>.self, forKey: .totalUsd)
        self.trading = try container.decode(Nullable<TradingAccount>.self, forKey: .trading)
        self.username = try container.decode(String.self, forKey: .username)
        self.verification = try container.decode([String: JSONValue].self, forKey: .verification)
        self.whopPartnerEnabledAt = try container.decode(Nullable<String>.self, forKey: .whopPartnerEnabledAt)
        self.whopPartnerOnboardedAccountsCount = try container.decode(Nullable<Int>.self, forKey: .whopPartnerOnboardedAccountsCount)
        self.whopPartnerVerifiedAt = try container.decode(Nullable<String>.self, forKey: .whopPartnerVerifiedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.balance, forKey: .balance)
        try container.encode(self.balanceHistory, forKey: .balanceHistory)
        try container.encode(self.balances, forKey: .balances)
        try container.encode(self.banner, forKey: .banner)
        try container.encode(self.bio, forKey: .bio)
        try container.encode(self.cards, forKey: .cards)
        try container.encode(self.city, forKey: .city)
        try container.encode(self.country, forKey: .country)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.dateOfBirth, forKey: .dateOfBirth)
        try container.encode(self.earningsUsd, forKey: .earningsUsd)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.level, forKey: .level)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.profilePicture, forKey: .profilePicture)
        try container.encode(self.socialLinks, forKey: .socialLinks)
        try container.encode(self.state, forKey: .state)
        try container.encode(self.totalUsd, forKey: .totalUsd)
        try container.encode(self.trading, forKey: .trading)
        try container.encode(self.username, forKey: .username)
        try container.encode(self.verification, forKey: .verification)
        try container.encode(self.whopPartnerEnabledAt, forKey: .whopPartnerEnabledAt)
        try container.encode(self.whopPartnerOnboardedAccountsCount, forKey: .whopPartnerOnboardedAccountsCount)
        try container.encode(self.whopPartnerVerifiedAt, forKey: .whopPartnerVerifiedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case balance
        case balanceHistory = "balance_history"
        case balances
        case banner
        case bio
        case cards
        case city
        case country
        case createdAt = "created_at"
        case dateOfBirth = "date_of_birth"
        case earningsUsd = "earnings_usd"
        case email
        case id
        case level
        case name
        case profilePicture = "profile_picture"
        case socialLinks = "social_links"
        case state
        case totalUsd = "total_usd"
        case trading
        case username
        case verification
        case whopPartnerEnabledAt = "whop_partner_enabled_at"
        case whopPartnerOnboardedAccountsCount = "whop_partner_onboarded_accounts_count"
        case whopPartnerVerifiedAt = "whop_partner_verified_at"
    }
}