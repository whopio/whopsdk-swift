import Foundation

/// An entry represents a user's signup for a waitlisted plan.
public struct EntryListItem: Codable, Hashable, Sendable {
    /// The datetime the entry was created.
    public let createdAt: Nullable<Date>
    /// The unique identifier for the entry.
    public let id: String
    /// The waitlisted plan that this entry is a signup for.
    public let plan: Nullable<EntryListItemPlan>
    /// The product associated with this entry's waitlisted plan. Null if the plan is not tied to a product.
    public let product: Nullable<EntryListItemProduct>
    /// The current status of the waitlist entry (e.g., drafted, pending, approved, denied).
    public let status: EntryStatus
    /// The user who submitted this waitlist entry.
    public let user: EntryListItemUser
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: Nullable<Date>,
        id: String,
        plan: Nullable<EntryListItemPlan>,
        product: Nullable<EntryListItemProduct>,
        status: EntryStatus,
        user: EntryListItemUser,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.id = id
        self.plan = plan
        self.product = product
        self.status = status
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(Nullable<Date>.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.plan = try container.decode(Nullable<EntryListItemPlan>.self, forKey: .plan)
        self.product = try container.decode(Nullable<EntryListItemProduct>.self, forKey: .product)
        self.status = try container.decode(EntryStatus.self, forKey: .status)
        self.user = try container.decode(EntryListItemUser.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.plan, forKey: .plan)
        try container.encode(self.product, forKey: .product)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case id
        case plan
        case product
        case status
        case user
    }
}