import Foundation

public struct ResolutionBuyer: Codable, Hashable, Sendable {
    /// The customer's email address. Requires the `member:email:read` scope; `null` without it.
    public let email: Nullable<String>
    /// The customer's member row on the account, prefixed `mem_`.
    public let memberId: Nullable<String>
    /// The customer's display name.
    public let name: Nullable<String>
    /// The customer's user ID, prefixed `user_`.
    public let userId: Nullable<String>
    /// The customer's Whop username.
    public let username: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        email: Nullable<String>,
        memberId: Nullable<String>,
        name: Nullable<String>,
        userId: Nullable<String>,
        username: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.email = email
        self.memberId = memberId
        self.name = name
        self.userId = userId
        self.username = username
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.decode(Nullable<String>.self, forKey: .email)
        self.memberId = try container.decode(Nullable<String>.self, forKey: .memberId)
        self.name = try container.decode(Nullable<String>.self, forKey: .name)
        self.userId = try container.decode(Nullable<String>.self, forKey: .userId)
        self.username = try container.decode(Nullable<String>.self, forKey: .username)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.memberId, forKey: .memberId)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.userId, forKey: .userId)
        try container.encode(self.username, forKey: .username)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case email
        case memberId = "member_id"
        case name
        case userId = "user_id"
        case username
    }
}