import Foundation

extension Requests {
    public struct UpdateReturnUrlPaymentsRequest: Codable, Hashable, Sendable {
        /// The payment's own `client_secret`, for a caller without a secret key.
        public let clientSecret: String?
        /// Where the buyer continues after completing an off-site step. Must be an absolute https URL without credentials (http is allowed for localhost), at most 2,048 characters.
        public let returnUrl: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            clientSecret: String? = nil,
            returnUrl: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.clientSecret = clientSecret
            self.returnUrl = returnUrl
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.clientSecret = try container.decodeIfPresent(String.self, forKey: .clientSecret)
            self.returnUrl = try container.decode(String.self, forKey: .returnUrl)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.clientSecret, forKey: .clientSecret)
            try container.encode(self.returnUrl, forKey: .returnUrl)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case clientSecret = "client_secret"
            case returnUrl = "return_url"
        }
    }
}