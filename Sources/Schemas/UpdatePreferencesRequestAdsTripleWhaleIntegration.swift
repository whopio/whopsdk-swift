import Foundation

/// Connects or disconnects the Triple Whale integration, or changes the shop it reports to. Requires the `ad_campaign:create` scope on your API key. Connecting requires a `shop_domain` to report spend against.
public struct UpdatePreferencesRequestAdsTripleWhaleIntegration: Codable, Hashable, Sendable {
    /// A Triple Whale Data-In API key with the `Ads: Write` scope, validated against Triple Whale before it is stored. Pass `null` to disconnect. Connecting for the first time backfills the account's existing ad spend. Required unless you are only changing `shop_domain` on an already connected integration, in which case the stored key is reused.
    public let apiKey: Nullable<String>?
    /// The exact shop domain configured in Triple Whale's Settings → Store (for Shopify this is the `.myshopify.com` domain; for a custom sales platform it's whatever domain Triple Whale assigned when the shop was set up there). A leading `https://` and trailing `/` are stripped, and what remains must be a bare hostname with no path or spaces. Validated against Triple Whale — the API key must have access to it — before it is stored. Changing it on a connected integration backfills the account's ad spend onto the new shop. Omit to keep the stored domain; there is no way to clear a stored value, only to overwrite it with a new domain.
    public let shopDomain: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        apiKey: Nullable<String>? = nil,
        shopDomain: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.apiKey = apiKey
        self.shopDomain = shopDomain
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.apiKey = try container.decodeNullableIfPresent(String.self, forKey: .apiKey)
        self.shopDomain = try container.decodeIfPresent(String.self, forKey: .shopDomain)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.apiKey, forKey: .apiKey)
        try container.encodeIfPresent(self.shopDomain, forKey: .shopDomain)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case apiKey = "api_key"
        case shopDomain = "shop_domain"
    }
}