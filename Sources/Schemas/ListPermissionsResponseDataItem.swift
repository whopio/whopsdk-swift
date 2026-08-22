import Foundation

public struct ListPermissionsResponseDataItem: Codable, Hashable, Sendable {
    public let action: PermissionAction
    /// Whether the credential is granted the action for the resource.
    public let granted: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        action: PermissionAction,
        granted: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.action = action
        self.granted = granted
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.action = try container.decode(PermissionAction.self, forKey: .action)
        self.granted = try container.decode(Bool.self, forKey: .granted)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.action, forKey: .action)
        try container.encode(self.granted, forKey: .granted)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case action
        case granted
    }
}