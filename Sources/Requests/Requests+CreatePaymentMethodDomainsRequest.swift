import Foundation

extension Requests {
    public struct CreatePaymentMethodDomainsRequest: Codable, Hashable, Sendable {
        /// Account to register the domain for (`biz_` tag). Defaults to the caller's account.
        public let accountId: String?
        /// Hostname to register (e.g. `checkout.shinetime.example`).
        public let hostname: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            hostname: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.hostname = hostname
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.hostname = try container.decode(String.self, forKey: .hostname)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encode(self.hostname, forKey: .hostname)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case hostname
        }
    }
}