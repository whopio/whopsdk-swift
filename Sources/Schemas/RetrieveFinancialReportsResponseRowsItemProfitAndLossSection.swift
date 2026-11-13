import Foundation

/// Which side of the income statement the category falls on, or `null` when it is not a P&L category.
public enum RetrieveFinancialReportsResponseRowsItemProfitAndLossSection: String, Codable, Hashable, CaseIterable, Sendable {
    case revenue
    case costOfRevenue = "cost_of_revenue"
}