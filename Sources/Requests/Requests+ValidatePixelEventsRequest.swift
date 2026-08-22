import Foundation

extension Requests {
    public struct ValidatePixelEventsRequest: Codable, Hashable, Sendable {
        /// Account to check. Defaults to the authenticated account.
        public let accountId: String?
        /// A page to read for the pixel, e.g. an ad destination. Omit it to check the account from its events alone.
        public let url: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            url: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.url = url
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.url = try container.decodeIfPresent(String.self, forKey: .url)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encodeIfPresent(self.url, forKey: .url)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case url
        }
    }
}