import Foundation

public struct AppRequestedPermission: Codable, Hashable, Sendable {
    /// Whether the app requires the permission to be granted on install, as opposed to requesting it optionally.
    public let isRequired: Bool
    /// The developer's explanation of why the app needs the permission, or `null` when none was provided.
    public let justification: Nullable<String>
    /// The permission action the app requests.
    public let permissionAction: AppRequestedPermissionAction
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        isRequired: Bool,
        justification: Nullable<String>,
        permissionAction: AppRequestedPermissionAction,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.isRequired = isRequired
        self.justification = justification
        self.permissionAction = permissionAction
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isRequired = try container.decode(Bool.self, forKey: .isRequired)
        self.justification = try container.decode(Nullable<String>.self, forKey: .justification)
        self.permissionAction = try container.decode(AppRequestedPermissionAction.self, forKey: .permissionAction)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.isRequired, forKey: .isRequired)
        try container.encode(self.justification, forKey: .justification)
        try container.encode(self.permissionAction, forKey: .permissionAction)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case isRequired = "is_required"
        case justification
        case permissionAction = "permission_action"
    }
}