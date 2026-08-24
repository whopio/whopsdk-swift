import Foundation

/// The order to sort the results by.
public enum ReceiptV2Order: String, Codable, Hashable, CaseIterable, Sendable {
    case finalAmount = "final_amount"
    case createdAt = "created_at"
    case paidAt = "paid_at"
}