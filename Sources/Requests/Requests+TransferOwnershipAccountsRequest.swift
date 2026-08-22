import Foundation

extension Requests {
    public struct TransferOwnershipAccountsRequest: Codable, Hashable, Sendable {
        /// If true, the current owner is credited as the account's Whop partner, earning partner commission on its sales. Requires the current owner to already be an enrolled Whop partner. Skipped if the account already has an active partner.
        public let asPartner: Bool?
        /// The user to transfer ownership to: a user ID (`user_*`) or an email address. An email address with no Whop account yet is sent an invite to create one.
        public let identifier: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            asPartner: Bool? = nil,
            identifier: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.asPartner = asPartner
            self.identifier = identifier
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.asPartner = try container.decodeIfPresent(Bool.self, forKey: .asPartner)
            self.identifier = try container.decode(String.self, forKey: .identifier)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.asPartner, forKey: .asPartner)
            try container.encode(self.identifier, forKey: .identifier)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case asPartner = "as_partner"
            case identifier
        }
    }
}