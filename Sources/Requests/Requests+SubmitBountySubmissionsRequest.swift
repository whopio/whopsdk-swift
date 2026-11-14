import Foundation

extension Requests {
    public struct SubmitBountySubmissionsRequest: Codable, Hashable, Sendable {
        /// Work to attach to a livestream attempt. Combine `urls`, `file_ids`, and `caption` freely; all are optional. If the attempt already went to review when its stream ended, the deliverable attaches to it once, until reviewers start voting. Data capture attempts take no deliverable.
        public let deliverable: Nullable<SubmitBountySubmissionsRequestDeliverable>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            deliverable: Nullable<SubmitBountySubmissionsRequestDeliverable>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.deliverable = deliverable
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.deliverable = try container.decodeNullableIfPresent(SubmitBountySubmissionsRequestDeliverable.self, forKey: .deliverable)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.deliverable, forKey: .deliverable)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case deliverable
        }
    }
}