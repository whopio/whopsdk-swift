import Foundation

extension Requests {
    public struct DuplicateAdsRequest: Codable, Hashable, Sendable {
        /// Number of copies to create (1-10). Defaults to 1.
        public let count: Int?
        /// Ad group to duplicate into, which must belong to the same account and be compatible with the ad. Defaults to the ad's own ad group.
        public let targetAdGroupId: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            count: Int? = nil,
            targetAdGroupId: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.count = count
            self.targetAdGroupId = targetAdGroupId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.count = try container.decodeIfPresent(Int.self, forKey: .count)
            self.targetAdGroupId = try container.decodeIfPresent(String.self, forKey: .targetAdGroupId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.count, forKey: .count)
            try container.encodeIfPresent(self.targetAdGroupId, forKey: .targetAdGroupId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case count
            case targetAdGroupId = "target_ad_group_id"
        }
    }
}