import Foundation

public struct AccountRecommendedAction: Codable, Hashable, Sendable {
    /// The recommendation; new values may be added, so handle unknown actions gracefully
    public let action: AccountRecommendedActionAction
    public let blockedCapabilities: [String]
    /// The URL the call-to-action links to
    public let cta: String
    /// Button label
    public let ctaLabel: String
    /// Supporting copy, or empty
    public let description: String
    /// Illustration icon URL, or `null`
    public let iconUrl: Nullable<String>
    /// Estimated impact from 0-100, or `null` when not ranked
    public let impactScore: Nullable<Int>
    /// Why this action was recommended, or `null`
    public let reasoning: Nullable<String>
    /// Always optional — never blocking
    public let status: AccountRecommendedActionStatus
    /// Headline for the recommendation
    public let title: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        action: AccountRecommendedActionAction,
        blockedCapabilities: [String],
        cta: String,
        ctaLabel: String,
        description: String,
        iconUrl: Nullable<String>,
        impactScore: Nullable<Int>,
        reasoning: Nullable<String>,
        status: AccountRecommendedActionStatus,
        title: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.action = action
        self.blockedCapabilities = blockedCapabilities
        self.cta = cta
        self.ctaLabel = ctaLabel
        self.description = description
        self.iconUrl = iconUrl
        self.impactScore = impactScore
        self.reasoning = reasoning
        self.status = status
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.action = try container.decode(AccountRecommendedActionAction.self, forKey: .action)
        self.blockedCapabilities = try container.decode([String].self, forKey: .blockedCapabilities)
        self.cta = try container.decode(String.self, forKey: .cta)
        self.ctaLabel = try container.decode(String.self, forKey: .ctaLabel)
        self.description = try container.decode(String.self, forKey: .description)
        self.iconUrl = try container.decode(Nullable<String>.self, forKey: .iconUrl)
        self.impactScore = try container.decode(Nullable<Int>.self, forKey: .impactScore)
        self.reasoning = try container.decode(Nullable<String>.self, forKey: .reasoning)
        self.status = try container.decode(AccountRecommendedActionStatus.self, forKey: .status)
        self.title = try container.decode(String.self, forKey: .title)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.action, forKey: .action)
        try container.encode(self.blockedCapabilities, forKey: .blockedCapabilities)
        try container.encode(self.cta, forKey: .cta)
        try container.encode(self.ctaLabel, forKey: .ctaLabel)
        try container.encode(self.description, forKey: .description)
        try container.encode(self.iconUrl, forKey: .iconUrl)
        try container.encode(self.impactScore, forKey: .impactScore)
        try container.encode(self.reasoning, forKey: .reasoning)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.title, forKey: .title)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case action
        case blockedCapabilities = "blocked_capabilities"
        case cta
        case ctaLabel = "cta_label"
        case description
        case iconUrl = "icon_url"
        case impactScore = "impact_score"
        case reasoning
        case status
        case title
    }
}