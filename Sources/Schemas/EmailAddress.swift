import Foundation

public struct EmailAddress: Codable, Hashable, Sendable {
    /// ID of the account the address belongs to, prefixed `biz_`.
    public let accountId: String
    /// The full address in lowercase, such as support@example.com.
    public let address: String
    /// When the address was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// ID of the domain the address is on, prefixed `dom_`.
    public let domainId: String
    /// Email address ID, prefixed `emaddr_`.
    public let id: String
    /// The password mail apps sign in to the mailbox with over IMAP and SMTP, using the address as the username. `null` unless you can use the mailbox: you own it, or nobody owns it and you have `email:read` and `email:send`.
    public let password: Nullable<String>
    /// When the address was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// ID of the team member who owns the mailbox, prefixed `user_`. Only they can read it or send from it. `null` when the whole account shares it.
    public let userId: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        address: String,
        createdAt: String,
        domainId: String,
        id: String,
        password: Nullable<String>,
        updatedAt: String,
        userId: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.address = address
        self.createdAt = createdAt
        self.domainId = domainId
        self.id = id
        self.password = password
        self.updatedAt = updatedAt
        self.userId = userId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.address = try container.decode(String.self, forKey: .address)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.domainId = try container.decode(String.self, forKey: .domainId)
        self.id = try container.decode(String.self, forKey: .id)
        self.password = try container.decode(Nullable<String>.self, forKey: .password)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.userId = try container.decode(Nullable<String>.self, forKey: .userId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.address, forKey: .address)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.domainId, forKey: .domainId)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.password, forKey: .password)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.userId, forKey: .userId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case address
        case createdAt = "created_at"
        case domainId = "domain_id"
        case id
        case password
        case updatedAt = "updated_at"
        case userId = "user_id"
    }
}