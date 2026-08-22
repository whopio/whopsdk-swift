import Foundation

/// Sales method for the plan.
public enum CreateCheckoutConfigurationsRequestPlanReleaseMethod: String, Codable, Hashable, CaseIterable, Sendable {
    case buyNow = "buy_now"
    case waitlist
}