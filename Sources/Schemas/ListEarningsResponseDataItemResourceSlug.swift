import Foundation

public struct ListEarningsResponseDataItemResourceSlug: Codable, Hashable, Sendable {
    /// The referred business that qualified.
    public let businessId: String
    public let createdAt: Date
    /// The retired onboarding reward ID. Always null; retained for historical earnings compatibility.
    public let id: Nullable<String>
    public let object: ListEarningsResponseDataItemResourceSlugObject
    /// The retired reward link slug. Always null; retained for historical earnings compatibility.
    public let slug: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        businessId: String,
        createdAt: Date,
        id: Nullable<String>,
        object: ListEarningsResponseDataItemResourceSlugObject,
        slug: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.businessId = businessId
        self.createdAt = createdAt
        self.id = id
        self.object = object
        self.slug = slug
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.businessId = try container.decode(String.self, forKey: .businessId)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.id = try container.decode(Nullable<String>.self, forKey: .id)
        self.object = try container.decode(ListEarningsResponseDataItemResourceSlugObject.self, forKey: .object)
        self.slug = try container.decode(Nullable<String>.self, forKey: .slug)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.businessId, forKey: .businessId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.object, forKey: .object)
        try container.encode(self.slug, forKey: .slug)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case businessId = "business_id"
        case createdAt = "created_at"
        case id
        case object
        case slug
    }
}