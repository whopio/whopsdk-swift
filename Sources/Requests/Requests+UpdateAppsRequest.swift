import Foundation

extension Requests {
    public struct UpdateAppsRequest: Codable, Hashable, Sendable {
        /// The detailed description shown on the app store's in-depth app view page.
        public let appStoreDescription: String?
        /// The type of end-user the app is built for. Cannot be changed on an app whose type is already `website`.
        public let appType: UpdateAppsRequestAppType?
        /// The base production URL where the app is hosted. Set to `null` to take the app proxy offline.
        public let baseUrl: Nullable<String>?
        /// The URL path for the account dashboard view.
        public let dashboardPath: Nullable<String>?
        /// A short description of the app shown in listings and search results.
        public let description: String?
        /// The URL path for the discover view.
        public let discoverPath: Nullable<String>?
        /// The URL path for the member-facing hub view, such as `/experiences/[experienceId]`.
        public let experiencePath: Nullable<String>?
        /// The icon image for the app in PNG, JPEG, or GIF format, referencing an uploaded file: `{ id }` for an existing attachment or `{ direct_upload_id }` for a new direct upload.
        public let icon: UpdateAppsRequestIcon?
        /// The display name for the app, shown to users on the app store and product pages.
        public let name: String?
        /// How the app authenticates at the OAuth token endpoint.
        public let oauthClientType: UpdateAppsRequestOauthClientType?
        /// The URL path to the app's OpenAPI spec file (requires the ai_chat capability).
        public let openapiPath: Nullable<String>?
        /// The app build (`abld_` tag) to serve as the Android production build, or `null` to unassign it. Same rules as `production_web_build_id`.
        public let productionAndroidBuildId: Nullable<String>?
        /// The app build (`abld_` tag) to serve as the iOS production build, or `null` to unassign it. Same rules as `production_web_build_id`.
        public let productionIosBuildId: Nullable<String>?
        /// The app build (`abld_` tag) to serve as the web production build, or `null` to unassign it. The build must belong to this app, target web, and be in the draft or approved status; a draft build is queued for approval and takes over once approved. Requires the `developer:manage_builds` scope.
        public let productionWebBuildId: Nullable<String>?
        /// The whitelisted OAuth callback URLs users are redirected to after authorizing the app.
        public let redirectUris: [String]?
        /// The OAuth scopes the app requests from users when they install it.
        public let requiredScopes: [String]?
        /// The subdomain route where the app's hosted web builds are served.
        public let route: String?
        /// Secrets to add or overwrite on the app, as an object of string values. Keys not included are left untouched; pass null or an empty string as the value to delete a secret. Encrypted at rest and injected into the app's hosted server runtime.
        public let secrets: [String: JSONValue]?
        /// The URL path to the app's skills directory (requires the ai_chat capability).
        public let skillsPath: Nullable<String>?
        /// Controls whether the app is published on Whop discovery or accessible only through its direct link. Publishing requires a name, icon, and description.
        public let status: UpdateAppsRequestStatus?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            appStoreDescription: String? = nil,
            appType: UpdateAppsRequestAppType? = nil,
            baseUrl: Nullable<String>? = nil,
            dashboardPath: Nullable<String>? = nil,
            description: String? = nil,
            discoverPath: Nullable<String>? = nil,
            experiencePath: Nullable<String>? = nil,
            icon: UpdateAppsRequestIcon? = nil,
            name: String? = nil,
            oauthClientType: UpdateAppsRequestOauthClientType? = nil,
            openapiPath: Nullable<String>? = nil,
            productionAndroidBuildId: Nullable<String>? = nil,
            productionIosBuildId: Nullable<String>? = nil,
            productionWebBuildId: Nullable<String>? = nil,
            redirectUris: [String]? = nil,
            requiredScopes: [String]? = nil,
            route: String? = nil,
            secrets: [String: JSONValue]? = nil,
            skillsPath: Nullable<String>? = nil,
            status: UpdateAppsRequestStatus? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.appStoreDescription = appStoreDescription
            self.appType = appType
            self.baseUrl = baseUrl
            self.dashboardPath = dashboardPath
            self.description = description
            self.discoverPath = discoverPath
            self.experiencePath = experiencePath
            self.icon = icon
            self.name = name
            self.oauthClientType = oauthClientType
            self.openapiPath = openapiPath
            self.productionAndroidBuildId = productionAndroidBuildId
            self.productionIosBuildId = productionIosBuildId
            self.productionWebBuildId = productionWebBuildId
            self.redirectUris = redirectUris
            self.requiredScopes = requiredScopes
            self.route = route
            self.secrets = secrets
            self.skillsPath = skillsPath
            self.status = status
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.appStoreDescription = try container.decodeIfPresent(String.self, forKey: .appStoreDescription)
            self.appType = try container.decodeIfPresent(UpdateAppsRequestAppType.self, forKey: .appType)
            self.baseUrl = try container.decodeNullableIfPresent(String.self, forKey: .baseUrl)
            self.dashboardPath = try container.decodeNullableIfPresent(String.self, forKey: .dashboardPath)
            self.description = try container.decodeIfPresent(String.self, forKey: .description)
            self.discoverPath = try container.decodeNullableIfPresent(String.self, forKey: .discoverPath)
            self.experiencePath = try container.decodeNullableIfPresent(String.self, forKey: .experiencePath)
            self.icon = try container.decodeIfPresent(UpdateAppsRequestIcon.self, forKey: .icon)
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.oauthClientType = try container.decodeIfPresent(UpdateAppsRequestOauthClientType.self, forKey: .oauthClientType)
            self.openapiPath = try container.decodeNullableIfPresent(String.self, forKey: .openapiPath)
            self.productionAndroidBuildId = try container.decodeNullableIfPresent(String.self, forKey: .productionAndroidBuildId)
            self.productionIosBuildId = try container.decodeNullableIfPresent(String.self, forKey: .productionIosBuildId)
            self.productionWebBuildId = try container.decodeNullableIfPresent(String.self, forKey: .productionWebBuildId)
            self.redirectUris = try container.decodeIfPresent([String].self, forKey: .redirectUris)
            self.requiredScopes = try container.decodeIfPresent([String].self, forKey: .requiredScopes)
            self.route = try container.decodeIfPresent(String.self, forKey: .route)
            self.secrets = try container.decodeIfPresent([String: JSONValue].self, forKey: .secrets)
            self.skillsPath = try container.decodeNullableIfPresent(String.self, forKey: .skillsPath)
            self.status = try container.decodeIfPresent(UpdateAppsRequestStatus.self, forKey: .status)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.appStoreDescription, forKey: .appStoreDescription)
            try container.encodeIfPresent(self.appType, forKey: .appType)
            try container.encodeNullableIfPresent(self.baseUrl, forKey: .baseUrl)
            try container.encodeNullableIfPresent(self.dashboardPath, forKey: .dashboardPath)
            try container.encodeIfPresent(self.description, forKey: .description)
            try container.encodeNullableIfPresent(self.discoverPath, forKey: .discoverPath)
            try container.encodeNullableIfPresent(self.experiencePath, forKey: .experiencePath)
            try container.encodeIfPresent(self.icon, forKey: .icon)
            try container.encodeIfPresent(self.name, forKey: .name)
            try container.encodeIfPresent(self.oauthClientType, forKey: .oauthClientType)
            try container.encodeNullableIfPresent(self.openapiPath, forKey: .openapiPath)
            try container.encodeNullableIfPresent(self.productionAndroidBuildId, forKey: .productionAndroidBuildId)
            try container.encodeNullableIfPresent(self.productionIosBuildId, forKey: .productionIosBuildId)
            try container.encodeNullableIfPresent(self.productionWebBuildId, forKey: .productionWebBuildId)
            try container.encodeIfPresent(self.redirectUris, forKey: .redirectUris)
            try container.encodeIfPresent(self.requiredScopes, forKey: .requiredScopes)
            try container.encodeIfPresent(self.route, forKey: .route)
            try container.encodeIfPresent(self.secrets, forKey: .secrets)
            try container.encodeNullableIfPresent(self.skillsPath, forKey: .skillsPath)
            try container.encodeIfPresent(self.status, forKey: .status)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case appStoreDescription = "app_store_description"
            case appType = "app_type"
            case baseUrl = "base_url"
            case dashboardPath = "dashboard_path"
            case description
            case discoverPath = "discover_path"
            case experiencePath = "experience_path"
            case icon
            case name
            case oauthClientType = "oauth_client_type"
            case openapiPath = "openapi_path"
            case productionAndroidBuildId = "production_android_build_id"
            case productionIosBuildId = "production_ios_build_id"
            case productionWebBuildId = "production_web_build_id"
            case redirectUris = "redirect_uris"
            case requiredScopes = "required_scopes"
            case route
            case secrets
            case skillsPath = "skills_path"
            case status
        }
    }
}