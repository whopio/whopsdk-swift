import Foundation

public struct AccountRequiredAction: Codable, Hashable, Sendable {
    /// What the holder must do; new values may be added, so handle unknown actions gracefully
    public let action: AccountRequiredActionAction
    public let blockedCapabilities: [String]
    /// The URL the call-to-action links to, or null when there is no button
    public let cta: Nullable<String>
    /// Button label, or empty when there is no button
    public let ctaLabel: String
    /// Supporting copy, or empty
    public let description: String
    /// The URL of the action's illustration icon, or null if it has none
    public let iconUrl: Nullable<String>
    /// required (act now) or pending (under review)
    public let status: AccountRequiredActionStatus
    /// Headline for the action
    public let title: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        action: AccountRequiredActionAction,
        blockedCapabilities: [String],
        cta: Nullable<String>,
        ctaLabel: String,
        description: String,
        iconUrl: Nullable<String>,
        status: AccountRequiredActionStatus,
        title: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.action = action
        self.blockedCapabilities = blockedCapabilities
        self.cta = cta
        self.ctaLabel = ctaLabel
        self.description = description
        self.iconUrl = iconUrl
        self.status = status
        self.title = title
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.action = try container.decode(AccountRequiredActionAction.self, forKey: .action)
        self.blockedCapabilities = try container.decode([String].self, forKey: .blockedCapabilities)
        self.cta = try container.decode(Nullable<String>.self, forKey: .cta)
        self.ctaLabel = try container.decode(String.self, forKey: .ctaLabel)
        self.description = try container.decode(String.self, forKey: .description)
        self.iconUrl = try container.decode(Nullable<String>.self, forKey: .iconUrl)
        self.status = try container.decode(AccountRequiredActionStatus.self, forKey: .status)
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
        case status
        case title
    }
}