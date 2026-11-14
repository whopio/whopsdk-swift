import Foundation

/// A product is a digital good or service sold on Whop. Products contain plans for pricing and experiences for content delivery.
public struct ProductLegacy: Codable, Hashable, Sendable {
    /// The company this product belongs to.
    public let company: ProductLegacyCompany
    /// The datetime the product was created.
    public let createdAt: Date
    /// Call-to-action button label shown on the product purchase page.
    public let customCta: CustomCtas
    /// An optional URL that the call-to-action button links to instead of the default checkout flow. Null if no custom URL is set.
    public let customCtaUrl: Nullable<String>
    /// Custom bank statement descriptor for product purchases. Maximum 22 characters, including required `WHOP*` prefix.
    public let customStatementDescriptor: Nullable<String>
    /// A brief summary of what the product offers, displayed on product pages and search results.
    public let description: Nullable<String>
    /// External identifier for the product. Providing it on a product creation endpoint updates the existing product with this identifier instead of creating a new one.
    public let externalIdentifier: Nullable<String>
    /// The gallery images for this product, ordered by position.
    public let galleryImages: [ProductLegacyGalleryImagesItem]
    /// Marketplace affiliate commission percentage for this product, or `null` if program is inactive.
    public let globalAffiliatePercentage: Nullable<Double>
    /// The enrollment status of this product in the Whop marketplace global affiliate program.
    public let globalAffiliateStatus: GlobalAffiliateStatuses
    /// A short marketing headline displayed prominently on the product's product page.
    public let headline: Nullable<String>
    /// The unique identifier for the product.
    public let id: String
    /// Member referral commission percentage for this product, or `null` if program is inactive.
    public let memberAffiliatePercentage: Nullable<Double>
    /// The enrollment status of this product in the member affiliate program.
    public let memberAffiliateStatus: GlobalAffiliateStatuses
    /// Active memberships for this product. Returns `0` if the account has disabled public member counts.
    public let memberCount: Int
    /// Custom key-value pairs stored on the product and included in payment and membership webhook payloads. Max 50 keys, 100 characters per key, 500 characters per string value.
    public let metadata: Nullable<[String: JSONValue]>
    /// The user who owns the company that sells this product.
    public let ownerUser: ProductLegacyOwnerUser
    /// The tax classification code applied to purchases of this product for sales tax calculation. Null if no tax code is assigned.
    public let productTaxCode: Nullable<ProductLegacyProductTaxCode>
    /// The total number of published customer reviews for this product's company.
    public let publishedReviewsCount: Int
    /// URL slug in the product's public link, e.g. `pickaxe-analytics` in whop.com/company/pickaxe-analytics.
    public let route: String
    /// The display name of the product shown to customers on the product page and in search results.
    public let title: String
    /// The datetime the product was last updated.
    public let updatedAt: Date
    /// Whether this company has been verified by Whop's trust and safety team.
    public let verified: Bool
    /// Controls whether the product is visible to customers. When set to 'hidden', the product is only accessible via direct link.
    public let visibility: Visibility
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        company: ProductLegacyCompany,
        createdAt: Date,
        customCta: CustomCtas,
        customCtaUrl: Nullable<String>,
        customStatementDescriptor: Nullable<String>,
        description: Nullable<String>,
        externalIdentifier: Nullable<String>,
        galleryImages: [ProductLegacyGalleryImagesItem],
        globalAffiliatePercentage: Nullable<Double>,
        globalAffiliateStatus: GlobalAffiliateStatuses,
        headline: Nullable<String>,
        id: String,
        memberAffiliatePercentage: Nullable<Double>,
        memberAffiliateStatus: GlobalAffiliateStatuses,
        memberCount: Int,
        metadata: Nullable<[String: JSONValue]>,
        ownerUser: ProductLegacyOwnerUser,
        productTaxCode: Nullable<ProductLegacyProductTaxCode>,
        publishedReviewsCount: Int,
        route: String,
        title: String,
        updatedAt: Date,
        verified: Bool,
        visibility: Visibility,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.company = company
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
        self.company = try container.decode(ProductLegacyCompany.self, forKey: .company)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.customCta = try container.decode(CustomCtas.self, forKey: .customCta)
        self.customCtaUrl = try container.decode(Nullable<String>.self, forKey: .customCtaUrl)
        self.customStatementDescriptor = try container.decode(Nullable<String>.self, forKey: .customStatementDescriptor)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.externalIdentifier = try container.decode(Nullable<String>.self, forKey: .externalIdentifier)
        self.galleryImages = try container.decode([ProductLegacyGalleryImagesItem].self, forKey: .galleryImages)
        self.globalAffiliatePercentage = try container.decode(Nullable<Double>.self, forKey: .globalAffiliatePercentage)
        self.globalAffiliateStatus = try container.decode(GlobalAffiliateStatuses.self, forKey: .globalAffiliateStatus)
        self.headline = try container.decode(Nullable<String>.self, forKey: .headline)
        self.id = try container.decode(String.self, forKey: .id)
        self.memberAffiliatePercentage = try container.decode(Nullable<Double>.self, forKey: .memberAffiliatePercentage)
        self.memberAffiliateStatus = try container.decode(GlobalAffiliateStatuses.self, forKey: .memberAffiliateStatus)
        self.memberCount = try container.decode(Int.self, forKey: .memberCount)
        self.metadata = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .metadata)
        self.ownerUser = try container.decode(ProductLegacyOwnerUser.self, forKey: .ownerUser)
        self.productTaxCode = try container.decode(Nullable<ProductLegacyProductTaxCode>.self, forKey: .productTaxCode)
        self.publishedReviewsCount = try container.decode(Int.self, forKey: .publishedReviewsCount)
        self.route = try container.decode(String.self, forKey: .route)
        self.title = try container.decode(String.self, forKey: .title)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.verified = try container.decode(Bool.self, forKey: .verified)
        self.visibility = try container.decode(Visibility.self, forKey: .visibility)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.company, forKey: .company)
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
        case company
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