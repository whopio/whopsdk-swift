import Foundation

public enum ListPaymentsRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case paidAt = "paid_at"
    case amount
}