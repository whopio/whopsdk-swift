import Foundation

extension Requests {
    public struct AssignAffiliateMembershipsRequest: Codable, Hashable, Sendable {
        /// Whether the commission is a percentage of each payment or a fixed amount per payment.
        public let commissionType: AssignAffiliateMembershipsRequestCommissionType
        /// A whole number from 1 to 90 for `percentage`, or an amount greater than 1 in the membership currency for `flat_fee`. The payout cannot exceed 90% of the next renewal amount. Flat fees need matching billing and settlement currencies.
        public let commissionValue: Double
        /// Email address of the user to assign. Pass exactly one of `user_id`, `email`, or `username`.
        public let email: String?
        /// The user to assign, prefixed `user_`. Pass exactly one of `user_id`, `email`, or `username`.
        public let userId: String?
        /// Whop username of the user to assign. Pass exactly one of `user_id`, `email`, or `username`.
        public let username: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            commissionType: AssignAffiliateMembershipsRequestCommissionType,
            commissionValue: Double,
            email: String? = nil,
            userId: String? = nil,
            username: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.commissionType = commissionType
            self.commissionValue = commissionValue
            self.email = email
            self.userId = userId
            self.username = username
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.commissionType = try container.decode(AssignAffiliateMembershipsRequestCommissionType.self, forKey: .commissionType)
            self.commissionValue = try container.decode(Double.self, forKey: .commissionValue)
            self.email = try container.decodeIfPresent(String.self, forKey: .email)
            self.userId = try container.decodeIfPresent(String.self, forKey: .userId)
            self.username = try container.decodeIfPresent(String.self, forKey: .username)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.commissionType, forKey: .commissionType)
            try container.encode(self.commissionValue, forKey: .commissionValue)
            try container.encodeIfPresent(self.email, forKey: .email)
            try container.encodeIfPresent(self.userId, forKey: .userId)
            try container.encodeIfPresent(self.username, forKey: .username)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case commissionType = "commission_type"
            case commissionValue = "commission_value"
            case email
            case userId = "user_id"
            case username
        }
    }
}