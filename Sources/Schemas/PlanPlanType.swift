import Foundation

/// Billing model for this plan.
public enum PlanPlanType: String, Codable, Hashable, CaseIterable, Sendable {
    case renewal
    case oneTime = "one_time"
}