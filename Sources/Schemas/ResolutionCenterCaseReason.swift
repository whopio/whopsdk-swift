import Foundation

/// What the customer says went wrong. Shares the `/disputes` vocabulary, so a case that later becomes a chargeback reports the same complaint.
public enum ResolutionCenterCaseReason: String, Codable, Hashable, CaseIterable, Sendable {
    case fraudulent
    case productNotReceived = "product_not_received"
    case notAsDescribed = "not_as_described"
    case productUnacceptable = "product_unacceptable"
    case subscriptionCanceled = "subscription_canceled"
}