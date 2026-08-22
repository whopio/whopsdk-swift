import Foundation

/// The different types of payment methods that can be used.
public enum PaymentMethodTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case acssDebit = "acss_debit"
    case addi
    case affirm
    case afterpayClearpay = "afterpay_clearpay"
    case alipay
    case alma
    case amazonPay = "amazon_pay"
    case apple
    case applePay = "apple_pay"
    case auBankTransfer = "au_bank_transfer"
    case auBecsDebit = "au_becs_debit"
    case bacsDebit = "bacs_debit"
    case bancolombia
    case bancontact
    case bankWire = "bank_wire"
    case billie
    case bizum
    case blik
    case boleto
    case breB = "bre_b"
    case caBankTransfer = "ca_bank_transfer"
    case capchasePay = "capchase_pay"
    case card
    case cardInstallmentsThree = "card_installments_three"
    case cardInstallmentsSix = "card_installments_six"
    case cardInstallmentsTwelve = "card_installments_twelve"
    case cashapp
    case claritypay
    case coinbase
    case crypto
    case custom
    case customerBalance = "customer_balance"
    case demoPay = "demo_pay"
    case efecty
    case eps
    case euBankTransfer = "eu_bank_transfer"
    case fpx
    case gbBankTransfer = "gb_bank_transfer"
    case giropay
    case googlePay = "google_pay"
    case gopay
    case grabpay
    case idBankTransfer = "id_bank_transfer"
    case ideal
    case interac
    case kakaoPay = "kakao_pay"
    case klarna
    case klarnaPayNow = "klarna_pay_now"
    case konbini
    case krCard = "kr_card"
    case krMarket = "kr_market"
    case kriya
    case kueski
    case link
    case mbWay = "mb_way"
    case mPesa = "m_pesa"
    case mercadoPago = "mercado_pago"
    case mobilepay
    case modo
    case mondu
    case multibanco
    case naverPay = "naver_pay"
    case nequi
    case netbanking
    case ngBank = "ng_bank"
    case ngBankTransfer = "ng_bank_transfer"
    case ngCard = "ng_card"
    case ngMarket = "ng_market"
    case ngUssd = "ng_ussd"
    case ngWallet = "ng_wallet"
    case nzBankAccount = "nz_bank_account"
    case oxxo
    case p24
    case pagoEfectivo = "pago_efectivo"
    case pse
    case payByBank = "pay_by_bank"
    case payco
    case paynow
    case paypal
    case paypay
    case payto
    case pix
    case platformBalance = "platform_balance"
    case promptpay
    case qris
    case rapipago
    case rechnung
    case revolutPay = "revolut_pay"
    case samsungPay = "samsung_pay"
    case satispay
    case scalapay
    case sencillito
    case sepaDebit = "sepa_debit"
    case sequra
    case servipag
    case sezzle
    case shopPay = "shop_pay"
    case shopeepay
    case sofort
    case southKoreaMarket = "south_korea_market"
    case spei
    case splitit
    case sunbit
    case swish
    case tamara
    case twint
    case upi
    case usBankAccount = "us_bank_account"
    case usBankTransfer = "us_bank_transfer"
    case venmo
    case vipps
    case webpay
    case wechatPay = "wechat_pay"
    case yape
    case zip
    case coinflow
    case unknown
}