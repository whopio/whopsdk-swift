import Foundation

/// BNPL payment methods disabled on this account.
public enum FinancingAccessChangeDisabledPaymentMethodsItem: String, Codable, Hashable, CaseIterable, Sendable {
    case addi
    case affirm
    case afterpayClearpay = "afterpay_clearpay"
    case alma
    case billie
    case capchasePay = "capchase_pay"
    case claritypay
    case flexPay = "flex_pay"
    case klarna
    case kriya
    case kueski
    case mondu
    case oney
    case oney3X = "oney_3x"
    case oney4X = "oney_4x"
    case scalapay
    case sequra
    case sezzle
    case splitit
    case sunbit
    case tabby
    case tamara
    case zip
}