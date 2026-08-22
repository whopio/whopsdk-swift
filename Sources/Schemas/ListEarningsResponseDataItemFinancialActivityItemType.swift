import Foundation

/// Whether the line is income Whop collected or a cost Whop paid.
public enum ListEarningsResponseDataItemFinancialActivityItemType: String, Codable, Hashable, CaseIterable, Sendable {
    case income
    case expense
}