import Foundation

/// Whether the variant is visible to customers.
public enum UpdateInvoicesRequestItemsItemVariantVisibility: String, Codable, Hashable, CaseIterable, Sendable {
    case visible
    case hidden
    case archived
    case quickLink = "quick_link"
}