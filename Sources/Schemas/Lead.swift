import Foundation

/// A prospective customer who has expressed interest in a company or product but has not yet purchased.
public struct Lead: Codable, Hashable, Sendable {
    /// The datetime the lead was created.
    public let createdAt: Date
    /// The unique identifier for the lead.
    public let id: String
    /// The company member record if this lead has converted into a paying customer. Null if the lead has not converted.
    public let member: Nullable<LeadMember>
    /// Custom key-value pairs attached to this lead. Null if no metadata was provided.
    public let metadata: Nullable<[String: JSONValue]>
    /// The product the lead expressed interest in. Null if the lead is not associated with a specific product.
    public let product: Nullable<LeadProduct>
    /// The URL of the page that referred this lead to the company. Null if no referrer was captured.
    public let referrer: Nullable<String>
    /// The datetime the lead was last updated.
    public let updatedAt: Date
    /// The user account associated with this lead.
    public let user: LeadUser
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: Date,
        id: String,
        member: Nullable<LeadMember>,
        metadata: Nullable<[String: JSONValue]>,
        product: Nullable<LeadProduct>,
        referrer: Nullable<String>,
        updatedAt: Date,
        user: LeadUser,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.id = id
        self.member = member
        self.metadata = metadata
        self.product = product
        self.referrer = referrer
        self.updatedAt = updatedAt
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.member = try container.decode(Nullable<LeadMember>.self, forKey: .member)
        self.metadata = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .metadata)
        self.product = try container.decode(Nullable<LeadProduct>.self, forKey: .product)
        self.referrer = try container.decode(Nullable<String>.self, forKey: .referrer)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.user = try container.decode(LeadUser.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.member, forKey: .member)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.product, forKey: .product)
        try container.encode(self.referrer, forKey: .referrer)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case id
        case member
        case metadata
        case product
        case referrer
        case updatedAt = "updated_at"
        case user
    }
}