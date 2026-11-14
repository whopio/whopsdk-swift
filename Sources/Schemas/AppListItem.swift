import Foundation

public struct AppListItem: Codable, Hashable, Sendable {
    /// The account that owns the app.
    public let account: AccountParent
    /// The type of end-user the app is built for.
    public let appType: AppListItemAppType
    /// Average star rating across published reviews for this app, from `1.0` to `5.0`. Returns `0.0` when no published-review rating is available.
    public let averageReviewRating: Double
    /// Banner image from the app's product listing, or `null` when none is uploaded.
    public let bannerImage: Nullable<AppBannerImage>
    /// The production base URL where the app is hosted. `null` if no base URL is configured, if the caller lacks the `developer:basic:read` permission on the app's account, or on list responses, which never expose it.
    public let baseUrl: Nullable<String>
    /// Number of businesses created from this app as a template.
    public let businessesCreatedCount: Int
    public let businessesCreatedLogoUrls: [String]
    /// Number of businesses created from this app as a template that processed a payment in the last 24 hours. Recounted hourly, so it can be up to an hour behind.
    public let businessesWithRecentSalesCount: Int
    /// The app's App Store category, or `null` when none has been set. An app can show a category that `GET /apps/categories` does not list, if it was categorized before the current store categories.
    public let category: Nullable<AppCategory>
    /// The user who owns the publishing account.
    public let creator: AppCreator
    /// URL path for the account dashboard view, or `null` when not configured.
    public let dashboardPath: Nullable<String>
    /// Short description shown in listings and search results, or `null` if none has been set.
    public let description: Nullable<String>
    /// URL path for the discover view, or `null` when not configured.
    public let discoverPath: Nullable<String>
    /// Subdomain identifier for the app's proxied URL, forming https://{domain_id}.apps.whop.com.
    public let domainId: String
    public let domains: [AppDomain]
    /// URL path for the member-facing hub view, or `null` when not configured.
    public let experiencePath: Nullable<String>
    /// Full URL where the app's hosted web build is served, or `null` if no route is claimed.
    /// DEPRECATED: Read `domains` instead.
    public let hostedUrl: Nullable<String>
    /// The app's icon. Falls back to the default app icon when none is uploaded.
    public let icon: AppIcon
    /// App ID, prefixed `app_`.
    public let id: String
    /// Whether Whop publishes this app.
    public let isWhopApp: Bool
    /// Display name shown on the app store and in experience navigation.
    public let name: String
    /// URL path to the app's OpenAPI spec file, or `null` when not configured.
    public let openapiPath: Nullable<String>
    /// Full origin URL of the app's proxied domain, for example https://ab1c2d3e4f.apps.whop.com.
    public let origin: Nullable<String>
    /// Product category a business built from this app as a template sells, such as `pressure_washing`, or `null` when none has been set.
    public let productCategory: Nullable<String>
    /// Published customer reviews for this app.
    public let publishedReviewsCount: Int
    /// Claimed subdomain route where hosted web builds are served (`myapp` for myapp.whop.site), or `null` if no route is claimed.
    /// DEPRECATED: Read `domains` instead.
    public let route: Nullable<String>
    /// URL path to the app's skills directory, or `null` when not configured.
    public let skillsPath: Nullable<String>
    /// Visibility on the Whop app store: `live` is publicly discoverable, `unlisted` is accessible only via direct link, `hidden` is not visible anywhere.
    public let status: AppListItemStatus
    /// Whether the app has been verified by Whop and is eligible for the featured apps section.
    public let verified: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: AccountParent,
        appType: AppListItemAppType,
        averageReviewRating: Double,
        bannerImage: Nullable<AppBannerImage>,
        baseUrl: Nullable<String>,
        businessesCreatedCount: Int,
        businessesCreatedLogoUrls: [String],
        businessesWithRecentSalesCount: Int,
        category: Nullable<AppCategory>,
        creator: AppCreator,
        dashboardPath: Nullable<String>,
        description: Nullable<String>,
        discoverPath: Nullable<String>,
        domainId: String,
        domains: [AppDomain],
        experiencePath: Nullable<String>,
        hostedUrl: Nullable<String>,
        icon: AppIcon,
        id: String,
        isWhopApp: Bool,
        name: String,
        openapiPath: Nullable<String>,
        origin: Nullable<String>,
        productCategory: Nullable<String>,
        publishedReviewsCount: Int,
        route: Nullable<String>,
        skillsPath: Nullable<String>,
        status: AppListItemStatus,
        verified: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.appType = appType
        self.averageReviewRating = averageReviewRating
        self.bannerImage = bannerImage
        self.baseUrl = baseUrl
        self.businessesCreatedCount = businessesCreatedCount
        self.businessesCreatedLogoUrls = businessesCreatedLogoUrls
        self.businessesWithRecentSalesCount = businessesWithRecentSalesCount
        self.category = category
        self.creator = creator
        self.dashboardPath = dashboardPath
        self.description = description
        self.discoverPath = discoverPath
        self.domainId = domainId
        self.domains = domains
        self.experiencePath = experiencePath
        self.hostedUrl = hostedUrl
        self.icon = icon
        self.id = id
        self.isWhopApp = isWhopApp
        self.name = name
        self.openapiPath = openapiPath
        self.origin = origin
        self.productCategory = productCategory
        self.publishedReviewsCount = publishedReviewsCount
        self.route = route
        self.skillsPath = skillsPath
        self.status = status
        self.verified = verified
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decode(AccountParent.self, forKey: .account)
        self.appType = try container.decode(AppListItemAppType.self, forKey: .appType)
        self.averageReviewRating = try container.decode(Double.self, forKey: .averageReviewRating)
        self.bannerImage = try container.decode(Nullable<AppBannerImage>.self, forKey: .bannerImage)
        self.baseUrl = try container.decode(Nullable<String>.self, forKey: .baseUrl)
        self.businessesCreatedCount = try container.decode(Int.self, forKey: .businessesCreatedCount)
        self.businessesCreatedLogoUrls = try container.decode([String].self, forKey: .businessesCreatedLogoUrls)
        self.businessesWithRecentSalesCount = try container.decode(Int.self, forKey: .businessesWithRecentSalesCount)
        self.category = try container.decode(Nullable<AppCategory>.self, forKey: .category)
        self.creator = try container.decode(AppCreator.self, forKey: .creator)
        self.dashboardPath = try container.decode(Nullable<String>.self, forKey: .dashboardPath)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.discoverPath = try container.decode(Nullable<String>.self, forKey: .discoverPath)
        self.domainId = try container.decode(String.self, forKey: .domainId)
        self.domains = try container.decode([AppDomain].self, forKey: .domains)
        self.experiencePath = try container.decode(Nullable<String>.self, forKey: .experiencePath)
        self.hostedUrl = try container.decode(Nullable<String>.self, forKey: .hostedUrl)
        self.icon = try container.decode(AppIcon.self, forKey: .icon)
        self.id = try container.decode(String.self, forKey: .id)
        self.isWhopApp = try container.decode(Bool.self, forKey: .isWhopApp)
        self.name = try container.decode(String.self, forKey: .name)
        self.openapiPath = try container.decode(Nullable<String>.self, forKey: .openapiPath)
        self.origin = try container.decode(Nullable<String>.self, forKey: .origin)
        self.productCategory = try container.decode(Nullable<String>.self, forKey: .productCategory)
        self.publishedReviewsCount = try container.decode(Int.self, forKey: .publishedReviewsCount)
        self.route = try container.decode(Nullable<String>.self, forKey: .route)
        self.skillsPath = try container.decode(Nullable<String>.self, forKey: .skillsPath)
        self.status = try container.decode(AppListItemStatus.self, forKey: .status)
        self.verified = try container.decode(Bool.self, forKey: .verified)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.appType, forKey: .appType)
        try container.encode(self.averageReviewRating, forKey: .averageReviewRating)
        try container.encode(self.bannerImage, forKey: .bannerImage)
        try container.encode(self.baseUrl, forKey: .baseUrl)
        try container.encode(self.businessesCreatedCount, forKey: .businessesCreatedCount)
        try container.encode(self.businessesCreatedLogoUrls, forKey: .businessesCreatedLogoUrls)
        try container.encode(self.businessesWithRecentSalesCount, forKey: .businessesWithRecentSalesCount)
        try container.encode(self.category, forKey: .category)
        try container.encode(self.creator, forKey: .creator)
        try container.encode(self.dashboardPath, forKey: .dashboardPath)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.discoverPath, forKey: .discoverPath)
        try container.encode(self.domainId, forKey: .domainId)
        try container.encode(self.domains, forKey: .domains)
        try container.encode(self.experiencePath, forKey: .experiencePath)
        try container.encode(self.hostedUrl, forKey: .hostedUrl)
        try container.encode(self.icon, forKey: .icon)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.isWhopApp, forKey: .isWhopApp)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.openapiPath, forKey: .openapiPath)
        try container.encode(self.origin, forKey: .origin)
        try container.encode(self.productCategory, forKey: .productCategory)
        try container.encode(self.publishedReviewsCount, forKey: .publishedReviewsCount)
        try container.encode(self.route, forKey: .route)
        try container.encode(self.skillsPath, forKey: .skillsPath)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.verified, forKey: .verified)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case appType = "app_type"
        case averageReviewRating = "average_review_rating"
        case bannerImage = "banner_image"
        case baseUrl = "base_url"
        case businessesCreatedCount = "businesses_created_count"
        case businessesCreatedLogoUrls = "businesses_created_logo_urls"
        case businessesWithRecentSalesCount = "businesses_with_recent_sales_count"
        case category
        case creator
        case dashboardPath = "dashboard_path"
        case description
        case discoverPath = "discover_path"
        case domainId = "domain_id"
        case domains
        case experiencePath = "experience_path"
        case hostedUrl = "hosted_url"
        case icon
        case id
        case isWhopApp = "is_whop_app"
        case name
        case openapiPath = "openapi_path"
        case origin
        case productCategory = "product_category"
        case publishedReviewsCount = "published_reviews_count"
        case route
        case skillsPath = "skills_path"
        case status
        case verified
    }
}