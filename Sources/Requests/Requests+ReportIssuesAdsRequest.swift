import Foundation

extension Requests {
    public struct ReportIssuesAdsRequest: Codable, Hashable, Sendable {
        /// The ID of the ad group the issues are on, prefixed `adgrp_`.
        public let adGroupId: String?
        /// The ID of the ad the issues are on, prefixed `ad_`. Send exactly one of `ad_id` or `ad_group_id`.
        public let adId: String?
        /// Every issue the object has now, each reason once. Send an empty list when it has none.
        public let issues: [ReportIssuesAdsRequestIssuesItem]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            adGroupId: String? = nil,
            adId: String? = nil,
            issues: [ReportIssuesAdsRequestIssuesItem],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.adGroupId = adGroupId
            self.adId = adId
            self.issues = issues
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.adGroupId = try container.decodeIfPresent(String.self, forKey: .adGroupId)
            self.adId = try container.decodeIfPresent(String.self, forKey: .adId)
            self.issues = try container.decode([ReportIssuesAdsRequestIssuesItem].self, forKey: .issues)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.adGroupId, forKey: .adGroupId)
            try container.encodeIfPresent(self.adId, forKey: .adId)
            try container.encode(self.issues, forKey: .issues)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case adGroupId = "ad_group_id"
            case adId = "ad_id"
            case issues
        }
    }
}