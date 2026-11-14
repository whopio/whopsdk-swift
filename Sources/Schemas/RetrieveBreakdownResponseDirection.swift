import Foundation

public enum RetrieveBreakdownResponseDirection: String, Codable, Hashable, CaseIterable, Sendable {
    case moneyIn = "money_in"
    case moneyOut = "money_out"
}