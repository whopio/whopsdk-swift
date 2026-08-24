import Foundation

/// An entry represents a user's signup for a waitlisted plan.
public struct Entry: Codable, Hashable, Sendable {
    /// The datetime the entry was created.
    public let createdAt: Nullable<Date>
    /// The list of responses collected from the user when submitting their waitlist entry.
    public let customFieldResponses: Nullable<[EntryCustomFieldResponsesItem]>
    /// The unique identifier for the entry.
    public let id: String
    /// The waitlisted plan that this entry is a signup for.
    public let plan: Nullable<EntryPlan>
    /// The product associated with this entry's waitlisted plan. Null if the plan is not tied to a product.
    public let product: Nullable<EntryProduct>
    /// The current status of the waitlist entry (e.g., drafted, pending, approved, denied).
    public let status: EntryStatus
    /// The user who submitted this waitlist entry.
    public let user: EntryUser
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: Nullable<Date>,
        customFieldResponses: Nullable<[EntryCustomFieldResponsesItem]>,
        id: String,
        plan: Nullable<EntryPlan>,
        product: Nullable<EntryProduct>,
        status: EntryStatus,
        user: EntryUser,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.customFieldResponses = customFieldResponses
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
        self.customFieldResponses = try container.decode(Nullable<[EntryCustomFieldResponsesItem]>.self, forKey: .customFieldResponses)
        self.id = try container.decode(String.self, forKey: .id)
        self.plan = try container.decode(Nullable<EntryPlan>.self, forKey: .plan)
        self.product = try container.decode(Nullable<EntryProduct>.self, forKey: .product)
        self.status = try container.decode(EntryStatus.self, forKey: .status)
        self.user = try container.decode(EntryUser.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.customFieldResponses, forKey: .customFieldResponses)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.plan, forKey: .plan)
        try container.encode(self.product, forKey: .product)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt = "created_at"
        case customFieldResponses = "custom_field_responses"
        case id
        case plan
        case product
        case status
        case user
    }
}