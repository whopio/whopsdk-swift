import Foundation

/// Create your own referral link with an optional custom code and redemption limit. Without configuration, returns your oldest saved link for the selected team membership, or your personal context when `authorized_user_id` is omitted, creating a random code when none exists.
public struct CreatePartnerReferralRequestsRequestBodyCode: Codable, Hashable, Sendable {
    /// The partner's team membership on the business this link is made for, prefixed `ausr_`. Omit for a personal link.
    public let authorizedUserId: String?
    /// Case-insensitive referral code containing letters, numbers, and single hyphens. New codes are stored in lowercase. Omit to generate six random letters, or reuse a saved link when no configuration is supplied.
    public let code: String?
    /// Maximum permitted redemptions, or null for no configured limit.
    public let maxRedemptions: Nullable<Int>?
    /// The partner's member record on the business this link is made for, prefixed `mber_`, when their role there is held on their member record. Send this or `authorized_user_id`, not both.
    public let memberId: String?
    /// Optional. Your own partner ID, prefixed `user_`; you cannot create a link for another partner.
    public let partnerId: String?
    /// Create or retrieve a reusable referral link without requesting attribution for an existing business.
    public let requestType: CreatePartnerReferralRequestsRequestBodyCodeRequestType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        authorizedUserId: String? = nil,
        code: String? = nil,
        maxRedemptions: Nullable<Int>? = nil,
        memberId: String? = nil,
        partnerId: String? = nil,
        requestType: CreatePartnerReferralRequestsRequestBodyCodeRequestType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.authorizedUserId = authorizedUserId
        self.code = code
        self.maxRedemptions = maxRedemptions
        self.memberId = memberId
        self.partnerId = partnerId
        self.requestType = requestType
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.authorizedUserId = try container.decodeIfPresent(String.self, forKey: .authorizedUserId)
        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.maxRedemptions = try container.decodeNullableIfPresent(Int.self, forKey: .maxRedemptions)
        self.memberId = try container.decodeIfPresent(String.self, forKey: .memberId)
        self.partnerId = try container.decodeIfPresent(String.self, forKey: .partnerId)
        self.requestType = try container.decode(CreatePartnerReferralRequestsRequestBodyCodeRequestType.self, forKey: .requestType)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.authorizedUserId, forKey: .authorizedUserId)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeNullableIfPresent(self.maxRedemptions, forKey: .maxRedemptions)
        try container.encodeIfPresent(self.memberId, forKey: .memberId)
        try container.encodeIfPresent(self.partnerId, forKey: .partnerId)
        try container.encode(self.requestType, forKey: .requestType)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case authorizedUserId = "authorized_user_id"
        case code
        case maxRedemptions = "max_redemptions"
        case memberId = "member_id"
        case partnerId = "partner_id"
        case requestType = "request_type"
    }
}