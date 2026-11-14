import Foundation

extension Requests {
    public struct ResumePaymentsRequest: Codable, Hashable, Sendable {
        /// The payment's own `client_secret`, for a buyer without a token.
        public let clientSecret: String?
        /// Where the buyer continues after completing an off-site step. Must be an absolute https URL without credentials (http is allowed for localhost), at most 2,048 characters. Defaults to Whop's hosted verification page. Ignored when the payment is not waiting on authentication.
        public let returnUrl: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            clientSecret: String? = nil,
            returnUrl: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.clientSecret = clientSecret
            self.returnUrl = returnUrl
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.clientSecret = try container.decodeIfPresent(String.self, forKey: .clientSecret)
            self.returnUrl = try container.decodeIfPresent(String.self, forKey: .returnUrl)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.clientSecret, forKey: .clientSecret)
            try container.encodeIfPresent(self.returnUrl, forKey: .returnUrl)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case clientSecret = "client_secret"
            case returnUrl = "return_url"
        }
    }
}