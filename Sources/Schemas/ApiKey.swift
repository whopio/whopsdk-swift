import Foundation

public struct ApiKey: Codable, Hashable, Sendable {
    /// Dated API version used when requests authenticated with this key omit the `Api-Version-Date` header.
    public let apiVersionDate: ApiKeyApiVersionDate
    /// When the API key was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// When the API key stops working, as an ISO 8601 timestamp. `null` means it never expires.
    public let expiresAt: Nullable<String>
    public let grants: [ApiKeyGrant]?
    /// API key ID, prefixed `apik_`.
    public let id: String
    public let ipAllowlist: Nullable<[String]>
    /// Whether this is the resource's default API key. Default keys cannot be updated or deleted, only rotated.
    public let isDefaultForResource: Bool
    /// Human-readable name identifying the API key, or `null` when none was set.
    public let name: Nullable<String>
    /// Masked version of the secret key, so the key can be recognized without revealing the full secret.
    public let obfuscatedSecretKey: String
    /// The full secret used to authenticate requests. Returned only once, on create and rotate responses — store it immediately.
    public let secretKey: String?
    /// System role the key inherits its permissions from, or `null` when it uses an explicit permissions policy. Only account API keys can use a system role.
    public let systemRole: Nullable<ApiKeySystemRole>
    /// When the API key was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        apiVersionDate: ApiKeyApiVersionDate,
        createdAt: String,
        expiresAt: Nullable<String>,
        grants: [ApiKeyGrant]? = nil,
        id: String,
        ipAllowlist: Nullable<[String]>,
        isDefaultForResource: Bool,
        name: Nullable<String>,
        obfuscatedSecretKey: String,
        secretKey: String? = nil,
        systemRole: Nullable<ApiKeySystemRole>,
        updatedAt: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.apiVersionDate = apiVersionDate
        self.createdAt = createdAt
        self.expiresAt = expiresAt
        self.grants = grants
        self.id = id
        self.ipAllowlist = ipAllowlist
        self.isDefaultForResource = isDefaultForResource
        self.name = name
        self.obfuscatedSecretKey = obfuscatedSecretKey
        self.secretKey = secretKey
        self.systemRole = systemRole
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apiVersionDate = try container.decode(ApiKeyApiVersionDate.self, forKey: .apiVersionDate)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.expiresAt = try container.decode(Nullable<String>.self, forKey: .expiresAt)
        self.grants = try container.decodeIfPresent([ApiKeyGrant].self, forKey: .grants)
        self.id = try container.decode(String.self, forKey: .id)
        self.ipAllowlist = try container.decode(Nullable<[String]>.self, forKey: .ipAllowlist)
        self.isDefaultForResource = try container.decode(Bool.self, forKey: .isDefaultForResource)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.obfuscatedSecretKey = try container.decode(String.self, forKey: .obfuscatedSecretKey)
        self.secretKey = try container.decodeIfPresent(String.self, forKey: .secretKey)
        self.systemRole = try container.decode(Nullable<ApiKeySystemRole>.self, forKey: .systemRole)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.apiVersionDate, forKey: .apiVersionDate)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.expiresAt, forKey: .expiresAt)
        try container.encodeIfPresent(self.grants, forKey: .grants)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.ipAllowlist, forKey: .ipAllowlist)
        try container.encode(self.isDefaultForResource, forKey: .isDefaultForResource)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.obfuscatedSecretKey, forKey: .obfuscatedSecretKey)
        try container.encodeIfPresent(self.secretKey, forKey: .secretKey)
        try container.encode(self.systemRole, forKey: .systemRole)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case apiVersionDate = "api_version_date"
        case createdAt = "created_at"
        case expiresAt = "expires_at"
        case grants
        case id
        case ipAllowlist = "ip_allowlist"
        case isDefaultForResource = "is_default_for_resource"
        case name
        case obfuscatedSecretKey = "obfuscated_secret_key"
        case secretKey = "secret_key"
        case systemRole = "system_role"
        case updatedAt = "updated_at"
    }
}