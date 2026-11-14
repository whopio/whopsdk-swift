import Foundation

extension Requests {
    public struct UpdateMethodsRequest: Codable, Hashable, Sendable {
        /// The payout address to keep on file for this payout method. Only the fields you send are changed; blank fields are ignored.
        public let address: UpdateMethodsRequestAddress?
        /// Set to `true` to make this the account's default payout method. `false` is not accepted.
        public let isDefault: Bool?
        /// New label for the payout method, with at least one non-whitespace character and a maximum of 100 characters.
        public let nickname: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            address: UpdateMethodsRequestAddress? = nil,
            isDefault: Bool? = nil,
            nickname: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.address = address
            self.isDefault = isDefault
            self.nickname = nickname
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.address = try container.decodeIfPresent(UpdateMethodsRequestAddress.self, forKey: .address)
            self.isDefault = try container.decodeIfPresent(Bool.self, forKey: .isDefault)
            self.nickname = try container.decodeIfPresent(String.self, forKey: .nickname)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.address, forKey: .address)
            try container.encodeIfPresent(self.isDefault, forKey: .isDefault)
            try container.encodeIfPresent(self.nickname, forKey: .nickname)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case address
            case isDefault = "is_default"
            case nickname
        }
    }
}