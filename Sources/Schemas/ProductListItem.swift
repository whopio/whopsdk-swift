import Foundation

public struct ProductListItem: Codable, Hashable, Sendable {
    /// Account that sells this product.
    public let account: Nullable<[String: JSONValue]>
    /// Average star rating across published reviews for this product, from `1.0` to `5.0`. Returns `0.0` when no published-review rating is available.
    public let averageReviewRating: Double
    /// When the product was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Buyable variant to show and check out with. The configured default when that variant is buyable, otherwise the first buyable variant in product-page order. `null` when none is buyable.
    public let defaultVariant: Nullable<ProductPublicVariant>
    /// Written description displayed on the product page. `null` if none is set.
    public let description: Nullable<String>
    public let experiences: [ProductExperience]
    /// External identifier stored on the product for your own reference.
    public let externalIdentifier: Nullable<String>
    public let galleryImages: [ProductGalleryImage]
    /// Short marketing headline displayed on product page.
    public let headline: Nullable<String>
    /// Product ID, prefixed `prod_`.
    public let id: String
    public let labels: [String]
    /// Logo image URL shown on product pages and in search results. `null` when the product has no logo.
    public let logoUrl: Nullable<String>
    /// Active memberships for this product; 0 if public member counts are disabled.
    public let memberCount: Double
    /// Custom key-value pairs stored on the product.
    public let metadata: Nullable<[String: JSONValue]>
    /// Published customer reviews for this product.
    public let publishedReviewsCount: Double
    /// URL slug for the product's public link.
    public let route: String
    /// Product display name shown to customers.
    public let title: String
    /// When the product was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// The option set the product's variants span, as a map of attribute name to the values in use, e.g. `{"color": ["Blue", "Red"], "size": ["S", "M", "L"]}`. Derived from the visible, non-invoice variants that carry `attributes`: keys alphabetical, values in the order the variants were created. Read-only. `null` when the product has no variants.
    public let variantAttributes: Nullable<[String: JSONValue]>
    /// Whether the product has been verified by Whop.
    public let verified: Bool
    /// Whether the product is publicly visible, hidden, or archived.
    public let visibility: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: Nullable<[String: JSONValue]>,
        averageReviewRating: Double,
        createdAt: String,
        defaultVariant: Nullable<ProductPublicVariant>,
        description: Nullable<String>,
        experiences: [ProductExperience],
        externalIdentifier: Nullable<String>,
        galleryImages: [ProductGalleryImage],
        headline: Nullable<String>,
        id: String,
        labels: [String],
        logoUrl: Nullable<String>,
        memberCount: Double,
        metadata: Nullable<[String: JSONValue]>,
        publishedReviewsCount: Double,
        route: String,
        title: String,
        updatedAt: String,
        variantAttributes: Nullable<[String: JSONValue]>,
        verified: Bool,
        visibility: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.averageReviewRating = averageReviewRating
        self.createdAt = createdAt
        self.defaultVariant = defaultVariant
        self.description = description
        self.experiences = experiences
        self.externalIdentifier = externalIdentifier
        self.galleryImages = galleryImages
        self.headline = headline
        self.id = id
        self.labels = labels
        self.logoUrl = logoUrl
        self.memberCount = memberCount
        self.metadata = metadata
        self.publishedReviewsCount = publishedReviewsCount
        self.route = route
        self.title = title
        self.updatedAt = updatedAt
        self.variantAttributes = variantAttributes
        self.verified = verified
        self.visibility = visibility
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .account)
        self.averageReviewRating = try container.decode(Double.self, forKey: .averageReviewRating)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.defaultVariant = try container.decode(Nullable<ProductPublicVariant>.self, forKey: .defaultVariant)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.experiences = try container.decode([ProductExperience].self, forKey: .experiences)
        self.externalIdentifier = try container.decode(Nullable<String>.self, forKey: .externalIdentifier)
        self.galleryImages = try container.decode([ProductGalleryImage].self, forKey: .galleryImages)
        self.headline = try container.decode(Nullable<String>.self, forKey: .headline)
        self.id = try container.decode(String.self, forKey: .id)
        self.labels = try container.decode([String].self, forKey: .labels)
        self.logoUrl = try container.decode(Nullable<String>.self, forKey: .logoUrl)
        self.memberCount = try container.decode(Double.self, forKey: .memberCount)
        self.metadata = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .metadata)
        self.publishedReviewsCount = try container.decode(Double.self, forKey: .publishedReviewsCount)
        self.route = try container.decode(String.self, forKey: .route)
        self.title = try container.decode(String.self, forKey: .title)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.variantAttributes = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .variantAttributes)
        self.verified = try container.decode(Bool.self, forKey: .verified)
        self.visibility = try container.decode(Nullable<String>.self, forKey: .visibility)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.averageReviewRating, forKey: .averageReviewRating)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.defaultVariant, forKey: .defaultVariant)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.experiences, forKey: .experiences)
        try container.encode(self.externalIdentifier, forKey: .externalIdentifier)
        try container.encode(self.galleryImages, forKey: .galleryImages)
        try container.encode(self.headline, forKey: .headline)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.labels, forKey: .labels)
        try container.encode(self.logoUrl, forKey: .logoUrl)
        try container.encode(self.memberCount, forKey: .memberCount)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.publishedReviewsCount, forKey: .publishedReviewsCount)
        try container.encode(self.route, forKey: .route)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.variantAttributes, forKey: .variantAttributes)
        try container.encode(self.verified, forKey: .verified)
        try container.encode(self.visibility, forKey: .visibility)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case averageReviewRating = "average_review_rating"
        case createdAt = "created_at"
        case defaultVariant = "default_variant"
        case description
        case experiences
        case externalIdentifier = "external_identifier"
        case galleryImages = "gallery_images"
        case headline
        case id
        case labels
        case logoUrl = "logo_url"
        case memberCount = "member_count"
        case metadata
        case publishedReviewsCount = "published_reviews_count"
        case route
        case title
        case updatedAt = "updated_at"
        case variantAttributes = "variant_attributes"
        case verified
        case visibility
    }
}