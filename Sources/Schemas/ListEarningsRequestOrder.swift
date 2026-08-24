import Foundation

public enum ListEarningsRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case commissionAmount = "commission_amount"
    case transactionAmount = "transaction_amount"
    case payoutAt = "payout_at"
}