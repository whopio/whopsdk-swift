import Foundation

extension Requests {
    public struct UpdateDmChannelsRequest: Codable, Hashable, Sendable {
        /// A new custom display name for the DM channel. For example, 'Project Discussion'.
        public let customName: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            customName: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.customName = customName
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.customName = try container.decodeNullableIfPresent(String.self, forKey: .customName)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.customName, forKey: .customName)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case customName = "custom_name"
        }
    }
}