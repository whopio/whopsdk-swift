import Foundation

extension Requests {
    public struct CreateBountySubmissionsRequest: Codable, Hashable, Sendable {
        /// Affiliate code crediting the referrer, when the worker arrived through one.
        public let affiliateCode: Nullable<String>?
        /// The bounty to submit to (`bnty_` tag).
        public let bountyId: String
        /// The submitted work. Combine `urls`, `file_ids`, and `caption` freely; at least one link or file is required.
        public let deliverable: Nullable<CreateBountySubmissionsRequestDeliverable>?
        /// Optional capture metadata describing where and how the footage was recorded. Persisted on the submission. On a `data_capture` bounty every field except `fov` is required whenever metadata is provided.
        public let metadata: Nullable<CreateBountySubmissionsRequestMetadata>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            affiliateCode: Nullable<String>? = nil,
            bountyId: String,
            deliverable: Nullable<CreateBountySubmissionsRequestDeliverable>? = nil,
            metadata: Nullable<CreateBountySubmissionsRequestMetadata>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.affiliateCode = affiliateCode
            self.bountyId = bountyId
            self.deliverable = deliverable
            self.metadata = metadata
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.affiliateCode = try container.decodeNullableIfPresent(String.self, forKey: .affiliateCode)
            self.bountyId = try container.decode(String.self, forKey: .bountyId)
            self.deliverable = try container.decodeNullableIfPresent(CreateBountySubmissionsRequestDeliverable.self, forKey: .deliverable)
            self.metadata = try container.decodeNullableIfPresent(CreateBountySubmissionsRequestMetadata.self, forKey: .metadata)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.affiliateCode, forKey: .affiliateCode)
            try container.encode(self.bountyId, forKey: .bountyId)
            try container.encodeNullableIfPresent(self.deliverable, forKey: .deliverable)
            try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case affiliateCode = "affiliate_code"
            case bountyId = "bounty_id"
            case deliverable
            case metadata
        }
    }
}