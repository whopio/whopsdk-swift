import Foundation

/// The provider whose dispute rate caused this change, or `null` when it was this provider's own rate.
public enum FinancingProviderDetailsSourceProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case klarna
    case splitit
    case afterpayClearpay = "afterpay_clearpay"
    case zip
    case sezzle
}