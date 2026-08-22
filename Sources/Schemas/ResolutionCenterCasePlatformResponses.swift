import Foundation

/// The types of responses the platform can make to a resolution.
public enum ResolutionCenterCasePlatformResponses: String, Codable, Hashable, CaseIterable, Sendable {
    case requestBuyerInfo = "request_buyer_info"
    case requestMerchantInfo = "request_merchant_info"
    case merchantWins = "merchant_wins"
    case merchantRefund = "merchant_refund"
}