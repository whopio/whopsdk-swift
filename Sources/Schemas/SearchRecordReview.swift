import Foundation

public struct SearchRecordReview: Codable, Hashable, Sendable {
    /// Account the record belongs to, prefixed `biz_`.
    public let accountId: String
    /// When the review was posted, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Short text about the record, such as an account's headline or a case's reason. Display text in your locale that can change without a version change. `null` when there's none.
    public let description: Nullable<String>
    /// Review ID, prefixed `rev_`.
    public let id: String
    /// Logo or avatar. `null` when there's none.
    public let imageUrl: Nullable<String>
    /// Line shown under the title, such as the account or product the record belongs to. Display text in your locale that can change without a version change. `null` when there's none.
    public let subtitle: Nullable<String>
    /// Record name, such as a customer's name or a promo code. Display text in your locale that can change without a version change, so show it rather than parse it. `null` when the record has no name.
    public let title: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accountId: String,
        createdAt: String,
        description: Nullable<String>,
        id: String,
        imageUrl: Nullable<String>,
        subtitle: Nullable<String>,
        title: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accountId = accountId
        self.createdAt = createdAt
        self.description = description
        self.id = id
        self.imageUrl = imageUrl
        self.subtitle = subtitle
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountId = try container.decode(String.self, forKey: .accountId)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.id = try container.decode(String.self, forKey: .id)
        self.imageUrl = try container.decode(Nullable<String>.self, forKey: .imageUrl)
        self.subtitle = try container.decode(Nullable<String>.self, forKey: .subtitle)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accountId, forKey: .accountId)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.imageUrl, forKey: .imageUrl)
        try container.encode(self.subtitle, forKey: .subtitle)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case createdAt = "created_at"
        case description
        case id
        case imageUrl = "image_url"
        case subtitle
        case title
    }
}