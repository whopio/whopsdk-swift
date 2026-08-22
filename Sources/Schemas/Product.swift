import Foundation

public struct Product: Codable, Hashable, Sendable {
    /// Account that sells this product.
    public let account: Nullable<[String: JSONValue]>
    /// When the product was created, as an ISO 8601 timestamp.
    public let createdAt: String
    /// Call-to-action button label shown on the product purchase page.
    public let customCta: Nullable<ProductCustomCta>
    /// URL the call-to-action button links to instead of checkout.
    public let customCtaUrl: Nullable<String>
    /// Custom text label on customer's bank statement.
    public let customStatementDescriptor: Nullable<String>
    /// Written description displayed on product page.
    public let description: Nullable<String>
    /// External identifier stored on the product for your own reference.
    public let externalIdentifier: Nullable<String>
    public let galleryImages: [ProductGalleryImage]
    /// Commission rate affiliates earn through the global affiliate program.
    public let globalAffiliatePercentage: Nullable<Double>
    /// Enrollment status in the global affiliate program.
    public let globalAffiliateStatus: Nullable<ProductGlobalAffiliateStatus>
    /// Short marketing headline displayed on product page.
    public let headline: Nullable<String>
    /// Product ID, prefixed `prod_`.
    public let id: String
    public let labels: [String]
    /// Listing state on the whop.com marketplace. `pending_review` means submitted and awaiting review; `live_marketplace` means approved and discoverable.
    public let marketplaceStatus: ProductMarketplaceStatus
    /// Commission rate members earn through the member affiliate program.
    public let memberAffiliatePercentage: Nullable<Double>
    /// Enrollment status in the member affiliate program.
    public let memberAffiliateStatus: Nullable<ProductMemberAffiliateStatus>
    /// Active memberships for this product; 0 if public member counts are disabled.
    public let memberCount: Double
    /// Custom key-value pairs stored on the product.
    public let metadata: Nullable<[String: JSONValue]>
    /// User who owns the account selling this product.
    public let ownerUser: Nullable<[String: JSONValue]>
    /// Tax classification code for this product, or `null` if no tax code is set.
    public let productTaxCode: Nullable<[String: JSONValue]>
    /// Published customer reviews for this product.
    public let publishedReviewsCount: Double
    /// URL slug for the product's public link.
    public let route: String
    /// Product display name shown to customers.
    public let title: String
    /// When the product was last updated, as an ISO 8601 timestamp.
    public let updatedAt: String
    /// Whether the product has been verified by Whop.
    public let verified: Bool
    /// Whether the product is publicly visible, hidden, or archived.
    public let visibility: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: Nullable<[String: JSONValue]>,
        createdAt: String,
        customCta: Nullable<ProductCustomCta>,
        customCtaUrl: Nullable<String>,
        customStatementDescriptor: Nullable<String>,
        description: Nullable<String>,
        externalIdentifier: Nullable<String>,
        galleryImages: [ProductGalleryImage],
        globalAffiliatePercentage: Nullable<Double>,
        globalAffiliateStatus: Nullable<ProductGlobalAffiliateStatus>,
        headline: Nullable<String>,
        id: String,
        labels: [String],
        marketplaceStatus: ProductMarketplaceStatus,
        memberAffiliatePercentage: Nullable<Double>,
        memberAffiliateStatus: Nullable<ProductMemberAffiliateStatus>,
        memberCount: Double,
        metadata: Nullable<[String: JSONValue]>,
        ownerUser: Nullable<[String: JSONValue]>,
        productTaxCode: Nullable<[String: JSONValue]>,
        publishedReviewsCount: Double,
        route: String,
        title: String,
        updatedAt: String,
        verified: Bool,
        visibility: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.createdAt = createdAt
        self.customCta = customCta
        self.customCtaUrl = customCtaUrl
        self.customStatementDescriptor = customStatementDescriptor
        self.description = description
        self.externalIdentifier = externalIdentifier
        self.galleryImages = galleryImages
        self.globalAffiliatePercentage = globalAffiliatePercentage
        self.globalAffiliateStatus = globalAffiliateStatus
        self.headline = headline
        self.id = id
        self.labels = labels
        self.marketplaceStatus = marketplaceStatus
        self.memberAffiliatePercentage = memberAffiliatePercentage
        self.memberAffiliateStatus = memberAffiliateStatus
        self.memberCount = memberCount
        self.metadata = metadata
        self.ownerUser = ownerUser
        self.productTaxCode = productTaxCode
        self.publishedReviewsCount = publishedReviewsCount
        self.route = route
        self.title = title
        self.updatedAt = updatedAt
        self.verified = verified
        self.visibility = visibility
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .account)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.customCta = try container.decode(Nullable<ProductCustomCta>.self, forKey: .customCta)
        self.customCtaUrl = try container.decode(Nullable<String>.self, forKey: .customCtaUrl)
        self.customStatementDescriptor = try container.decode(Nullable<String>.self, forKey: .customStatementDescriptor)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.externalIdentifier = try container.decode(Nullable<String>.self, forKey: .externalIdentifier)
        self.galleryImages = try container.decode([ProductGalleryImage].self, forKey: .galleryImages)
        self.globalAffiliatePercentage = try container.decode(Nullable<Double>.self, forKey: .globalAffiliatePercentage)
        self.globalAffiliateStatus = try container.decode(Nullable<ProductGlobalAffiliateStatus>.self, forKey: .globalAffiliateStatus)
        self.headline = try container.decode(Nullable<String>.self, forKey: .headline)
        self.id = try container.decode(String.self, forKey: .id)
        self.labels = try container.decode([String].self, forKey: .labels)
        self.marketplaceStatus = try container.decode(ProductMarketplaceStatus.self, forKey: .marketplaceStatus)
        self.memberAffiliatePercentage = try container.decode(Nullable<Double>.self, forKey: .memberAffiliatePercentage)
        self.memberAffiliateStatus = try container.decode(Nullable<ProductMemberAffiliateStatus>.self, forKey: .memberAffiliateStatus)
        self.memberCount = try container.decode(Double.self, forKey: .memberCount)
        self.metadata = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .metadata)
        self.ownerUser = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .ownerUser)
        self.productTaxCode = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .productTaxCode)
        self.publishedReviewsCount = try container.decode(Double.self, forKey: .publishedReviewsCount)
        self.route = try container.decode(String.self, forKey: .route)
        self.title = try container.decode(String.self, forKey: .title)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.verified = try container.decode(Bool.self, forKey: .verified)
        self.visibility = try container.decode(Nullable<String>.self, forKey: .visibility)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.customCta, forKey: .customCta)
        try container.encode(self.customCtaUrl, forKey: .customCtaUrl)
        try container.encode(self.customStatementDescriptor, forKey: .customStatementDescriptor)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.externalIdentifier, forKey: .externalIdentifier)
        try container.encode(self.galleryImages, forKey: .galleryImages)
        try container.encode(self.globalAffiliatePercentage, forKey: .globalAffiliatePercentage)
        try container.encode(self.globalAffiliateStatus, forKey: .globalAffiliateStatus)
        try container.encode(self.headline, forKey: .headline)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.labels, forKey: .labels)
        try container.encode(self.marketplaceStatus, forKey: .marketplaceStatus)
        try container.encode(self.memberAffiliatePercentage, forKey: .memberAffiliatePercentage)
        try container.encode(self.memberAffiliateStatus, forKey: .memberAffiliateStatus)
        try container.encode(self.memberCount, forKey: .memberCount)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.ownerUser, forKey: .ownerUser)
        try container.encode(self.productTaxCode, forKey: .productTaxCode)
        try container.encode(self.publishedReviewsCount, forKey: .publishedReviewsCount)
        try container.encode(self.route, forKey: .route)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.verified, forKey: .verified)
        try container.encode(self.visibility, forKey: .visibility)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case createdAt = "created_at"
        case customCta = "custom_cta"
        case customCtaUrl = "custom_cta_url"
        case customStatementDescriptor = "custom_statement_descriptor"
        case description
        case externalIdentifier = "external_identifier"
        case galleryImages = "gallery_images"
        case globalAffiliatePercentage = "global_affiliate_percentage"
        case globalAffiliateStatus = "global_affiliate_status"
        case headline
        case id
        case labels
        case marketplaceStatus = "marketplace_status"
        case memberAffiliatePercentage = "member_affiliate_percentage"
        case memberAffiliateStatus = "member_affiliate_status"
        case memberCount = "member_count"
        case metadata
        case ownerUser = "owner_user"
        case productTaxCode = "product_tax_code"
        case publishedReviewsCount = "published_reviews_count"
        case route
        case title
        case updatedAt = "updated_at"
        case verified
        case visibility
    }
}