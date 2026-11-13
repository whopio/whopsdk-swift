import Foundation

public enum ListPaymentRulesRequestAction: String, Codable, Hashable, CaseIterable, Sendable {
    case allow
    case block
    case review
    case enforce3Ds = "enforce_3ds"
}