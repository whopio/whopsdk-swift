import Foundation

public struct PartnerReferralRequest: Codable, Hashable, Sendable {
    /// Business receiving the request, when one is assigned.
    public let account: Nullable<AccountSummary>
    /// The partner's team membership this referral was created for, prefixed `ausr_`. `null` when the referral is personal.
    public let authorizedUserId: Nullable<String>
    /// Unique referral code, when assigned.
    public let code: Nullable<String>
    /// When the request was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Partner referral request ID, prefixed `prfr_`.
    public let id: String
    /// Maximum permitted redemptions, when limited.
    public let maxRedemptions: Nullable<Int>
    /// The partner's member record this referral was created for, prefixed `mber_`, when their role on that business is held on their member record. `null` otherwise.
    public let memberId: Nullable<String>
    /// Public profile of the requesting partner.
    public let partner: UserSummary
    /// Business the partner sent this request on behalf of, when the referral belongs to their team. `null` for a personal referral.
    public let referringAccount: Nullable<AccountSummary>
    /// How the referral request was initiated.
    public let requestType: PartnerReferralRequestRequestType
    public let rewards: [PartnerReferralReward]
    /// The approval state, or null for requests without an approval process.
    public let status: Nullable<PartnerReferralRequestStatus>
    /// When the request last changed, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// User receiving the attribution request, or null for a business request or referral link.
    public let user: Nullable<UserSummary>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: Nullable<AccountSummary>,
        authorizedUserId: Nullable<String>,
        code: Nullable<String>,
        createdAt: String,
        id: String,
        maxRedemptions: Nullable<Int>,
        memberId: Nullable<String>,
        partner: UserSummary,
        referringAccount: Nullable<AccountSummary>,
        requestType: PartnerReferralRequestRequestType,
        rewards: [PartnerReferralReward],
        status: Nullable<PartnerReferralRequestStatus>,
        updatedAt: String,
        user: Nullable<UserSummary>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.authorizedUserId = authorizedUserId
        self.code = code
        self.createdAt = createdAt
        self.id = id
        self.maxRedemptions = maxRedemptions
        self.memberId = memberId
        self.partner = partner
        self.referringAccount = referringAccount
        self.requestType = requestType
        self.rewards = rewards
        self.status = status
        self.updatedAt = updatedAt
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decode(Nullable<AccountSummary>.self, forKey: .account)
        self.authorizedUserId = try container.decode(Nullable<String>.self, forKey: .authorizedUserId)
        self.code = try container.decode(Nullable<String>.self, forKey: .code)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.maxRedemptions = try container.decode(Nullable<Int>.self, forKey: .maxRedemptions)
        self.memberId = try container.decode(Nullable<String>.self, forKey: .memberId)
        self.partner = try container.decode(UserSummary.self, forKey: .partner)
        self.referringAccount = try container.decode(Nullable<AccountSummary>.self, forKey: .referringAccount)
        self.requestType = try container.decode(PartnerReferralRequestRequestType.self, forKey: .requestType)
        self.rewards = try container.decode([PartnerReferralReward].self, forKey: .rewards)
        self.status = try container.decode(Nullable<PartnerReferralRequestStatus>.self, forKey: .status)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.user = try container.decode(Nullable<UserSummary>.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.authorizedUserId, forKey: .authorizedUserId)
        try container.encode(self.code, forKey: .code)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.maxRedemptions, forKey: .maxRedemptions)
        try container.encode(self.memberId, forKey: .memberId)
        try container.encode(self.partner, forKey: .partner)
        try container.encode(self.referringAccount, forKey: .referringAccount)
        try container.encode(self.requestType, forKey: .requestType)
        try container.encode(self.rewards, forKey: .rewards)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case authorizedUserId = "authorized_user_id"
        case code
        case createdAt = "created_at"
        case id
        case maxRedemptions = "max_redemptions"
        case memberId = "member_id"
        case partner
        case referringAccount = "referring_account"
        case requestType = "request_type"
        case rewards
        case status
        case updatedAt = "updated_at"
        case user
    }
}