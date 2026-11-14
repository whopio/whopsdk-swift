import Foundation

/// Where this variant can be seen. `visible` variants appear on the product page.
public enum ProductPublicVariantVisibility: String, Codable, Hashable, CaseIterable, Sendable {
    case visible
    case hidden
    case archived
    case quickLink = "quick_link"
}