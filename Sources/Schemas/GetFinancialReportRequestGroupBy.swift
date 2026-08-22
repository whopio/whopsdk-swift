import Foundation

public enum GetFinancialReportRequestGroupBy: String, Codable, Hashable, CaseIterable, Sendable {
    case day
    case week
    case month
}