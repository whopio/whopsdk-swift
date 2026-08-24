import Foundation

/// Billing model for this plan.
public enum PlanListItemPlanType: String, Codable, Hashable, CaseIterable, Sendable {
    case renewal
    case oneTime = "one_time"
}