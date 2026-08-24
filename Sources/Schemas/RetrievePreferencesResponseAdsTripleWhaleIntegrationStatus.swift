import Foundation

/// Where the integration stands. `requires_shopify_store` means no Shopify store is connected — Triple Whale keys records by Shopify shop, so no spend is reported until one is.
public enum RetrievePreferencesResponseAdsTripleWhaleIntegrationStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case connected
    case notConnected = "not_connected"
    case requiresShopifyStore = "requires_shopify_store"
}