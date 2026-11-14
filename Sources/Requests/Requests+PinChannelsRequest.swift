import Foundation

extension Requests {
    public struct PinChannelsRequest: Codable, Hashable, Sendable {
        /// Zero-based position in the resulting list. Must not exceed the last index after insertion. Omit to append a new pin or preserve an existing position.
        public let position: Int?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            position: Int? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.position = position
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.position = try container.decodeIfPresent(Int.self, forKey: .position)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.position, forKey: .position)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case position
        }
    }
}