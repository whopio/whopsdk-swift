import Foundation

extension Requests {
    public struct ConnectSocialAccountsRequest: Codable, Hashable, Sendable {
        /// The Account (biz_ identifier) to connect the social account for. An account-scoped API key may omit this to default to its own account.
        public let accountId: String?
        /// The platform to connect the social account on. Supported options are `meta_business` and `tiktok`.
        public let platform: ConnectSocialAccountsRequestPlatform
        /// The Whop URL to redirect the user to after they finish connecting.
        public let redirectUrl: String?
        /// Capabilities to grant for the connected social account. Use `advertise` when connecting a Meta Business or TikTok account for ads.
        public let scopes: [ConnectSocialAccountsRequestScopesItem]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            platform: ConnectSocialAccountsRequestPlatform,
            redirectUrl: String? = nil,
            scopes: [ConnectSocialAccountsRequestScopesItem]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.platform = platform
            self.redirectUrl = redirectUrl
            self.scopes = scopes
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.platform = try container.decode(ConnectSocialAccountsRequestPlatform.self, forKey: .platform)
            self.redirectUrl = try container.decodeIfPresent(String.self, forKey: .redirectUrl)
            self.scopes = try container.decodeIfPresent([ConnectSocialAccountsRequestScopesItem].self, forKey: .scopes)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encode(self.platform, forKey: .platform)
            try container.encodeIfPresent(self.redirectUrl, forKey: .redirectUrl)
            try container.encodeIfPresent(self.scopes, forKey: .scopes)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case platform
            case redirectUrl = "redirect_url"
            case scopes
        }
    }
}