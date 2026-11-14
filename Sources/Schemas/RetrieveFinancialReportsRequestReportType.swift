import Foundation

public enum RetrieveFinancialReportsRequestReportType: String, Codable, Hashable, CaseIterable, Sendable {
    case balanceSummary = "balance_summary"
    case incomeStatement = "income_statement"
    case balanceActivity = "balance_activity"
}