import Foundation

extension Requests {
    public struct CreateAppsRequest: Codable, Hashable, Sendable {
        /// The account to create the app for (`biz_` tag). Defaults to the account behind the presented credential.
        public let accountId: String?
        /// The type of app to create. Defaults to `b2c_app`.
        public let appType: CreateAppsRequestAppType?
        /// The base production URL where the app is hosted, such as `https://myapp.example.com`.
        public let baseUrl: Nullable<String>?
        /// A domain on the account (`dom_` tag) to serve the app at, such as a whop.site address claimed with `POST /domains`. Required with `template_id`.
        public let domainId: Nullable<String>?
        /// The icon image for the app in PNG, JPEG, or GIF format, referencing an uploaded file: `{ id }` for an existing attachment or `{ direct_upload_id }` for a new direct upload.
        public let icon: CreateAppsRequestIcon?
        /// The address of the existing website this app is imported from, such as `https://shop.example.com`. Must be an `http` or `https` URL.
        public let importedFromUrl: Nullable<String>?
        /// The display name for the app, shown to users on the app store and product pages.
        public let name: String
        /// The whitelisted OAuth callback URLs that users are redirected to after authorizing the app.
        public let redirectUris: [String]?
        /// Deprecated: claim an address with `POST /domains` and pass `domain_id`. The subdomain route where the app's hosted web builds are served, such as `myapp` for myapp.whop.site.
        public let route: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            accountId: String? = nil,
            appType: CreateAppsRequestAppType? = nil,
            baseUrl: Nullable<String>? = nil,
            domainId: Nullable<String>? = nil,
            icon: CreateAppsRequestIcon? = nil,
            importedFromUrl: Nullable<String>? = nil,
            name: String,
            redirectUris: [String]? = nil,
            route: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.accountId = accountId
            self.appType = appType
            self.baseUrl = baseUrl
            self.domainId = domainId
            self.icon = icon
            self.importedFromUrl = importedFromUrl
            self.name = name
            self.redirectUris = redirectUris
            self.route = route
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.accountId = try container.decodeIfPresent(String.self, forKey: .accountId)
            self.appType = try container.decodeIfPresent(CreateAppsRequestAppType.self, forKey: .appType)
            self.baseUrl = try container.decodeNullableIfPresent(String.self, forKey: .baseUrl)
            self.domainId = try container.decodeNullableIfPresent(String.self, forKey: .domainId)
            self.icon = try container.decodeIfPresent(CreateAppsRequestIcon.self, forKey: .icon)
            self.importedFromUrl = try container.decodeNullableIfPresent(String.self, forKey: .importedFromUrl)
            self.name = try container.decode(String.self, forKey: .name)
            self.redirectUris = try container.decodeIfPresent([String].self, forKey: .redirectUris)
            self.route = try container.decodeNullableIfPresent(String.self, forKey: .route)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.accountId, forKey: .accountId)
            try container.encodeIfPresent(self.appType, forKey: .appType)
            try container.encodeNullableIfPresent(self.baseUrl, forKey: .baseUrl)
            try container.encodeNullableIfPresent(self.domainId, forKey: .domainId)
            try container.encodeIfPresent(self.icon, forKey: .icon)
            try container.encodeNullableIfPresent(self.importedFromUrl, forKey: .importedFromUrl)
            try container.encode(self.name, forKey: .name)
            try container.encodeIfPresent(self.redirectUris, forKey: .redirectUris)
            try container.encodeNullableIfPresent(self.route, forKey: .route)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case accountId = "account_id"
            case appType = "app_type"
            case baseUrl = "base_url"
            case domainId = "domain_id"
            case icon
            case importedFromUrl = "imported_from_url"
            case name
            case redirectUris = "redirect_uris"
            case route
        }
    }
}