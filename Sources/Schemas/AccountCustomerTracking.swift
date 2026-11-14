import Foundation

public struct AccountCustomerTracking: Codable, Hashable, Sendable {
    /// Accent color, as a `#rrggbb` hex color.
    public let accentColor: String
    /// The business name shown on its customer tracking page.
    public let businessName: String
    /// `black` or `white`, whichever reads against the accent color.
    public let buttonTextColor: AccountCustomerTrackingButtonTextColor
    /// The account logo image URL, or `null` when it has not uploaded one.
    public let logoUrl: Nullable<String>
    /// Whether to display the business name on the tracking page and Element.
    public let showBusinessName: Bool
    /// Whether to display the logo on the tracking page and Element.
    public let showLogo: Bool
    /// Customer support email address, or `null` when not set.
    public let supportEmail: Nullable<String>
    /// HTTPS customer support URL, or `null` when not set.
    public let supportUrl: Nullable<String>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accentColor: String,
        businessName: String,
        buttonTextColor: AccountCustomerTrackingButtonTextColor,
        logoUrl: Nullable<String>,
        showBusinessName: Bool,
        showLogo: Bool,
        supportEmail: Nullable<String>,
        supportUrl: Nullable<String>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accentColor = accentColor
        self.businessName = businessName
        self.buttonTextColor = buttonTextColor
        self.logoUrl = logoUrl
        self.showBusinessName = showBusinessName
        self.showLogo = showLogo
        self.supportEmail = supportEmail
        self.supportUrl = supportUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accentColor = try container.decode(String.self, forKey: .accentColor)
        self.businessName = try container.decode(String.self, forKey: .businessName)
        self.buttonTextColor = try container.decode(AccountCustomerTrackingButtonTextColor.self, forKey: .buttonTextColor)
        self.logoUrl = try container.decode(Nullable<String>.self, forKey: .logoUrl)
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
        try container.encode(self.businessName, forKey: .businessName)
        try container.encode(self.buttonTextColor, forKey: .buttonTextColor)
        try container.encode(self.logoUrl, forKey: .logoUrl)
        try container.encode(self.showBusinessName, forKey: .showBusinessName)
        try container.encode(self.showLogo, forKey: .showLogo)
        try container.encode(self.supportEmail, forKey: .supportEmail)
        try container.encode(self.supportUrl, forKey: .supportUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accentColor = "accent_color"
        case businessName = "business_name"
        case buttonTextColor = "button_text_color"
        case logoUrl = "logo_url"
        case showBusinessName = "show_business_name"
        case showLogo = "show_logo"
        case supportEmail = "support_email"
        case supportUrl = "support_url"
    }
}