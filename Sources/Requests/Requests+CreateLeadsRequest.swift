import Foundation

extension Requests {
    public struct CreateLeadsRequest: Codable, Hashable, Sendable {
        /// The unique identifier of the company to create the lead for, starting with 'biz_'.
        public let companyId: String
        /// A JSON object of custom metadata to attach to the lead for tracking purposes.
        public let metadata: Nullable<[String: JSONValue]>?
        /// The unique identifier of the product the lead is interested in, starting with 'prod_'.
        public let productId: Nullable<String>?
        /// The referral URL that brought the lead to the company, such as 'https://example.com/landing'.
        public let referrer: Nullable<String>?
        /// The unique identifier of the user to record as the lead. If authenticated as a user, that user is used automatically.
        public let userId: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            companyId: String,
            metadata: Nullable<[String: JSONValue]>? = nil,
            productId: Nullable<String>? = nil,
            referrer: Nullable<String>? = nil,
            userId: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.companyId = companyId
            self.metadata = metadata
            self.productId = productId
            self.referrer = referrer
            self.userId = userId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.companyId = try container.decode(String.self, forKey: .companyId)
            self.metadata = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .metadata)
            self.productId = try container.decodeNullableIfPresent(String.self, forKey: .productId)
            self.referrer = try container.decodeNullableIfPresent(String.self, forKey: .referrer)
            self.userId = try container.decodeNullableIfPresent(String.self, forKey: .userId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.companyId, forKey: .companyId)
            try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
            try container.encodeNullableIfPresent(self.productId, forKey: .productId)
            try container.encodeNullableIfPresent(self.referrer, forKey: .referrer)
            try container.encodeNullableIfPresent(self.userId, forKey: .userId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case companyId = "company_id"
            case metadata
            case productId = "product_id"
            case referrer
            case userId = "user_id"
        }
    }
}