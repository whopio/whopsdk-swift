import Foundation

extension Requests {
    public struct TransferOwnershipAccountsRequest: Codable, Hashable, Sendable {
        /// If true, the current owner is credited as the account's Whop partner, earning partner commission on its sales. Requires the current owner to already be an enrolled Whop partner. Skipped if the account already has an active partner.
        public let asPartner: Bool?
        /// Your team membership on the business this referral is made for, prefixed `ausr_`. The referral then credits that team instead of you personally. Requires `as_partner`.
        public let authorizedUserId: String?
        /// The user to transfer ownership to: a user ID (`user_*`) or an email address. An email address with no Whop account yet is sent an invite to create one.
        public let identifier: String
        /// Your member record on the business this referral is made for, prefixed `mber_`, when your role there is held on your member record. Send this or `authorized_user_id`, not both. Requires `as_partner`.
        public let memberId: String?
        /// A note from the partner, shown as a quote in the invite email and signed with their name. Requires `as_partner`; sending it on an ordinary transfer is a 400. Omit it and the email sends without a note.
        public let message: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            asPartner: Bool? = nil,
            authorizedUserId: String? = nil,
            identifier: String,
            memberId: String? = nil,
            message: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.asPartner = asPartner
            self.authorizedUserId = authorizedUserId
            self.identifier = identifier
            self.memberId = memberId
            self.message = message
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.asPartner = try container.decodeIfPresent(Bool.self, forKey: .asPartner)
            self.authorizedUserId = try container.decodeIfPresent(String.self, forKey: .authorizedUserId)
            self.identifier = try container.decode(String.self, forKey: .identifier)
            self.memberId = try container.decodeIfPresent(String.self, forKey: .memberId)
            self.message = try container.decodeIfPresent(String.self, forKey: .message)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.asPartner, forKey: .asPartner)
            try container.encodeIfPresent(self.authorizedUserId, forKey: .authorizedUserId)
            try container.encode(self.identifier, forKey: .identifier)
            try container.encodeIfPresent(self.memberId, forKey: .memberId)
            try container.encodeIfPresent(self.message, forKey: .message)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case asPartner = "as_partner"
            case authorizedUserId = "authorized_user_id"
            case identifier
            case memberId = "member_id"
            case message
        }
    }
}