import Foundation

public enum RetrieveFinancialReportsRequestGroupBy: String, Codable, Hashable, CaseIterable, Sendable {
    case hour
    case day
    case week
    case month
}