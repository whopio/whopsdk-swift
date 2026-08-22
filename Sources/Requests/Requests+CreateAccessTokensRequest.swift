import Foundation

extension Requests {
    public struct CreateAccessTokensRequest: Codable, Hashable, Sendable {
        /// The unique identifier of the company to generate the token for, starting with 'biz_'. The API key must have permission to access this company.
        public let companyId: Nullable<String>?
        /// The expiration timestamp for the access token. Defaults to 1 hour from now, with a maximum of 3 hours.
        public let expiresAt: Nullable<Date>?
        /// An array of permission scopes to grant to the access token. If empty or omitted, all permissions from the authenticating credential are inherited. Must be a subset of the credential's permissions.
        public let scopedActions: Nullable<[String]>?
        /// The unique identifier of the user to generate the token for, starting with 'user_'. The API key must have permission to access this user.
        public let userId: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            companyId: Nullable<String>? = nil,
            expiresAt: Nullable<Date>? = nil,
            scopedActions: Nullable<[String]>? = nil,
            userId: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.companyId = companyId
            self.expiresAt = expiresAt
            self.scopedActions = scopedActions
            self.userId = userId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.companyId = try container.decodeNullableIfPresent(String.self, forKey: .companyId)
            self.expiresAt = try container.decodeNullableIfPresent(Date.self, forKey: .expiresAt)
            self.scopedActions = try container.decodeNullableIfPresent([String].self, forKey: .scopedActions)
            self.userId = try container.decodeNullableIfPresent(String.self, forKey: .userId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.companyId, forKey: .companyId)
            try container.encodeNullableIfPresent(self.expiresAt, forKey: .expiresAt)
            try container.encodeNullableIfPresent(self.scopedActions, forKey: .scopedActions)
            try container.encodeNullableIfPresent(self.userId, forKey: .userId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case companyId = "company_id"
            case expiresAt = "expires_at"
            case scopedActions = "scoped_actions"
            case userId = "user_id"
        }
    }
}