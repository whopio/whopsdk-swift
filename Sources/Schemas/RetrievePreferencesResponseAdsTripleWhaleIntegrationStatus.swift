import Foundation

/// Where the integration stands. `requires_shop_domain` means no shop domain is configured — set `shop_domain` before spend can be reported.
public enum RetrievePreferencesResponseAdsTripleWhaleIntegrationStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case connected
    case notConnected = "not_connected"
    case requiresShopDomain = "requires_shop_domain"
}