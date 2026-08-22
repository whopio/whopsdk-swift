import Foundation

/// The permissions policy for the API key: explicit permission statements, or a system role to inherit from. Statements without a `resources` array default to the owning account (Account API keys) or every key-addressable resource (App API keys).
public struct CreateApiKeysRequestPermissions: Codable, Hashable, Sendable {
    /// Explicit permission statements. Required unless `system_role` is set.
    public let statements: [CreateApiKeysRequestPermissionsStatementsItem]?
    /// A system role to inherit permissions from. Only Account API keys can use a system role.
    public let systemRole: Nullable<CreateApiKeysRequestPermissionsSystemRole>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        statements: [CreateApiKeysRequestPermissionsStatementsItem]? = nil,
        systemRole: Nullable<CreateApiKeysRequestPermissionsSystemRole>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.statements = statements
        self.systemRole = systemRole
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.statements = try container.decodeIfPresent([CreateApiKeysRequestPermissionsStatementsItem].self, forKey: .statements)
        self.systemRole = try container.decodeNullableIfPresent(CreateApiKeysRequestPermissionsSystemRole.self, forKey: .systemRole)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.statements, forKey: .statements)
        try container.encodeNullableIfPresent(self.systemRole, forKey: .systemRole)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case statements
        case systemRole = "system_role"
    }
}