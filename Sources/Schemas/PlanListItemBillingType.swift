import Foundation

/// Billing model for this variant.
public enum PlanListItemBillingType: String, Codable, Hashable, CaseIterable, Sendable {
    case renewal
    case oneTime = "one_time"
}