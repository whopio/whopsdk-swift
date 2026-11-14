import Foundation

/// Product visibility. Defaults to hidden.
public enum CreatePaymentsRequestLineItemsItemVariantProductVisibility: String, Codable, Hashable, CaseIterable, Sendable {
    case visible
    case hidden
    case archived
    case quickLink = "quick_link"
}