import Foundation

public struct CustomerTrackingPreferences: Codable, Hashable, Sendable {
    /// Accent color, as a `#rrggbb` hex color. Defaults to `#1d4ed8`.
    public let accentColor: String
    /// Whether the public tracking page and guest lookup are available. Defaults to false.
    public let enabled: Bool
    /// Whether to display the business name on the tracking page and Element. Defaults to true.
    public let showBusinessName: Bool
    /// Whether to display the logo on the tracking page and Element. Defaults to true.
    public let showLogo: Bool
    /// Customer support email address.
    public let supportEmail: Nullable<String>
    /// HTTPS customer support URL.
    public let supportUrl: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accentColor: String,
        enabled: Bool,
        showBusinessName: Bool,
        showLogo: Bool,
        supportEmail: Nullable<String>,
        supportUrl: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accentColor = accentColor
        self.enabled = enabled
        self.showBusinessName = showBusinessName
        self.showLogo = showLogo
        self.supportEmail = supportEmail
        self.supportUrl = supportUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accentColor = try container.decode(String.self, forKey: .accentColor)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.showBusinessName = try container.decode(Bool.self, forKey: .showBusinessName)
        self.showLogo = try container.decode(Bool.self, forKey: .showLogo)
        self.supportEmail = try container.decode(Nullable<String>.self, forKey: .supportEmail)
        self.supportUrl = try container.decode(Nullable<String>.self, forKey: .supportUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accentColor, forKey: .accentColor)
        try container.encode(self.enabled, forKey: .enabled)
        try container.encode(self.showBusinessName, forKey: .showBusinessName)
        try container.encode(self.showLogo, forKey: .showLogo)
        try container.encode(self.supportEmail, forKey: .supportEmail)
        try container.encode(self.supportUrl, forKey: .supportUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accentColor = "accent_color"
        case enabled
        case showBusinessName = "show_business_name"
        case showLogo = "show_logo"
        case supportEmail = "support_email"
        case supportUrl = "support_url"
    }
}