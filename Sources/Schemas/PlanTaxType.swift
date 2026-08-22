import Foundation

/// How tax is handled for this plan, including whether tax is included in the price, added at checkout, or not configured.
public enum PlanTaxType: String, Codable, Hashable, CaseIterable, Sendable {
    case inclusive
    case exclusive
    case unspecified
}