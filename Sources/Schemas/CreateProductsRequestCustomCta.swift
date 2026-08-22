import Foundation

/// The call-to-action button label.
public enum CreateProductsRequestCustomCta: String, Codable, Hashable, CaseIterable, Sendable {
    case getAccess = "get_access"
    case join
    case orderNow = "order_now"
    case shopNow = "shop_now"
    case callNow = "call_now"
    case donateNow = "donate_now"
    case contactUs = "contact_us"
    case signUp = "sign_up"
    case subscribe
    case purchase
    case getOffer = "get_offer"
    case applyNow = "apply_now"
    case completeOrder = "complete_order"
}