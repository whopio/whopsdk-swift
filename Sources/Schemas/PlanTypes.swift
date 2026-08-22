import Foundation

/// The type of plan that can be attached to a product
public enum PlanTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case renewal
    case oneTime = "one_time"
}