import Foundation

/// What the rule asked for.
public enum PaymentRuleMatchAction: String, Codable, Hashable, CaseIterable, Sendable {
    case allow
    case block
    case review
    case enforce3Ds = "enforce_3ds"
}