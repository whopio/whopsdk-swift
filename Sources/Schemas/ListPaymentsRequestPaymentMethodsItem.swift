import Foundation

public enum ListPaymentsRequestPaymentMethodsItem: String, Codable, Hashable, CaseIterable, Sendable {
    case mastercard
    case visa
    case amex
    case discover
    case unionpay
    case jcb
    case diners
    case link
    case troy
    case visadankort
    case visabancontact
    case chinaUnionPay = "china_union_pay"
    case rupay
    case jcbrupay
    case elo
    case maestro
    case tarjetaNaranja = "tarjeta_naranja"
    case cirrus
    case nspkMir = "nspk_mir"
    case verve
    case ebt
    case privateLabel = "private_label"
    case localBrand = "local_brand"
    case uatp
    case wexcard
    case uzcard
    case meeza
    case hrgStoreCard = "hrg_store_card"
    case girocard
    case fuelCard = "fuel_card"
    case dankort
    case carnet
    case atmCard = "atm_card"
    case chinaUnionPayuzcard = "china_union_payuzcard"
    case codensa
    case cabal
    case hipercard
    case jcblankapay
    case cmi
    case aura
    case accel
    case culiance
    case nyce
    case pulse
    case star
    case eftpos
    case alelo
    case edenred
    case sodexo
    case unknown
    case acssDebit = "acss_debit"
    case addi
    case affirm
    case afterpayClearpay = "afterpay_clearpay"
    case alipay
    case alipayhk
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
    case blik
    case boleto
    case breB = "bre_b"
    case caBankTransfer = "ca_bank_transfer"
    case capchasePay = "capchase_pay"
    case card
    case cardPresent = "card_present"
    case cardInstallmentsThree = "card_installments_three"
    case cardInstallmentsSix = "card_installments_six"
    case cardInstallmentsTwelve = "card_installments_twelve"
    case cashapp
    case claritypay
    case coinbase
    case crypto
    case cryptoSubscription = "crypto_subscription"
    case custom
    case customerBalance = "customer_balance"
    case demoPay = "demo_pay"
    case duitnowQr = "duitnow_qr"
    case efecty
    case eps
    case euBankTransfer = "eu_bank_transfer"
    case fpx
    case flexPay = "flex_pay"
    case gbBankTransfer = "gb_bank_transfer"
    case gcash
    case giropay
    case googlePay = "google_pay"
    case gopay
    case grabpay
    case idBankTransfer = "id_bank_transfer"
    case ideal
    case interac
    case internationalBankWire = "international_bank_wire"
    case kakaoPay = "kakao_pay"
    case klarna
    case klarnaPayNow = "klarna_pay_now"
    case konbini
    case krCard = "kr_card"
    case krMarket = "kr_market"
    case kriya
    case kueski
    case mbWay = "mb_way"
    case mPesa = "m_pesa"
    case mercadoPago = "mercado_pago"
    case mercadoPagoAr = "mercado_pago_ar"
    case mercadoPagoMx = "mercado_pago_mx"
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
    case nupay
    case nzBankAccount = "nz_bank_account"
    case oney
    case oney3X = "oney_3x"
    case oney4X = "oney_4x"
    case opay
    case oxxo
    case p24
    case pagoEfectivo = "pago_efectivo"
    case pse
    case payByBank = "pay_by_bank"
    case payco
    case paynow
    case paypal
    case paypalExpress = "paypal_express"
    case paypay
    case payto
    case paytoEmail = "payto_email"
    case paytoPhone = "payto_phone"
    case paytoBankAccount = "payto_bank_account"
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
    case tabby
    case tamara
    case touchNGo = "touch_n_go"
    case twint
    case upi
    case usBankAccount = "us_bank_account"
    case usBankTransfer = "us_bank_transfer"
    case venmo
    case vipps
    case webpay
    case wechatPay = "wechat_pay"
    case whopPay = "whop_pay"
    case yape
    case zip
    case coinflow
    case tapToPay = "tap_to_pay"
}