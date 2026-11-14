import Foundation

/// Whether the variant is visible to customers or hidden from public view.
public enum CreateCheckoutConfigurationsResponseVariantVisibility: String, Codable, Hashable, CaseIterable, Sendable {
    case visible
    case hidden
    case archived
    case quickLink = "quick_link"
}