import Foundation

public struct Permission: Codable, Hashable, Sendable {
    /// The permission action's identifier, for example `company:basic:read`.
    public let action: String
    /// Whether an API key can be granted the permission.
    public let allowedOnApiKey: Bool
    /// Whether an app can request and be granted the permission.
    public let allowedOnApp: Bool
    /// Whether the permission can be granted to user tokens.
    public let allowedOnUser: Bool
    /// The category the action is grouped under, or `null` when uncategorized.
    public let category: Nullable<String>
    /// What granting the action allows.
    public let description: String
    public let grantedToSystemRoles: [PermissionGrantedToSystemRolesItem]
    /// Human-readable name of the action.
    public let name: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        action: String,
        allowedOnApiKey: Bool,
        allowedOnApp: Bool,
        allowedOnUser: Bool,
        category: Nullable<String>,
        description: String,
        grantedToSystemRoles: [PermissionGrantedToSystemRolesItem],
        name: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.action = action
        self.allowedOnApiKey = allowedOnApiKey
        self.allowedOnApp = allowedOnApp
        self.allowedOnUser = allowedOnUser
        self.category = category
        self.description = description
        self.grantedToSystemRoles = grantedToSystemRoles
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.action = try container.decode(String.self, forKey: .action)
        self.allowedOnApiKey = try container.decode(Bool.self, forKey: .allowedOnApiKey)
        self.allowedOnApp = try container.decode(Bool.self, forKey: .allowedOnApp)
        self.allowedOnUser = try container.decode(Bool.self, forKey: .allowedOnUser)
        self.category = try container.decode(Nullable<String>.self, forKey: .category)
        self.description = try container.decode(String.self, forKey: .description)
        self.grantedToSystemRoles = try container.decode([PermissionGrantedToSystemRolesItem].self, forKey: .grantedToSystemRoles)
        self.name = try container.decode(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.action, forKey: .action)
        try container.encode(self.allowedOnApiKey, forKey: .allowedOnApiKey)
        try container.encode(self.allowedOnApp, forKey: .allowedOnApp)
        try container.encode(self.allowedOnUser, forKey: .allowedOnUser)
        try container.encode(self.category, forKey: .category)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.grantedToSystemRoles, forKey: .grantedToSystemRoles)
        try container.encode(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case action
        case allowedOnApiKey = "allowed_on_api_key"
        case allowedOnApp = "allowed_on_app"
        case allowedOnUser = "allowed_on_user"
        case category
        case description
        case grantedToSystemRoles = "granted_to_system_roles"
        case name
    }
}