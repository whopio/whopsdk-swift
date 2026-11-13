import Foundation

/// Sales method for this variant.
public enum PlanListItemReleaseMethod: String, Codable, Hashable, CaseIterable, Sendable {
    case buyNow = "buy_now"
    case waitlist
}