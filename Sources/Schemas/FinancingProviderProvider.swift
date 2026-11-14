import Foundation

/// The financing provider.
public enum FinancingProviderProvider: String, Codable, Hashable, CaseIterable, Sendable {
    case afterpayClearpay = "afterpay_clearpay"
    case zip
    case sezzle
    case tabby
    case tamara
    case kueski
    case addi
    case klarna
    case oney
    case splitit
    case claritypay
    case flexPay = "flex_pay"
}