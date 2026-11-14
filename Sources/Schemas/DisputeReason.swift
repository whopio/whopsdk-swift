import Foundation

/// Why the customer says they are disputing, normalized across processors and card networks. `other` covers a processor reason Whop has not categorized yet.
public enum DisputeReason: String, Codable, Hashable, CaseIterable, Sendable {
    case fraudulent
    case unrecognized
    case declinedAuthorization = "declined_authorization"
    case productNotReceived = "product_not_received"
    case productUnacceptable = "product_unacceptable"
    case subscriptionCanceled = "subscription_canceled"
    case creditNotProcessed = "credit_not_processed"
    case duplicate
    case processingError = "processing_error"
    case documentationRequest = "documentation_request"
    case bankCannotProcess = "bank_cannot_process"
    case other
}