import Foundation

/// A user who belongs to a company's team with access determined by their assigned role.
public struct AuthorizedUserListItem: Codable, Hashable, Sendable {
    /// The company this authorized user has access to.
    public let company: AuthorizedUserListItemCompany
    /// The team member's ID. It may start with `ausr_` or `mber_`; treat it as opaque.
    public let id: String
    /// The permission role assigned to this authorized user within the company.
    public let role: AuthorizedUserRoles
    /// The user account linked to this authorized user record.
    public let user: AuthorizedUserListItemUser
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        company: AuthorizedUserListItemCompany,
        id: String,
        role: AuthorizedUserRoles,
        user: AuthorizedUserListItemUser,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.company = company
        self.id = id
        self.role = role
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.company = try container.decode(AuthorizedUserListItemCompany.self, forKey: .company)
        self.id = try container.decode(String.self, forKey: .id)
        self.role = try container.decode(AuthorizedUserRoles.self, forKey: .role)
        self.user = try container.decode(AuthorizedUserListItemUser.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.company, forKey: .company)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.role, forKey: .role)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case company
        case id
        case role
        case user
    }
}