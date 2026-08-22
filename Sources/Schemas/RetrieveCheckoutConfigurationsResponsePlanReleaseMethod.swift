import Foundation

/// Sales method for the plan.
public enum RetrieveCheckoutConfigurationsResponsePlanReleaseMethod: String, Codable, Hashable, CaseIterable, Sendable {
    case buyNow = "buy_now"
    case waitlist
}