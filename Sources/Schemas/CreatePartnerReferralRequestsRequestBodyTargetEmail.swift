import Foundation

public struct CreatePartnerReferralRequestsRequestBodyTargetEmail: Codable, Hashable, Sendable {
    /// Your team membership on the business this referral is made for, prefixed `ausr_`. Omit for a personal referral.
    public let authorizedUserId: String?
    /// Your member record on the business this referral is made for, prefixed `mber_`, when your role there is held on your member record. Send this or `authorized_user_id`, not both.
    public let memberId: String?
    /// Email address on an existing user's account. Matching is case-insensitive. The user does not need to be enrolled in the partner program.
    public let targetEmail: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        authorizedUserId: String? = nil,
        memberId: String? = nil,
        targetEmail: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.authorizedUserId = authorizedUserId
        self.memberId = memberId
        self.targetEmail = targetEmail
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.authorizedUserId = try container.decodeIfPresent(String.self, forKey: .authorizedUserId)
        self.memberId = try container.decodeIfPresent(String.self, forKey: .memberId)
        self.targetEmail = try container.decode(String.self, forKey: .targetEmail)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.authorizedUserId, forKey: .authorizedUserId)
        try container.encodeIfPresent(self.memberId, forKey: .memberId)
        try container.encode(self.targetEmail, forKey: .targetEmail)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case authorizedUserId = "authorized_user_id"
        case memberId = "member_id"
        case targetEmail = "target_email"
    }
}