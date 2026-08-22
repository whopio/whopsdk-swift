import Foundation

/// The account's Triple Whale integration, which pushes Whop ad spend to Triple Whale's Data-In API so it reports as a `whop` channel.
public struct RetrievePreferencesResponseAdsTripleWhaleIntegration: Codable, Hashable, Sendable {
    /// The leading characters of the stored Data-In API key, followed by asterisks. The full key is never returned. `null` when no key is stored.
    public let maskedApiKey: Nullable<String>
    /// The connected Shopify store domain spend is reported for, such as `acme.myshopify.com`. `null` when no store is connected.
    public let shopDomain: Nullable<String>
    /// Where the integration stands. `requires_shopify_store` means no Shopify store is connected — Triple Whale keys records by Shopify shop, so no spend is reported until one is.
    public let status: RetrievePreferencesResponseAdsTripleWhaleIntegrationStatus
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        maskedApiKey: Nullable<String>,
        shopDomain: Nullable<String>,
        status: RetrievePreferencesResponseAdsTripleWhaleIntegrationStatus,
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
        self.status = try container.decode(RetrievePreferencesResponseAdsTripleWhaleIntegrationStatus.self, forKey: .status)
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