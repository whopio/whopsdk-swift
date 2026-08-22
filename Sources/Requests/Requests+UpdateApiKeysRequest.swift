import Foundation

extension Requests {
    public struct UpdateApiKeysRequest: Codable, Hashable, Sendable {
        /// Dated API version used when requests authenticated with this key omit the `Api-Version-Date` header. New keys default to the latest version.
        public let apiVersionDate: UpdateApiKeysRequestApiVersionDate?
        /// When the API key should stop working, as an ISO 8601 timestamp. Omit (or pass `null` on update) for a key that never expires.
        public let expiresAt: Nullable<String>?
        /// IPv4/IPv6 CIDR ranges allowed to use this key, for example `["203.0.113.0/24"]`. Empty or `null` allows any IP.
        public let ipAllowlist: Nullable<[String]>?
        /// A new human-readable name for the API key.
        public let name: Nullable<String>?
        /// The permissions policy for the API key: explicit permission statements, or a system role to inherit from. Statements without a `resources` array default to the owning account (Account API keys) or every key-addressable resource (App API keys).
        public let permissions: UpdateApiKeysRequestPermissions?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiVersionDate: UpdateApiKeysRequestApiVersionDate? = nil,
            expiresAt: Nullable<String>? = nil,
            ipAllowlist: Nullable<[String]>? = nil,
            name: Nullable<String>? = nil,
            permissions: UpdateApiKeysRequestPermissions? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiVersionDate = apiVersionDate
            self.expiresAt = expiresAt
            self.ipAllowlist = ipAllowlist
            self.name = name
            self.permissions = permissions
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiVersionDate = try container.decodeIfPresent(UpdateApiKeysRequestApiVersionDate.self, forKey: .apiVersionDate)
            self.expiresAt = try container.decodeNullableIfPresent(String.self, forKey: .expiresAt)
            self.ipAllowlist = try container.decodeNullableIfPresent([String].self, forKey: .ipAllowlist)
            self.name = try container.decodeNullableIfPresent(String.self, forKey: .name)
            self.permissions = try container.decodeIfPresent(UpdateApiKeysRequestPermissions.self, forKey: .permissions)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.apiVersionDate, forKey: .apiVersionDate)
            try container.encodeNullableIfPresent(self.expiresAt, forKey: .expiresAt)
            try container.encodeNullableIfPresent(self.ipAllowlist, forKey: .ipAllowlist)
            try container.encodeNullableIfPresent(self.name, forKey: .name)
            try container.encodeIfPresent(self.permissions, forKey: .permissions)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case apiVersionDate = "api_version_date"
            case expiresAt = "expires_at"
            case ipAllowlist = "ip_allowlist"
            case name
            case permissions
        }
    }
}