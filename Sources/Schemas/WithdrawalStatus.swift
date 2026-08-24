import Foundation

/// The status of a withdrawal request
public enum WithdrawalStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case requested
    case awaitingPayment = "awaiting_payment"
    case inTransit = "in_transit"
    case completed
    case failed
    case canceled
    case denied
}