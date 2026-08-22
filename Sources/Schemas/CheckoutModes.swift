import Foundation

/// The different modes a checkout can be set to.
public enum CheckoutModes: String, Codable, Hashable, CaseIterable, Sendable {
    case payment
    case setup
}