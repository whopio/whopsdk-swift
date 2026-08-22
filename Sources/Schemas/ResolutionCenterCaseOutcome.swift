import Foundation

/// Who prevailed on the claim. `null` until the case closes. Read `refund` for whether any money actually moved.
public enum ResolutionCenterCaseOutcome: String, Codable, Hashable, CaseIterable, Sendable {
    case customerWon = "customer_won"
    case merchantWon = "merchant_won"
    case withdrawn
}