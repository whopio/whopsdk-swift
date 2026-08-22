import Foundation

/// Billing model for the plan.
public enum CheckoutConfigurationPlanPlanType: String, Codable, Hashable, CaseIterable, Sendable {
    case renewal
    case oneTime = "one_time"
}