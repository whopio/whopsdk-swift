import Foundation

extension Requests {
    public struct CreateAccountsRequest: Codable, Hashable, Sendable {
        /// The username, if any, of the partner who referred this account
        public let affiliateCode: Nullable<String>?
        /// The ISO 3166-1 alpha-2 country code where the account's business is located (e.g. `US`). Defaults to the parent account's country for connected accounts.
        public let country: String?
        /// The email address of the account owner. Required for Account API key requests.
        public let email: String?
        /// Arbitrary key/value metadata to store on the account.
        public let metadata: [String: JSONValue]?
        /// The display name of the account. Defaults to `metadata.external_id` or the owner's email when omitted.
        public let title: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            affiliateCode: Nullable<String>? = nil,
            country: String? = nil,
            email: String? = nil,
            metadata: [String: JSONValue]? = nil,
            title: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.affiliateCode = affiliateCode
            self.country = country
            self.email = email
            self.metadata = metadata
            self.title = title
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.affiliateCode = try container.decodeNullableIfPresent(String.self, forKey: .affiliateCode)
            self.country = try container.decodeIfPresent(String.self, forKey: .country)
            self.email = try container.decodeIfPresent(String.self, forKey: .email)
            self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
            self.title = try container.decodeIfPresent(String.self, forKey: .title)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.affiliateCode, forKey: .affiliateCode)
            try container.encodeIfPresent(self.country, forKey: .country)
            try container.encodeIfPresent(self.email, forKey: .email)
            try container.encodeIfPresent(self.metadata, forKey: .metadata)
            try container.encodeIfPresent(self.title, forKey: .title)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case affiliateCode = "affiliate_code"
            case country
            case email
            case metadata
            case title
        }
    }
}