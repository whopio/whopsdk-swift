import Foundation

public struct AdPlatformIssue: Codable, Hashable, Sendable {
    /// The kind of issue: information about delivery, a warning, or an error requiring attention.
    public let category: AdPlatformIssueCategory
    /// Unique identifier for the issue.
    public let id: String
    /// A description of what the issue is and how it can be resolved.
    public let message: String
    /// The ID of the campaign, ad group, or ad the issue is attached to.
    public let resourceId: Nullable<String>
    /// The type of resource the issue is attached to.
    public let resourceType: AdPlatformIssueResourceType
    /// A short, creator-facing title for the issue: the rule a content-review rejection names, or a generic label.
    public let title: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        category: AdPlatformIssueCategory,
        id: String,
        message: String,
        resourceId: Nullable<String>,
        resourceType: AdPlatformIssueResourceType,
        title: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.category = category
        self.id = id
        self.message = message
        self.resourceId = resourceId
        self.resourceType = resourceType
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.category = try container.decode(AdPlatformIssueCategory.self, forKey: .category)
        self.id = try container.decode(String.self, forKey: .id)
        self.message = try container.decode(String.self, forKey: .message)
        self.resourceId = try container.decode(Nullable<String>.self, forKey: .resourceId)
        self.resourceType = try container.decode(AdPlatformIssueResourceType.self, forKey: .resourceType)
        self.title = try container.decode(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.category, forKey: .category)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.message, forKey: .message)
        try container.encode(self.resourceId, forKey: .resourceId)
        try container.encode(self.resourceType, forKey: .resourceType)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case category
        case id
        case message
        case resourceId = "resource_id"
        case resourceType = "resource_type"
        case title
    }
}