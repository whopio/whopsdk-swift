import Foundation

/// Card brands blocked at checkout for this account. Empty when none are blocked. The account cannot re-enable them itself.
public enum AccountPaymentControlsRestrictedPaymentMethodsItem: String, Codable, Hashable, CaseIterable, Sendable {
    case cardVisa = "card_visa"
    case cardMastercard = "card_mastercard"
    case cardAmericanExpress = "card_american_express"
    case cardDiscoverGlobalNetwork = "card_discover_global_network"
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
    case scalapay
    case sequra
    case sezzle
    case splitit
    case sunbit
    case tabby
    case tamara
    case zip
    case cardInstallmentsThree = "card_installments_three"
    case cardInstallmentsSix = "card_installments_six"
    case cardInstallmentsTwelve = "card_installments_twelve"
    case oney3X = "oney_3x"
    case oney4X = "oney_4x"
    case klarnaPayNow = "klarna_pay_now"
    case usBankAccount = "us_bank_account"
    case sepaDebit = "sepa_debit"
    case bacsDebit = "bacs_debit"
    case auBecsDebit = "au_becs_debit"
    case acssDebit = "acss_debit"
    case payByBank = "pay_by_bank"
    case payto
    case paypal
    case cashapp
    case venmo
    case amazonPay = "amazon_pay"
    case link
    case wechatPay = "wechat_pay"
}