import Foundation

public struct MembershipMember: Codable, Hashable, Sendable {
    /// What the member can reach on the account: `customer` for paying members, `admin` for team members, `no_access` once every grant has lapsed.
    public let accessLevel: MembershipMemberAccessLevel
    /// When the member last opened the account's content, as an ISO 8601 timestamp. `null` if they never have.
    public let lastAccessedAt: Nullable<String>
    /// The member's sort position in the buyer's own account list. `null` until they arrange it.
    public let position: Nullable<Double>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accessLevel: MembershipMemberAccessLevel,
        lastAccessedAt: Nullable<String>,
        position: Nullable<Double>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accessLevel = accessLevel
        self.lastAccessedAt = lastAccessedAt
        self.position = position
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accessLevel = try container.decode(MembershipMemberAccessLevel.self, forKey: .accessLevel)
        self.lastAccessedAt = try container.decode(Nullable<String>.self, forKey: .lastAccessedAt)
        self.position = try container.decode(Nullable<Double>.self, forKey: .position)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accessLevel, forKey: .accessLevel)
        try container.encode(self.lastAccessedAt, forKey: .lastAccessedAt)
        try container.encode(self.position, forKey: .position)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accessLevel = "access_level"
        case lastAccessedAt = "last_accessed_at"
        case position
    }
}