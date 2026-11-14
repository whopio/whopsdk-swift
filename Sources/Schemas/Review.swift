import Foundation

public struct Review: Codable, Hashable, Sendable {
    /// The account that this review was written for.
    public let account: ReviewAccount
    public let attachments: [ReviewAttachment]
    /// When the review was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// The body text of the review containing the user's detailed feedback. Returns an empty string if no description was provided.
    public let description: Nullable<String>
    /// The unique identifier for the review.
    public let id: String
    /// When the reviewer first joined the product, as an ISO 8601 timestamp. Null if unknown.
    public let joinedAt: Nullable<String>
    /// Whether the reviewer paid for the product. Null if the payment status is unknown.
    public let paidForProduct: Nullable<Bool>
    /// The product that this review was written for.
    public let product: ReviewProduct
    /// When the review was published, as an ISO 8601 timestamp. Null if unknown.
    public let publishedAt: Nullable<String>
    /// The star rating given by the reviewer, from 1 to 5.
    public let stars: Int
    /// The moderation status of the review. Only published reviews are returned.
    public let status: ReviewStatus
    /// A short summary title for the review. Null if the reviewer did not provide one.
    public let title: Nullable<String>
    /// When the review was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// The user account of the person who wrote this review.
    public let user: ReviewUser
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: ReviewAccount,
        attachments: [ReviewAttachment],
        createdAt: String,
        description: Nullable<String>,
        id: String,
        joinedAt: Nullable<String>,
        paidForProduct: Nullable<Bool>,
        product: ReviewProduct,
        publishedAt: Nullable<String>,
        stars: Int,
        status: ReviewStatus,
        title: Nullable<String>,
        updatedAt: String,
        user: ReviewUser,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.attachments = attachments
        self.createdAt = createdAt
        self.description = description
        self.id = id
        self.joinedAt = joinedAt
        self.paidForProduct = paidForProduct
        self.product = product
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
        self.account = try container.decode(ReviewAccount.self, forKey: .account)
        self.attachments = try container.decode([ReviewAttachment].self, forKey: .attachments)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.id = try container.decode(String.self, forKey: .id)
        self.joinedAt = try container.decode(Nullable<String>.self, forKey: .joinedAt)
        self.paidForProduct = try container.decode(Nullable<Bool>.self, forKey: .paidForProduct)
        self.product = try container.decode(ReviewProduct.self, forKey: .product)
        self.publishedAt = try container.decode(Nullable<String>.self, forKey: .publishedAt)
        self.stars = try container.decode(Int.self, forKey: .stars)
        self.status = try container.decode(ReviewStatus.self, forKey: .status)
        self.title = try container.decode(Nullable<String>.self, forKey: .title)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.user = try container.decode(ReviewUser.self, forKey: .user)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.attachments, forKey: .attachments)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.joinedAt, forKey: .joinedAt)
        try container.encode(self.paidForProduct, forKey: .paidForProduct)
        try container.encode(self.product, forKey: .product)
        try container.encode(self.publishedAt, forKey: .publishedAt)
        try container.encode(self.stars, forKey: .stars)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.user, forKey: .user)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case attachments
        case createdAt = "created_at"
        case description
        case id
        case joinedAt = "joined_at"
        case paidForProduct = "paid_for_product"
        case product
        case publishedAt = "published_at"
        case stars
        case status
        case title
        case updatedAt = "updated_at"
        case user
    }
}