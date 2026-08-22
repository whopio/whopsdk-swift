import Foundation

public struct AppRequestedPermissionAction: Codable, Hashable, Sendable {
    /// The permission action's identifier, for example `company:basic:read`.
    public let action: String
    /// Human-readable name of the action.
    public let name: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        action: String,
        name: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.action = action
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.action = try container.decode(String.self, forKey: .action)
        self.name = try container.decode(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.action, forKey: .action)
        try container.encode(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case action
        case name
    }
}