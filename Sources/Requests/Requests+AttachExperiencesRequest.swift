import Foundation

extension Requests {
    public struct AttachExperiencesRequest: Codable, Hashable, Sendable {
        /// The unique identifier of the product to attach the experience to.
        public let productId: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            productId: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.productId = productId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.productId = try container.decode(String.self, forKey: .productId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.productId, forKey: .productId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case productId = "product_id"
        }
    }
}