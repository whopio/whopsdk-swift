import Foundation

/// The BNPL provider whose dispute rate triggered enforcement. Other payment methods may also lose access.
public enum FinancingAccessChangeProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case klarna
    case splitit
    case afterpayClearpay = "afterpay_clearpay"
    case zip
    case sezzle
}