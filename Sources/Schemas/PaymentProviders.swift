import Foundation

/// The different payment providers.
public enum PaymentProviders: String, Codable, Hashable, CaseIterable, Sendable {
    case stripe
    case coinbase
    case paypal
    case apple
    case sezzle
    case splitit
    case platformBalance = "platform_balance"
    case multiPsp = "multi_psp"
    case adyen
    case claritypay
    case flexPay = "flex_pay"
    case checkoutDotCom = "checkout_dot_com"
    case airwallex
    case coinflow
    case sequra
    case dlocal
    case masspay
    case braintree
}