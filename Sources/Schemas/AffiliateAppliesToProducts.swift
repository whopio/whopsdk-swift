import Foundation

/// Whether a rev-share override applies to a single product or all products
public enum AffiliateAppliesToProducts: String, Codable, Hashable, CaseIterable, Sendable {
    case singleProduct = "single_product"
    case allProducts = "all_products"
}