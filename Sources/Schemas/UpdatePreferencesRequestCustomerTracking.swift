import Foundation

/// Customer tracking settings for the hosted tracking page and Element, replaced as a whole: fields left out are reset to their defaults. Pass null to clear them, which turns tracking off. Requires the `company:manage_checkout` scope on your API key.
public struct UpdatePreferencesRequestCustomerTracking: Codable, Hashable, Sendable {
    /// Accent color, as a `#rrggbb` hex color. Omitted or null resets to `#1d4ed8`.
    public let accentColor: Nullable<String>?
    /// Turns the public tracking page and guest lookup on. Omitted or null resets to false.
    public let enabled: Nullable<Bool>?
    /// Show the business name on the tracking page and Element. Omitted or null resets to true.
    public let showBusinessName: Nullable<Bool>?
    /// Show the account logo on the tracking page and Element. Omitted or null resets to true.
    public let showLogo: Nullable<Bool>?
    /// Customer support email address.
    public let supportEmail: Nullable<String>?
    /// HTTPS customer support URL.
    public let supportUrl: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accentColor: Nullable<String>? = nil,
        enabled: Nullable<Bool>? = nil,
        showBusinessName: Nullable<Bool>? = nil,
        showLogo: Nullable<Bool>? = nil,
        supportEmail: Nullable<String>? = nil,
        supportUrl: Nullable<String>? = nil,
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
        self.accentColor = try container.decodeNullableIfPresent(String.self, forKey: .accentColor)
        self.enabled = try container.decodeNullableIfPresent(Bool.self, forKey: .enabled)
        self.showBusinessName = try container.decodeNullableIfPresent(Bool.self, forKey: .showBusinessName)
        self.showLogo = try container.decodeNullableIfPresent(Bool.self, forKey: .showLogo)
        self.supportEmail = try container.decodeNullableIfPresent(String.self, forKey: .supportEmail)
        self.supportUrl = try container.decodeNullableIfPresent(String.self, forKey: .supportUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.accentColor, forKey: .accentColor)
        try container.encodeNullableIfPresent(self.enabled, forKey: .enabled)
        try container.encodeNullableIfPresent(self.showBusinessName, forKey: .showBusinessName)
        try container.encodeNullableIfPresent(self.showLogo, forKey: .showLogo)
        try container.encodeNullableIfPresent(self.supportEmail, forKey: .supportEmail)
        try container.encodeNullableIfPresent(self.supportUrl, forKey: .supportUrl)
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