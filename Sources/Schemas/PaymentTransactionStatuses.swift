import Foundation

/// The different statuses a payment transaction can be in.
public enum PaymentTransactionStatuses: String, Codable, Hashable, CaseIterable, Sendable {
    case succeeded
    case declined
    case error
    case pending
    case created
    case expired
    case won
    case rejected
    case lost
    case prevented
    case canceled
}