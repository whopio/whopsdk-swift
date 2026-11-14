import Foundation

/// The account's Triple Whale integration, which pushes Whop ad spend to Triple Whale's Data-In API so it reports as a `whop` channel. Available to any Triple Whale customer — Shopify, WooCommerce, or a custom checkout — by setting `shop_domain`. Requires the `ad_campaign:create` scope. Once connected, ad click-through URLs Whop serves carry `tw_source=whop` and `tw_adid=<ad id>` query parameters so Triple Whale's pixel attributes conversions back to the originating ad — no destination URL changes are needed.
public struct UpdatePreferencesResponseAdsTripleWhaleIntegration: Codable, Hashable, Sendable {
    /// The leading characters of the stored Data-In API key, followed by asterisks. The full key is never returned. `null` when no key is stored.
    public let maskedApiKey: Nullable<String>
    /// The shop domain spend is reported for, such as `acme.myshopify.com` or a custom domain for a non-Shopify store. `null` when none is set.
    public let shopDomain: Nullable<String>
    /// Where the integration stands. `requires_shop_domain` means no shop domain is configured — set `shop_domain` before spend can be reported.
    public let status: UpdatePreferencesResponseAdsTripleWhaleIntegrationStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        maskedApiKey: Nullable<String>,
        shopDomain: Nullable<String>,
        status: UpdatePreferencesResponseAdsTripleWhaleIntegrationStatus,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.maskedApiKey = maskedApiKey
        self.shopDomain = shopDomain
        self.status = status
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.maskedApiKey = try container.decode(Nullable<String>.self, forKey: .maskedApiKey)
        self.shopDomain = try container.decode(Nullable<String>.self, forKey: .shopDomain)
        self.status = try container.decode(UpdatePreferencesResponseAdsTripleWhaleIntegrationStatus.self, forKey: .status)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.maskedApiKey, forKey: .maskedApiKey)
        try container.encode(self.shopDomain, forKey: .shopDomain)
        try container.encode(self.status, forKey: .status)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case maskedApiKey = "masked_api_key"
        case shopDomain = "shop_domain"
        case status
    }
}