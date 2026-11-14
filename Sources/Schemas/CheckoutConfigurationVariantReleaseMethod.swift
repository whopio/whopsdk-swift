import Foundation

/// Sales method for the variant.
public enum CheckoutConfigurationVariantReleaseMethod: String, Codable, Hashable, CaseIterable, Sendable {
    case buyNow = "buy_now"
    case waitlist
}