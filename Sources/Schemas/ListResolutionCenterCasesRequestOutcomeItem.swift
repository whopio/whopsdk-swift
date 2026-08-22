import Foundation

public enum ListResolutionCenterCasesRequestOutcomeItem: String, Codable, Hashable, CaseIterable, Sendable {
    case customerWon = "customer_won"
    case merchantWon = "merchant_won"
    case withdrawn
}