import Foundation

/// Possible card brands that a payment token can have
public enum CardBrands: String, Codable, Hashable, CaseIterable, Sendable {
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
}