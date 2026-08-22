import Foundation

/// Referred account.
public struct RetrieveBusinessesResponseAccount: Codable, Hashable, Sendable {
    public let capabilities: AccountCapabilities
    /// Referred account ID.
    public let id: String
    /// Referred account logo URL.
    public let logoUrl: Nullable<String>
    /// Optional actions that unlock capabilities or grow the referred account.
    public let recommendedActions: Nullable<[AccountRecommendedAction]>
    /// Actions the referred account owner must take to unblock capabilities.
    public let requiredActions: Nullable<[AccountRequiredAction]>
    /// Referred account route.
    public let route: String
    /// Referred account display name.
    public let title: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        capabilities: AccountCapabilities,
        id: String,
        logoUrl: Nullable<String>,
        recommendedActions: Nullable<[AccountRecommendedAction]>,
        requiredActions: Nullable<[AccountRequiredAction]>,
        route: String,
        title: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.capabilities = capabilities
        self.id = id
        self.logoUrl = logoUrl
        self.recommendedActions = recommendedActions
        self.requiredActions = requiredActions
        self.route = route
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.capabilities = try container.decode(AccountCapabilities.self, forKey: .capabilities)
        self.id = try container.decode(String.self, forKey: .id)
        self.logoUrl = try container.decode(Nullable<String>.self, forKey: .logoUrl)
        self.recommendedActions = try container.decode(Nullable<[AccountRecommendedAction]>.self, forKey: .recommendedActions)
        self.requiredActions = try container.decode(Nullable<[AccountRequiredAction]>.self, forKey: .requiredActions)
        self.route = try container.decode(String.self, forKey: .route)
        self.title = try container.decode(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.capabilities, forKey: .capabilities)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.logoUrl, forKey: .logoUrl)
        try container.encode(self.recommendedActions, forKey: .recommendedActions)
        try container.encode(self.requiredActions, forKey: .requiredActions)
        try container.encode(self.route, forKey: .route)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case capabilities
        case id
        case logoUrl = "logo_url"
        case recommendedActions = "recommended_actions"
        case requiredActions = "required_actions"
        case route
        case title
    }
}