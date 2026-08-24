import Foundation

public struct App: Codable, Hashable, Sendable {
    /// The account that owns the app.
    public let account: AccountParent
    /// Legacy app API key used to authenticate requests on the app's behalf. `null` when no key exists or the caller lacks the `developer:manage_api_key` permission.
    public let apiKey: Nullable<AppApiKey>
    /// Detailed description shown on the app store's in-depth app page, or `null` when none has been set.
    public let appStoreDescription: Nullable<String>
    /// The type of end-user the app is built for.
    public let appType: AppAppType
    /// Banner image from the app's product listing, or `null` when none is uploaded.
    public let bannerImage: Nullable<AppBannerImage>
    /// The production base URL where the app is hosted. `null` if no base URL is configured, if the caller lacks the `developer:basic:read` permission on the app's account, or on list responses, which never expose it.
    public let baseUrl: Nullable<String>
    /// Website businesses created from this app as a template.
    public let businessesCreatedCount: Int
    public let businessesCreatedLogoUrls: [String]
    /// The user who owns the publishing account.
    public let creator: AppCreator
    /// URL path for the account dashboard view, or `null` when not configured.
    public let dashboardPath: Nullable<String>
    /// The app's default API key. `null` when the app has no default key or the caller lacks the `developer:manage_api_key` permission; `secret_key` is additionally `null` unless the caller could have created the key themselves.
    public let defaultApiKey: Nullable<AppDefaultApiKey>
    /// What the app has left to publish, and how a publish in flight is going — `status` is only ever `unpublished`, `publishing`, or `failed` here. `null` means there is nothing to report: the app is fully published, there is no working copy to publish from, or the caller cannot deploy this app. Tell those apart from the app's own `production_web_build`.
    public let deployment: Nullable<AppDeployment>
    /// Short description shown in listings and search results, or `null` if none has been set.
    public let description: Nullable<String>
    /// URL path for the discover view, or `null` when not configured.
    public let discoverPath: Nullable<String>
    /// Subdomain identifier for the app's proxied URL, forming https://{domain_id}.apps.whop.com.
    public let domainId: String
    /// URL path for the member-facing hub view, or `null` when not configured.
    public let experiencePath: Nullable<String>
    /// Full URL where the app's hosted web build is served, or `null` if no route is claimed.
    public let hostedUrl: Nullable<String>
    /// The app's icon. Falls back to the default app icon when none is uploaded.
    public let icon: AppIcon
    /// App ID, prefixed `app_`.
    public let id: String
    /// Approval status of the app's product listing on the Whop app store, or `null` when the app has no associated product.
    public let marketplaceStatus: Nullable<AppMarketplaceStatus>
    /// Display name shown on the app store and in experience navigation.
    public let name: String
    /// How the app authenticates at the OAuth token endpoint.
    public let oauthClientType: AppOauthClientType
    /// URL path to the app's OpenAPI spec file, or `null` when not configured.
    public let openapiPath: Nullable<String>
    /// Full origin URL of the app's proxied domain, for example https://ab1c2d3e4f.apps.whop.com.
    public let origin: Nullable<String>
    /// ID of the app's product listing on the Whop app store, or `null` when the app has no associated product.
    public let productId: Nullable<String>
    /// The approved build currently served on Android, or `null` when none is deployed.
    public let productionAndroidBuild: Nullable<AppProductionBuild>
    /// The approved build currently served on iOS, or `null` when none is deployed.
    public let productionIosBuild: Nullable<AppProductionBuild>
    /// The approved build currently served on web, or `null` when none is deployed.
    public let productionWebBuild: Nullable<AppProductionBuild>
    public let redirectUris: [String]
    public let requestedPermissions: [AppRequestedPermission]
    public let requiredScopes: [AppRequiredScopesItem]
    /// Claimed subdomain route where hosted web builds are served (`myapp` for myapp.whop.app), or `null` if no route is claimed.
    public let route: Nullable<String>
    /// The app's production secrets as an object of string values, injected into the hosted server runtime. `null` when the caller lacks the `developer:update_app` permission.
    public let secrets: Nullable<[String: JSONValue]>
    /// URL path to the app's skills directory, or `null` when not configured.
    public let skillsPath: Nullable<String>
    /// Visibility on the Whop app store: `live` is publicly discoverable, `unlisted` is accessible only via direct link, `hidden` is not visible anywhere.
    public let status: AppStatus
    /// Whether the app has been verified by Whop and is eligible for the featured apps section.
    public let verified: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        account: AccountParent,
        apiKey: Nullable<AppApiKey>,
        appStoreDescription: Nullable<String>,
        appType: AppAppType,
        bannerImage: Nullable<AppBannerImage>,
        baseUrl: Nullable<String>,
        businessesCreatedCount: Int,
        businessesCreatedLogoUrls: [String],
        creator: AppCreator,
        dashboardPath: Nullable<String>,
        defaultApiKey: Nullable<AppDefaultApiKey>,
        deployment: Nullable<AppDeployment>,
        description: Nullable<String>,
        discoverPath: Nullable<String>,
        domainId: String,
        experiencePath: Nullable<String>,
        hostedUrl: Nullable<String>,
        icon: AppIcon,
        id: String,
        marketplaceStatus: Nullable<AppMarketplaceStatus>,
        name: String,
        oauthClientType: AppOauthClientType,
        openapiPath: Nullable<String>,
        origin: Nullable<String>,
        productId: Nullable<String>,
        productionAndroidBuild: Nullable<AppProductionBuild>,
        productionIosBuild: Nullable<AppProductionBuild>,
        productionWebBuild: Nullable<AppProductionBuild>,
        redirectUris: [String],
        requestedPermissions: [AppRequestedPermission],
        requiredScopes: [AppRequiredScopesItem],
        route: Nullable<String>,
        secrets: Nullable<[String: JSONValue]>,
        skillsPath: Nullable<String>,
        status: AppStatus,
        verified: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.account = account
        self.apiKey = apiKey
        self.appStoreDescription = appStoreDescription
        self.appType = appType
        self.bannerImage = bannerImage
        self.baseUrl = baseUrl
        self.businessesCreatedCount = businessesCreatedCount
        self.businessesCreatedLogoUrls = businessesCreatedLogoUrls
        self.creator = creator
        self.dashboardPath = dashboardPath
        self.defaultApiKey = defaultApiKey
        self.deployment = deployment
        self.description = description
        self.discoverPath = discoverPath
        self.domainId = domainId
        self.experiencePath = experiencePath
        self.hostedUrl = hostedUrl
        self.icon = icon
        self.id = id
        self.marketplaceStatus = marketplaceStatus
        self.name = name
        self.oauthClientType = oauthClientType
        self.openapiPath = openapiPath
        self.origin = origin
        self.productId = productId
        self.productionAndroidBuild = productionAndroidBuild
        self.productionIosBuild = productionIosBuild
        self.productionWebBuild = productionWebBuild
        self.redirectUris = redirectUris
        self.requestedPermissions = requestedPermissions
        self.requiredScopes = requiredScopes
        self.route = route
        self.secrets = secrets
        self.skillsPath = skillsPath
        self.status = status
        self.verified = verified
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.account = try container.decode(AccountParent.self, forKey: .account)
        self.apiKey = try container.decode(Nullable<AppApiKey>.self, forKey: .apiKey)
        self.appStoreDescription = try container.decode(Nullable<String>.self, forKey: .appStoreDescription)
        self.appType = try container.decode(AppAppType.self, forKey: .appType)
        self.bannerImage = try container.decode(Nullable<AppBannerImage>.self, forKey: .bannerImage)
        self.baseUrl = try container.decode(Nullable<String>.self, forKey: .baseUrl)
        self.businessesCreatedCount = try container.decode(Int.self, forKey: .businessesCreatedCount)
        self.businessesCreatedLogoUrls = try container.decode([String].self, forKey: .businessesCreatedLogoUrls)
        self.creator = try container.decode(AppCreator.self, forKey: .creator)
        self.dashboardPath = try container.decode(Nullable<String>.self, forKey: .dashboardPath)
        self.defaultApiKey = try container.decode(Nullable<AppDefaultApiKey>.self, forKey: .defaultApiKey)
        self.deployment = try container.decode(Nullable<AppDeployment>.self, forKey: .deployment)
        self.description = try container.decode(Nullable<String>.self, forKey: .description)
        self.discoverPath = try container.decode(Nullable<String>.self, forKey: .discoverPath)
        self.domainId = try container.decode(String.self, forKey: .domainId)
        self.experiencePath = try container.decode(Nullable<String>.self, forKey: .experiencePath)
        self.hostedUrl = try container.decode(Nullable<String>.self, forKey: .hostedUrl)
        self.icon = try container.decode(AppIcon.self, forKey: .icon)
        self.id = try container.decode(String.self, forKey: .id)
        self.marketplaceStatus = try container.decode(Nullable<AppMarketplaceStatus>.self, forKey: .marketplaceStatus)
        self.name = try container.decode(String.self, forKey: .name)
        self.oauthClientType = try container.decode(AppOauthClientType.self, forKey: .oauthClientType)
        self.openapiPath = try container.decode(Nullable<String>.self, forKey: .openapiPath)
        self.origin = try container.decode(Nullable<String>.self, forKey: .origin)
        self.productId = try container.decode(Nullable<String>.self, forKey: .productId)
        self.productionAndroidBuild = try container.decode(Nullable<AppProductionBuild>.self, forKey: .productionAndroidBuild)
        self.productionIosBuild = try container.decode(Nullable<AppProductionBuild>.self, forKey: .productionIosBuild)
        self.productionWebBuild = try container.decode(Nullable<AppProductionBuild>.self, forKey: .productionWebBuild)
        self.redirectUris = try container.decode([String].self, forKey: .redirectUris)
        self.requestedPermissions = try container.decode([AppRequestedPermission].self, forKey: .requestedPermissions)
        self.requiredScopes = try container.decode([AppRequiredScopesItem].self, forKey: .requiredScopes)
        self.route = try container.decode(Nullable<String>.self, forKey: .route)
        self.secrets = try container.decode(Nullable<[String: JSONValue]>.self, forKey: .secrets)
        self.skillsPath = try container.decode(Nullable<String>.self, forKey: .skillsPath)
        self.status = try container.decode(AppStatus.self, forKey: .status)
        self.verified = try container.decode(Bool.self, forKey: .verified)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.account, forKey: .account)
        try container.encode(self.apiKey, forKey: .apiKey)
        try container.encode(self.appStoreDescription, forKey: .appStoreDescription)
        try container.encode(self.appType, forKey: .appType)
        try container.encode(self.bannerImage, forKey: .bannerImage)
        try container.encode(self.baseUrl, forKey: .baseUrl)
        try container.encode(self.businessesCreatedCount, forKey: .businessesCreatedCount)
        try container.encode(self.businessesCreatedLogoUrls, forKey: .businessesCreatedLogoUrls)
        try container.encode(self.creator, forKey: .creator)
        try container.encode(self.dashboardPath, forKey: .dashboardPath)
        try container.encode(self.defaultApiKey, forKey: .defaultApiKey)
        try container.encode(self.deployment, forKey: .deployment)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.discoverPath, forKey: .discoverPath)
        try container.encode(self.domainId, forKey: .domainId)
        try container.encode(self.experiencePath, forKey: .experiencePath)
        try container.encode(self.hostedUrl, forKey: .hostedUrl)
        try container.encode(self.icon, forKey: .icon)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.marketplaceStatus, forKey: .marketplaceStatus)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.oauthClientType, forKey: .oauthClientType)
        try container.encode(self.openapiPath, forKey: .openapiPath)
        try container.encode(self.origin, forKey: .origin)
        try container.encode(self.productId, forKey: .productId)
        try container.encode(self.productionAndroidBuild, forKey: .productionAndroidBuild)
        try container.encode(self.productionIosBuild, forKey: .productionIosBuild)
        try container.encode(self.productionWebBuild, forKey: .productionWebBuild)
        try container.encode(self.redirectUris, forKey: .redirectUris)
        try container.encode(self.requestedPermissions, forKey: .requestedPermissions)
        try container.encode(self.requiredScopes, forKey: .requiredScopes)
        try container.encode(self.route, forKey: .route)
        try container.encode(self.secrets, forKey: .secrets)
        try container.encode(self.skillsPath, forKey: .skillsPath)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.verified, forKey: .verified)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case account
        case apiKey = "api_key"
        case appStoreDescription = "app_store_description"
        case appType = "app_type"
        case bannerImage = "banner_image"
        case baseUrl = "base_url"
        case businessesCreatedCount = "businesses_created_count"
        case businessesCreatedLogoUrls = "businesses_created_logo_urls"
        case creator
        case dashboardPath = "dashboard_path"
        case defaultApiKey = "default_api_key"
        case deployment
        case description
        case discoverPath = "discover_path"
        case domainId = "domain_id"
        case experiencePath = "experience_path"
        case hostedUrl = "hosted_url"
        case icon
        case id
        case marketplaceStatus = "marketplace_status"
        case name
        case oauthClientType = "oauth_client_type"
        case openapiPath = "openapi_path"
        case origin
        case productId = "product_id"
        case productionAndroidBuild = "production_android_build"
        case productionIosBuild = "production_ios_build"
        case productionWebBuild = "production_web_build"
        case redirectUris = "redirect_uris"
        case requestedPermissions = "requested_permissions"
        case requiredScopes = "required_scopes"
        case route
        case secrets
        case skillsPath = "skills_path"
        case status
        case verified
    }
}