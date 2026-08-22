import Foundation

extension Requests {
    public struct UpdateShipmentsRequest: Codable, Hashable, Sendable {
        /// The new carrier-assigned tracking number.
        public let trackingNumber: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            trackingNumber: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.trackingNumber = trackingNumber
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.trackingNumber = try container.decode(String.self, forKey: .trackingNumber)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.trackingNumber, forKey: .trackingNumber)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case trackingNumber = "tracking_number"
        }
    }
}