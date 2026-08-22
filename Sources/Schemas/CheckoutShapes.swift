import Foundation

/// The different border-radius styles available for checkout pages.
public enum CheckoutShapes: String, Codable, Hashable, CaseIterable, Sendable {
    case rounded
    case pill
    case rectangular
}