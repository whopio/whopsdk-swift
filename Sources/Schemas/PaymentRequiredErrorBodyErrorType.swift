import Foundation

public enum PaymentRequiredErrorBodyErrorType: String, Codable, Hashable, CaseIterable, Sendable {
    case paymentRequired = "payment_required"
}