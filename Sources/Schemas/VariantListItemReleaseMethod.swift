import Foundation

/// Sales method for this variant.
public enum VariantListItemReleaseMethod: String, Codable, Hashable, CaseIterable, Sendable {
    case buyNow = "buy_now"
    case waitlist
}