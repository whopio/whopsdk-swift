import Foundation

/// What went wrong. Uses the same vocabulary as `/disputes`.
public enum CreateResolutionCenterCasesRequestReason: String, Codable, Hashable, CaseIterable, Sendable {
    case fraudulent
    case productNotReceived = "product_not_received"
    case notAsDescribed = "not_as_described"
    case productUnacceptable = "product_unacceptable"
    case subscriptionCanceled = "subscription_canceled"
}