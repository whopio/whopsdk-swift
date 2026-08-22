import Foundation

extension Requests {
    public struct CreateAffiliatesRequest: Codable, Hashable, Sendable {
        /// The ID of the company to create the affiliate for.
        public let companyId: String
        /// The user identifier (username, email, user ID, or Discord ID).
        public let userIdentifier: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            companyId: String,
            userIdentifier: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.companyId = companyId
            self.userIdentifier = userIdentifier
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.companyId = try container.decode(String.self, forKey: .companyId)
            self.userIdentifier = try container.decode(String.self, forKey: .userIdentifier)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.companyId, forKey: .companyId)
            try container.encode(self.userIdentifier, forKey: .userIdentifier)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case companyId = "company_id"
            case userIdentifier = "user_identifier"
        }
    }
}