import Foundation

public struct Partner: Codable, Hashable, Sendable {
    /// The business whose `payout_rates` these are, prefixed `biz_`, when the request sent `account_id`. `null` when the rates are the caller's own.
    public let accountId: Nullable<String>
    /// Whether the user finished the partner certification course: every visible quiz and knowledge check has a passing result, or, when the course has none, every visible lesson is marked completed.
    public let certificationComplete: Bool
    /// When the user joined the partner program, as an ISO 8601 timestamp. Null when they have not joined.
    public let joinedAt: Nullable<String>
    public let payoutRates: [PartnerPayoutTier]
    /// Number of active first-tier business referrals attributed to the partner, excluding deleted businesses.
    public let referredBusinessesCount: Int
    /// The user currently attributed as this user's primary referrer. Null when there is no active primary referral.
    public let referringPartner: Nullable<UserSummary>
    /// The authenticated partner's public profile.
    public let user: UserSummary
    /// Whether the user has a pending or approved personal entry on the Verified Partner waitlist.
    public let verificationWaitlistJoined: Bool
    /// When the user became a verified Whop Partner, as an ISO 8601 timestamp. `null` if not verified.
    public let whopPartnerVerifiedAt: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: Nullable<String>,
        certificationComplete: Bool,
        joinedAt: Nullable<String>,
        payoutRates: [PartnerPayoutTier],
        referredBusinessesCount: Int,
        referringPartner: Nullable<UserSummary>,
        user: UserSummary,
        verificationWaitlistJoined: Bool,
        whopPartnerVerifiedAt: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.certificationComplete = certificationComplete
        self.joinedAt = joinedAt
        self.payoutRates = payoutRates
        self.referredBusinessesCount = referredBusinessesCount
        self.referringPartner = referringPartner
        self.user = user
        self.verificationWaitlistJoined = verificationWaitlistJoined
        self.whopPartnerVerifiedAt = whopPartnerVerifiedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(Nullable<String>.self, forKey: .accountId)
        self.certificationComplete = try container.decode(Bool.self, forKey: .certificationComplete)
        self.joinedAt = try container.decode(Nullable<String>.self, forKey: .joinedAt)
        self.payoutRates = try container.decode([PartnerPayoutTier].self, forKey: .payoutRates)
        self.referredBusinessesCount = try container.decode(Int.self, forKey: .referredBusinessesCount)
        self.referringPartner = try container.decode(Nullable<UserSummary>.self, forKey: .referringPartner)
        self.user = try container.decode(UserSummary.self, forKey: .user)
        self.verificationWaitlistJoined = try container.decode(Bool.self, forKey: .verificationWaitlistJoined)
        self.whopPartnerVerifiedAt = try container.decode(Nullable<String>.self, forKey: .whopPartnerVerifiedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.certificationComplete, forKey: .certificationComplete)
        try container.encode(self.joinedAt, forKey: .joinedAt)
        try container.encode(self.payoutRates, forKey: .payoutRates)
        try container.encode(self.referredBusinessesCount, forKey: .referredBusinessesCount)
        try container.encode(self.referringPartner, forKey: .referringPartner)
        try container.encode(self.user, forKey: .user)
        try container.encode(self.verificationWaitlistJoined, forKey: .verificationWaitlistJoined)
        try container.encode(self.whopPartnerVerifiedAt, forKey: .whopPartnerVerifiedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case certificationComplete = "certification_complete"
        case joinedAt = "joined_at"
        case payoutRates = "payout_rates"
        case referredBusinessesCount = "referred_businesses_count"
        case referringPartner = "referring_partner"
        case user
        case verificationWaitlistJoined = "verification_waitlist_joined"
        case whopPartnerVerifiedAt = "whop_partner_verified_at"
    }
}