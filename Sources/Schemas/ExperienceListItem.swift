import Foundation

/// An experience is a feature or content module within a product, such as a chat, course, or custom app.
public struct ExperienceListItem: Codable, Hashable, Sendable {
    /// The app that powers this experience, defining its interface and behavior.
    public let app: ExperienceListItemApp
    /// The company that owns this experience.
    public let company: ExperienceListItemCompany
    /// The datetime the experience was created.
    public let createdAt: Date
    /// The unique identifier for the experience.
    public let id: String
    /// The custom logo image for this experience. Null if no custom logo has been uploaded.
    public let image: Nullable<ExperienceListItemImage>
    /// Whether this experience is publicly visible to all users, including those without a membership.
    public let isPublic: Bool
    /// The display name of this experience shown to users in the product navigation. Maximum 255 characters.
    public let name: String
    /// The sort position of this experience within its section. Lower values appear first. Null if no position has been set.
    public let order: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        app: ExperienceListItemApp,
        company: ExperienceListItemCompany,
        createdAt: Date,
        id: String,
        image: Nullable<ExperienceListItemImage>,
        isPublic: Bool,
        name: String,
        order: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.app = app
        self.company = company
        self.createdAt = createdAt
        self.id = id
        self.image = image
        self.isPublic = isPublic
        self.name = name
        self.order = order
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.app = try container.decode(ExperienceListItemApp.self, forKey: .app)
        self.company = try container.decode(ExperienceListItemCompany.self, forKey: .company)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.id = try container.decode(String.self, forKey: .id)
        self.image = try container.decode(Nullable<ExperienceListItemImage>.self, forKey: .image)
        self.isPublic = try container.decode(Bool.self, forKey: .isPublic)
        self.name = try container.decode(String.self, forKey: .name)
        self.order = try container.decode(Nullable<String>.self, forKey: .order)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.app, forKey: .app)
        try container.encode(self.company, forKey: .company)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.image, forKey: .image)
        try container.encode(self.isPublic, forKey: .isPublic)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.order, forKey: .order)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case app
        case company
        case createdAt = "created_at"
        case id
        case image
        case isPublic = "is_public"
        case name
        case order
    }
}