import Foundation

extension Requests {
    public struct CreateWaitlistEntriesRequest: Codable, Hashable, Sendable {
        /// The account to join on behalf of, prefixed `biz_`. Leave it out to join as yourself. Required with an account credential, which passes its own account and records the account's owner as the user who joined.
        public let buyerAccountId: String?
        /// Answers to the variant's checkout questions. Every required question must be answered.
        public let customFieldResponses: [CreateWaitlistEntriesRequestCustomFieldResponsesItem]?
        /// Custom key-value pairs to store on the signup. Max 50 keys, 100 chars per key, 500 chars per string value. Ignored when the request returns an existing signup.
        public let metadata: [String: JSONValue]?
        /// The free waitlist variant to join, prefixed `plan_`.
        public let variantId: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            buyerAccountId: String? = nil,
            customFieldResponses: [CreateWaitlistEntriesRequestCustomFieldResponsesItem]? = nil,
            metadata: [String: JSONValue]? = nil,
            variantId: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.buyerAccountId = buyerAccountId
            self.customFieldResponses = customFieldResponses
            self.metadata = metadata
            self.variantId = variantId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.buyerAccountId = try container.decodeIfPresent(String.self, forKey: .buyerAccountId)
            self.customFieldResponses = try container.decodeIfPresent([CreateWaitlistEntriesRequestCustomFieldResponsesItem].self, forKey: .customFieldResponses)
            self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
            self.variantId = try container.decode(String.self, forKey: .variantId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.buyerAccountId, forKey: .buyerAccountId)
            try container.encodeIfPresent(self.customFieldResponses, forKey: .customFieldResponses)
            try container.encodeIfPresent(self.metadata, forKey: .metadata)
            try container.encode(self.variantId, forKey: .variantId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case buyerAccountId = "buyer_account_id"
            case customFieldResponses = "custom_field_responses"
            case metadata
            case variantId = "variant_id"
        }
    }
}