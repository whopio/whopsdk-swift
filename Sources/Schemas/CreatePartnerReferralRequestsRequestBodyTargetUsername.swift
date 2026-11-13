import Foundation

public struct CreatePartnerReferralRequestsRequestBodyTargetUsername: Codable, Hashable, Sendable {
    /// Your team membership on the business this referral is made for, prefixed `ausr_`. Omit for a personal referral.
    public let authorizedUserId: String?
    /// Your member record on the business this referral is made for, prefixed `mber_`, when your role there is held on your member record. Send this or `authorized_user_id`, not both.
    public let memberId: String?
    /// Username of the user to request attribution for, with or without a leading @.
    public let targetUsername: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        authorizedUserId: String? = nil,
        memberId: String? = nil,
        targetUsername: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.authorizedUserId = authorizedUserId
        self.memberId = memberId
        self.targetUsername = targetUsername
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.authorizedUserId = try container.decodeIfPresent(String.self, forKey: .authorizedUserId)
        self.memberId = try container.decodeIfPresent(String.self, forKey: .memberId)
        self.targetUsername = try container.decode(String.self, forKey: .targetUsername)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.authorizedUserId, forKey: .authorizedUserId)
        try container.encodeIfPresent(self.memberId, forKey: .memberId)
        try container.encode(self.targetUsername, forKey: .targetUsername)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case authorizedUserId = "authorized_user_id"
        case memberId = "member_id"
        case targetUsername = "target_username"
    }
}