import Foundation

public enum RetrieveBreakdownRequestDirection: String, Codable, Hashable, CaseIterable, Sendable {
    case moneyIn = "money_in"
    case moneyOut = "money_out"
}