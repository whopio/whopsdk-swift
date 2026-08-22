import Foundation

extension Requests {
    public struct DuplicateAdsRequest: Codable, Hashable, Sendable {
        /// Number of copies to create (1-10). Defaults to 1.
        public let count: Int?
        /// Whether the copies keep the original post's engagement (likes, comments, shares). Defaults to false.
        public let preserveEngagement: Bool?
        /// Ad group to duplicate into. Defaults to the ad's own ad group.
        public let targetAdGroupId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            count: Int? = nil,
            preserveEngagement: Bool? = nil,
            targetAdGroupId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.count = count
            self.preserveEngagement = preserveEngagement
            self.targetAdGroupId = targetAdGroupId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.count = try container.decodeIfPresent(Int.self, forKey: .count)
            self.preserveEngagement = try container.decodeIfPresent(Bool.self, forKey: .preserveEngagement)
            self.targetAdGroupId = try container.decodeIfPresent(String.self, forKey: .targetAdGroupId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.count, forKey: .count)
            try container.encodeIfPresent(self.preserveEngagement, forKey: .preserveEngagement)
            try container.encodeIfPresent(self.targetAdGroupId, forKey: .targetAdGroupId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case count
            case preserveEngagement = "preserve_engagement"
            case targetAdGroupId = "target_ad_group_id"
        }
    }
}