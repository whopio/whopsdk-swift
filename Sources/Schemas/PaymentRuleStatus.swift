import Foundation

/// Whether the rule is applied to payments. A `deleted` rule is kept so the payments it already decided still name it.
public enum PaymentRuleStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case deleted
}