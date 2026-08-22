import Foundation

/// The report that was generated, echoing the requested `report_type`.
public enum GetFinancialReportResponseReportType: String, Codable, Hashable, CaseIterable, Sendable {
    case balanceSummary = "balance_summary"
    case incomeStatement = "income_statement"
    case balanceActivity = "balance_activity"
}