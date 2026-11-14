import Foundation

public struct TeamMemberManager: Codable, Hashable, Sendable {
    /// The manager's team member ID, starting with `ausr_` or `mber_`; treat it as opaque.
    public let id: String
    /// The user behind the manager's team membership.
    public let user: UserSummary
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        user: UserSummary,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.user = try container.decode(UserSummary.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case user
    }
}