import Foundation

public enum GetFinancialReportRequestReportType: String, Codable, Hashable, CaseIterable, Sendable {
    case balanceSummary = "balance_summary"
    case incomeStatement = "income_statement"
    case balanceActivity = "balance_activity"
}