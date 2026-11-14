import Foundation

/// With `status: executed`, the page where the run's result can be seen when it is not one resource, such as the checkout links list. The recommendation's `result_url` becomes that page on the account's dashboard.
public enum UpdateEconomicIntelligenceRequestResultPage: String, Codable, Hashable, CaseIterable, Sendable {
    case home
    case products
    case ads
    case websites
    case checkoutLinks = "checkout_links"
    case trackingLinks = "tracking_links"
    case promoCodes = "promo_codes"
    case payments
    case customers
    case affiliates
    case analytics
    case storePage = "store_page"
}