import Foundation

extension Requests {
    public struct ConnectSocialAccountsRequest: Codable, Hashable, Sendable {
        /// The Account (biz_ identifier) to connect the external account for. An account-scoped API key may omit this to default to its own account. Omit for user profile connections.
        public let accountId: String?
        /// The platform to connect the external account on. Use `tiktok` to connect the authenticated user’s TikTok profile, `linkedin` for their LinkedIn profile, `youtube` for their YouTube channel, or `x` for their X profile. Use `quickbooks` to connect the account’s QuickBooks Online company: pass `account_id`, and the user picks the company in QuickBooks.
        public let platform: ConnectSocialAccountsRequestPlatform
        /// Where to send the user once they finish connecting their accounts. Must be an `https` URL on whop.com; any other host is rejected. On success, the user is redirected with an `external_account_connected` query param naming the platform; if the connection fails, with an `external_account_error` query param instead. The same values also arrive as `social_account_connected` / `social_account_error`.
        public let redirectUrl: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            platform: ConnectSocialAccountsRequestPlatform,
            redirectUrl: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.platform = platform
            self.redirectUrl = redirectUrl
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.platform = try container.decode(ConnectSocialAccountsRequestPlatform.self, forKey: .platform)
            self.redirectUrl = try container.decode(String.self, forKey: .redirectUrl)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encode(self.platform, forKey: .platform)
            try container.encode(self.redirectUrl, forKey: .redirectUrl)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case platform
            case redirectUrl = "redirect_url"
        }
    }
}