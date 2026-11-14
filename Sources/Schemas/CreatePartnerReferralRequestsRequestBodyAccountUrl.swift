import Foundation

public struct CreatePartnerReferralRequestsRequestBodyAccountUrl: Codable, Hashable, Sendable {
    /// HTTP or HTTPS Whop business or product link.
    public let accountUrl: String
    /// Your team membership on the business this referral is made for, prefixed `ausr_`. Omit for a personal referral.
    public let authorizedUserId: String?
    /// Your member record on the business this referral is made for, prefixed `mber_`, when your role there is held on your member record. Send this or `authorized_user_id`, not both.
    public let memberId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountUrl: String,
        authorizedUserId: String? = nil,
        memberId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountUrl = accountUrl
        self.authorizedUserId = authorizedUserId
        self.memberId = memberId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountUrl = try container.decode(String.self, forKey: .accountUrl)
        self.authorizedUserId = try container.decodeIfPresent(String.self, forKey: .authorizedUserId)
        self.memberId = try container.decodeIfPresent(String.self, forKey: .memberId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountUrl, forKey: .accountUrl)
        try container.encodeIfPresent(self.authorizedUserId, forKey: .authorizedUserId)
        try container.encodeIfPresent(self.memberId, forKey: .memberId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountUrl = "account_url"
        case authorizedUserId = "authorized_user_id"
        case memberId = "member_id"
    }
}