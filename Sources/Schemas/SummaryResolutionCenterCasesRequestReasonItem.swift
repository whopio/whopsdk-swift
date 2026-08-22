import Foundation

public enum SummaryResolutionCenterCasesRequestReasonItem: String, Codable, Hashable, CaseIterable, Sendable {
    case fraudulent
    case productNotReceived = "product_not_received"
    case notAsDescribed = "not_as_described"
    case productUnacceptable = "product_unacceptable"
    case subscriptionCanceled = "subscription_canceled"
}