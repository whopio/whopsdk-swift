import Foundation

/// The call-to-action button shown on the ad.
public enum UpdateAdsRequestCallToAction: String, Codable, Hashable, CaseIterable, Sendable {
    case applyNow = "apply_now"
    case bookNow = "book_now"
    case callNow = "call_now"
    case contactUs = "contact_us"
    case donateNow = "donate_now"
    case download
    case getDirections = "get_directions"
    case getOffer = "get_offer"
    case getQuote = "get_quote"
    case learnMore = "learn_more"
    case listenNow = "listen_now"
    case messagePage = "message_page"
    case noButton = "no_button"
    case openLink = "open_link"
    case orderNow = "order_now"
    case requestTime = "request_time"
    case seeDetails = "see_details"
    case seeMenu = "see_menu"
    case seeMore = "see_more"
    case sendUpdates = "send_updates"
    case shopNow = "shop_now"
    case signUp = "sign_up"
    case subscribe
    case visitSite = "visit_site"
    case watchMore = "watch_more"
}