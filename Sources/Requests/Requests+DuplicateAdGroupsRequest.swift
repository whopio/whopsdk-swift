import Foundation

extension Requests {
    public struct DuplicateAdGroupsRequest: Codable, Hashable, Sendable {
        /// Number of copies to create (1-10). Defaults to 1.
        public let count: Int?
        /// Campaign to duplicate into. Must belong to the same account and be compatible with the ad group's targeting and goals. Defaults to the ad group's own campaign.
        public let targetAdCampaignId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            count: Int? = nil,
            targetAdCampaignId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.count = count
            self.targetAdCampaignId = targetAdCampaignId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.count = try container.decodeIfPresent(Int.self, forKey: .count)
            self.targetAdCampaignId = try container.decodeIfPresent(String.self, forKey: .targetAdCampaignId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.count, forKey: .count)
            try container.encodeIfPresent(self.targetAdCampaignId, forKey: .targetAdCampaignId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case count
            case targetAdCampaignId = "target_ad_campaign_id"
        }
    }
}