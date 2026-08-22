import Foundation

extension Requests {
    public struct DuplicateAdGroupsRequest: Codable, Hashable, Sendable {
        /// Number of copies to create (1-10). Defaults to 1.
        public let count: Int?
        /// Whether the copied ads keep the original posts' engagement (likes, comments, shares). Defaults to false.
        public let preserveEngagement: Bool?
        /// Campaign to duplicate into. Defaults to the ad group's own campaign.
        public let targetAdCampaignId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            count: Int? = nil,
            preserveEngagement: Bool? = nil,
            targetAdCampaignId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.count = count
            self.preserveEngagement = preserveEngagement
            self.targetAdCampaignId = targetAdCampaignId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.count = try container.decodeIfPresent(Int.self, forKey: .count)
            self.preserveEngagement = try container.decodeIfPresent(Bool.self, forKey: .preserveEngagement)
            self.targetAdCampaignId = try container.decodeIfPresent(String.self, forKey: .targetAdCampaignId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.count, forKey: .count)
            try container.encodeIfPresent(self.preserveEngagement, forKey: .preserveEngagement)
            try container.encodeIfPresent(self.targetAdCampaignId, forKey: .targetAdCampaignId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case count
            case preserveEngagement = "preserve_engagement"
            case targetAdCampaignId = "target_ad_campaign_id"
        }
    }
}