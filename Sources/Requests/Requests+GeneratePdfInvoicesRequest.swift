import Foundation

extension Requests {
    public struct GeneratePdfInvoicesRequest: Codable, Hashable, Sendable {
        /// Whether to print each line item's `description` under it. Defaults to `true`.
        public let includeDescriptions: Bool?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            includeDescriptions: Bool? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.includeDescriptions = includeDescriptions
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.includeDescriptions = try container.decodeIfPresent(Bool.self, forKey: .includeDescriptions)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.includeDescriptions, forKey: .includeDescriptions)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case includeDescriptions = "include_descriptions"
        }
    }
}