import Foundation

public struct UpdatePermissionsAppsRequestRequestedPermissionsItem: Codable, Hashable, Sendable {
    /// The permission action, for example `company:basic:read`.
    public let action: String
    /// Whether installing the app requires granting this permission.
    public let isRequired: Bool
    /// Why the app needs this permission (20-512 characters), shown to the installing user.
    public let justification: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        action: String,
        isRequired: Bool,
        justification: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.action = action
        self.isRequired = isRequired
        self.justification = justification
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.action = try container.decode(String.self, forKey: .action)
        self.isRequired = try container.decode(Bool.self, forKey: .isRequired)
        self.justification = try container.decode(String.self, forKey: .justification)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.action, forKey: .action)
        try container.encode(self.isRequired, forKey: .isRequired)
        try container.encode(self.justification, forKey: .justification)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case action
        case isRequired = "is_required"
        case justification
    }
}