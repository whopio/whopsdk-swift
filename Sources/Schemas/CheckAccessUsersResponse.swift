import Foundation

public struct CheckAccessUsersResponse: Codable, Hashable, Sendable {
    public let accessLevel: CheckAccessUsersResponseAccessLevel
    public let hasAccess: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accessLevel: CheckAccessUsersResponseAccessLevel,
        hasAccess: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accessLevel = accessLevel
        self.hasAccess = hasAccess
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accessLevel = try container.decode(CheckAccessUsersResponseAccessLevel.self, forKey: .accessLevel)
        self.hasAccess = try container.decode(Bool.self, forKey: .hasAccess)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accessLevel, forKey: .accessLevel)
        try container.encode(self.hasAccess, forKey: .hasAccess)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accessLevel = "access_level"
        case hasAccess = "has_access"
    }
}