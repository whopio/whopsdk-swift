import Foundation

extension Requests {
    public struct CreateApiKeysRequest: Codable, Hashable, Sendable {
        /// Dated API version used when requests authenticated with this key omit the `Api-Version-Date` header. New keys default to the latest version.
        public let apiVersionDate: CreateApiKeysRequestApiVersionDate?
        /// When the API key should stop working, as an ISO 8601 timestamp. Omit (or pass `null` on update) for a key that never expires.
        public let expiresAt: Nullable<String>?
        /// IPv4/IPv6 CIDR ranges allowed to use this key, for example `["203.0.113.0/24"]`. Empty or `null` allows any IP.
        public let ipAllowlist: Nullable<[String]>?
        /// A human-readable name for the API key, such as 'Production API Key'.
        public let name: String
        /// The permissions policy for the API key: explicit permission statements, or a system role to inherit from. Statements without a `resources` array default to the owning account (Account API keys) or every key-addressable resource (App API keys).
        public let permissions: CreateApiKeysRequestPermissions
        /// The account (`biz_`) or app (`app_`) tag to create the API key for.
        public let resourceId: String
        /// The type of resource that will own this API key.
        public let resourceType: CreateApiKeysRequestResourceType
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            apiVersionDate: CreateApiKeysRequestApiVersionDate? = nil,
            expiresAt: Nullable<String>? = nil,
            ipAllowlist: Nullable<[String]>? = nil,
            name: String,
            permissions: CreateApiKeysRequestPermissions,
            resourceId: String,
            resourceType: CreateApiKeysRequestResourceType,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.apiVersionDate = apiVersionDate
            self.expiresAt = expiresAt
            self.ipAllowlist = ipAllowlist
            self.name = name
            self.permissions = permissions
            self.resourceId = resourceId
            self.resourceType = resourceType
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.apiVersionDate = try container.decodeIfPresent(CreateApiKeysRequestApiVersionDate.self, forKey: .apiVersionDate)
            self.expiresAt = try container.decodeNullableIfPresent(String.self, forKey: .expiresAt)
            self.ipAllowlist = try container.decodeNullableIfPresent([String].self, forKey: .ipAllowlist)
            self.name = try container.decode(String.self, forKey: .name)
            self.permissions = try container.decode(CreateApiKeysRequestPermissions.self, forKey: .permissions)
            self.resourceId = try container.decode(String.self, forKey: .resourceId)
            self.resourceType = try container.decode(CreateApiKeysRequestResourceType.self, forKey: .resourceType)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.apiVersionDate, forKey: .apiVersionDate)
            try container.encodeNullableIfPresent(self.expiresAt, forKey: .expiresAt)
            try container.encodeNullableIfPresent(self.ipAllowlist, forKey: .ipAllowlist)
            try container.encode(self.name, forKey: .name)
            try container.encode(self.permissions, forKey: .permissions)
            try container.encode(self.resourceId, forKey: .resourceId)
            try container.encode(self.resourceType, forKey: .resourceType)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case apiVersionDate = "api_version_date"
            case expiresAt = "expires_at"
            case ipAllowlist = "ip_allowlist"
            case name
            case permissions
            case resourceId = "resource_id"
            case resourceType = "resource_type"
        }
    }
}