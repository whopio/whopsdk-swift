import Foundation

/// Input for creating a requested permission
public struct UpdatePermissionsAppRequestRequestedPermissionsItem: Codable, Hashable, Sendable {
    /// The action that the app will request off of users when a user installs the app.
    public let action: String
    /// Whether the action is required for the app to function.
    public let isRequired: Bool
    /// The reason for requesting the action.
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