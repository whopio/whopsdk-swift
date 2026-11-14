import Foundation

/// The webhook event type
public enum PostFinancialActivityFundsAvailablePayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case financialActivityFundsAvailable = "financial_activity.funds_available"
}