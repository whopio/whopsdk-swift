import Foundation

/// Whether the plan is visible to customers or hidden from public view.
public enum CheckoutConfigurationPlanVisibility: String, Codable, Hashable, CaseIterable, Sendable {
    case visible
    case hidden
    case archived
    case quickLink = "quick_link"
}