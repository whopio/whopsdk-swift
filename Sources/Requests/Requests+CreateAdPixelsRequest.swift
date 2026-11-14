import Foundation

extension Requests {
    public struct CreateAdPixelsRequest: Codable, Hashable, Sendable {
        /// A credential that can send events to the pixel on the ad platform. For `meta`, a Conversions API access token. For `tiktok`, an Events API access token. For `thrad`, an API key with `events:write` for the tag. For `google`, the JSON key of a Google Cloud service account. Give the service account Standard access to the Google Ads account. In its project, turn on the Google Ads API and the Data Manager API. The project also needs Explorer access or higher to the Google Ads API. Use a service account made only for Whop, with no roles in its project. Whop never returns it.
        public let accessToken: String
        /// The business whose claimed campaigns send conversions to this pixel, prefixed `biz_`. You must have claimed at least one of its campaigns.
        public let accountId: String
        /// The pixel's ID on the ad platform: a Meta pixel or dataset ID, TikTok pixel code, Google Ads customer ID, or Thrad tag ID.
        public let externalId: String
        /// The ad platform the pixel belongs to.
        public let platform: CreateAdPixelsRequestPlatform
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accessToken: String,
            accountId: String,
            externalId: String,
            platform: CreateAdPixelsRequestPlatform,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accessToken = accessToken
            self.accountId = accountId
            self.externalId = externalId
            self.platform = platform
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accessToken = try container.decode(String.self, forKey: .accessToken)
            self.accountId = try container.decode(String.self, forKey: .accountId)
            self.externalId = try container.decode(String.self, forKey: .externalId)
            self.platform = try container.decode(CreateAdPixelsRequestPlatform.self, forKey: .platform)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.accessToken, forKey: .accessToken)
            try container.encode(self.accountId, forKey: .accountId)
            try container.encode(self.externalId, forKey: .externalId)
            try container.encode(self.platform, forKey: .platform)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accessToken = "access_token"
            case accountId = "account_id"
            case externalId = "external_id"
            case platform
        }
    }
}