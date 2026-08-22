import Foundation

public struct AccountStorePageConfig: Codable, Hashable, Sendable {
    /// Accent color used on the account store page.
    public let accentColor: Nullable<AccountStorePageConfigAccentColor>
    /// Layout used on the account store page.
    public let layout: Nullable<AccountStorePageConfigLayout>
    /// Profile presentation used on the account store page.
    public let profileVariant: Nullable<AccountStorePageConfigProfileVariant>
    /// Whether the account store page shows a Whop affiliate link.
    public let whopAffiliateLink: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accentColor: Nullable<AccountStorePageConfigAccentColor>,
        layout: Nullable<AccountStorePageConfigLayout>,
        profileVariant: Nullable<AccountStorePageConfigProfileVariant>,
        whopAffiliateLink: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accentColor = accentColor
        self.layout = layout
        self.profileVariant = profileVariant
        self.whopAffiliateLink = whopAffiliateLink
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accentColor = try container.decode(Nullable<AccountStorePageConfigAccentColor>.self, forKey: .accentColor)
        self.layout = try container.decode(Nullable<AccountStorePageConfigLayout>.self, forKey: .layout)
        self.profileVariant = try container.decode(Nullable<AccountStorePageConfigProfileVariant>.self, forKey: .profileVariant)
        self.whopAffiliateLink = try container.decode(Bool.self, forKey: .whopAffiliateLink)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.accentColor, forKey: .accentColor)
        try container.encode(self.layout, forKey: .layout)
        try container.encode(self.profileVariant, forKey: .profileVariant)
        try container.encode(self.whopAffiliateLink, forKey: .whopAffiliateLink)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accentColor = "accent_color"
        case layout
        case profileVariant = "profile_variant"
        case whopAffiliateLink = "whop_affiliate_link"
    }
}