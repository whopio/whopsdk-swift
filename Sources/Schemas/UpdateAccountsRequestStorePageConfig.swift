import Foundation

/// Account store page display configuration.
public struct UpdateAccountsRequestStorePageConfig: Codable, Hashable, Sendable {
    /// Accent color used on the account store page.
    public let accentColor: Nullable<UpdateAccountsRequestStorePageConfigAccentColor>?
    /// Layout used on the account store page.
    public let layout: Nullable<UpdateAccountsRequestStorePageConfigLayout>?
    /// Profile presentation used on the account store page.
    public let profileVariant: Nullable<UpdateAccountsRequestStorePageConfigProfileVariant>?
    /// Whether the account store page shows a Whop affiliate link.
    public let whopAffiliateLink: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accentColor: Nullable<UpdateAccountsRequestStorePageConfigAccentColor>? = nil,
        layout: Nullable<UpdateAccountsRequestStorePageConfigLayout>? = nil,
        profileVariant: Nullable<UpdateAccountsRequestStorePageConfigProfileVariant>? = nil,
        whopAffiliateLink: Bool? = nil,
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
        self.accentColor = try container.decodeNullableIfPresent(UpdateAccountsRequestStorePageConfigAccentColor.self, forKey: .accentColor)
        self.layout = try container.decodeNullableIfPresent(UpdateAccountsRequestStorePageConfigLayout.self, forKey: .layout)
        self.profileVariant = try container.decodeNullableIfPresent(UpdateAccountsRequestStorePageConfigProfileVariant.self, forKey: .profileVariant)
        self.whopAffiliateLink = try container.decodeIfPresent(Bool.self, forKey: .whopAffiliateLink)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.accentColor, forKey: .accentColor)
        try container.encodeNullableIfPresent(self.layout, forKey: .layout)
        try container.encodeNullableIfPresent(self.profileVariant, forKey: .profileVariant)
        try container.encodeIfPresent(self.whopAffiliateLink, forKey: .whopAffiliateLink)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accentColor = "accent_color"
        case layout
        case profileVariant = "profile_variant"
        case whopAffiliateLink = "whop_affiliate_link"
    }
}