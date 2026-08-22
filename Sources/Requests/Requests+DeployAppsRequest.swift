import Foundation

extension Requests {
    public struct DeployAppsRequest: Codable, Hashable, Sendable {
        /// Upload the build without making it live. Defaults to `false`, which deploys and promotes in one step.
        public let draft: Bool?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            draft: Bool? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.draft = draft
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.draft = try container.decodeIfPresent(Bool.self, forKey: .draft)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.draft, forKey: .draft)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case draft
        }
    }
}