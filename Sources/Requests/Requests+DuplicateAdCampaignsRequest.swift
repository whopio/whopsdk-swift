import Foundation

extension Requests {
    public struct DuplicateAdCampaignsRequest: Codable, Hashable, Sendable {
        /// Number of copies to create (1-10). Defaults to 1.
        public let count: Int?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            count: Int? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.count = count
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.count = try container.decodeIfPresent(Int.self, forKey: .count)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.count, forKey: .count)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case count
        }
    }
}