import Foundation

/// Sales method for the plan.
public enum CheckoutConfigurationPlanReleaseMethod: String, Codable, Hashable, CaseIterable, Sendable {
    case buyNow = "buy_now"
    case waitlist
}