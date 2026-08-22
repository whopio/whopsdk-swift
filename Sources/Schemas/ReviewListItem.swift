import Foundation

/// A user-submitted review of a company, including a star rating and optional text feedback.
public struct ReviewListItem: Codable, Hashable, Sendable {
    /// A list of files and media attached to the review.
    public let attachments: [ReviewListItemAttachmentsItem]
    /// The datetime the review was created.
    public let createdAt: Date
    /// The body text of the review containing the user's detailed feedback. Returns an empty string if no description was provided.
    public let description: Nullable<String>
    /// The unique identifier for the review.
    public let id: String
    /// The timestamp of when the reviewer first joined the product. Null if unknown.
    public let joinedAt: Nullable<Date>
    /// Whether the reviewer paid for the product. Null if the payment status is unknown.
    public let paidForProduct: Nullable<Bool>
    /// The timestamp of when the review was published. Null if the review has not been published yet.
    public let publishedAt: Nullable<Date>
    /// The star rating given by the reviewer, from 1 to 5.
    public let stars: Int
    /// The current moderation status of the review.
    public let status: ReviewStatus
    /// A short summary title for the review. Null if the reviewer did not provide one.
    public let title: Nullable<String>
    /// The datetime the review was last updated.
    public let updatedAt: Date
    /// The user account of the person who wrote this review.
    public let user: ReviewListItemUser
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        attachments: [ReviewListItemAttachmentsItem],
        createdAt: Date,
        description: Nullable<String>,
        id: String,
        joinedAt: Nullable<Date>,
        paidForProduct: Nullable<Bool>,
        publishedAt: Nullable<Date>,
        stars: Int,
        status: ReviewStatus,
        title: Nullable<String>,
        updatedAt: Date,
        user: ReviewListItemUser,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.attachments = attachments
        self.createdAt = createdAt
        self.description = description
        self.id = id
        self.joinedAt = joinedAt
        self.paidForProduct = paidForProduct
        self.publishedAt = publishedAt
        self.stars = stars
        self.status = status
        self.title = title
        self.updatedAt = updatedAt
        self.user = user
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attachments = try container.decode([ReviewListItemAttachmentsItem].self, forKey: .attachments)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.id = try container.decode(String.self, forKey: .id)
        self.joinedAt = try container.decode(Nullable<Date>.self, forKey: .joinedAt)
        self.paidForProduct = try container.decode(Nullable<Bool>.self, forKey: .paidForProduct)
        self.publishedAt = try container.decode(Nullable<Date>.self, forKey: .publishedAt)
        self.stars = try container.decode(Int.self, forKey: .stars)
        self.status = try container.decode(ReviewStatus.self, forKey: .status)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.user = try container.decode(ReviewListItemUser.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.attachments, forKey: .attachments)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.joinedAt, forKey: .joinedAt)
        try container.encode(self.paidForProduct, forKey: .paidForProduct)
        try container.encode(self.publishedAt, forKey: .publishedAt)
        try container.encode(self.stars, forKey: .stars)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case attachments
        case createdAt = "created_at"
        case description
        case id
        case joinedAt = "joined_at"
        case paidForProduct = "paid_for_product"
        case publishedAt = "published_at"
        case stars
        case status
        case title
        case updatedAt = "updated_at"
        case user
    }
}