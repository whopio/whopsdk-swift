import Foundation

public enum ListFinancialActivityRequestDirection: String, Codable, Hashable, CaseIterable, Sendable {
    case moneyIn = "money_in"
    case moneyOut = "money_out"
}