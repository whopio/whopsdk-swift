import Foundation

extension Requests {
    public struct CreateSocialAccountsRequest: Codable, Hashable, Sendable {
        /// The Account (biz_ identifier) to create the social account for. An account-scoped API key may omit this to default to its own account. Account API keys cannot update their own account's branding through Update Account; use a user-authenticated path.
        public let accountId: String?
        /// The platform to create the social account on. `facebook` requires the account's `banner_image`, `logo`, and `description`; configure them with [Update Account](/api-reference/beta/accounts/update-account).
        public let platform: CreateSocialAccountsRequestPlatform
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            platform: CreateSocialAccountsRequestPlatform,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.platform = platform
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.platform = try container.decode(CreateSocialAccountsRequestPlatform.self, forKey: .platform)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encode(self.platform, forKey: .platform)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case platform
        }
    }
}