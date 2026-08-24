import Foundation

/// The post's call-to-action button, for example shop_now (Facebook only; null for Instagram and TikTok).
public enum SocialAccountPostCallToAction: String, Codable, Hashable, CaseIterable, Sendable {
    case learnMore = "learn_more"
    case shopNow = "shop_now"
    case signUp = "sign_up"
    case subscribe
    case getStarted = "get_started"
    case bookNow = "book_now"
    case applyNow = "apply_now"
    case contactUs = "contact_us"
    case download
    case orderNow = "order_now"
    case buyNow = "buy_now"
    case getQuote = "get_quote"
    case messagePage = "message_page"
    case whatsappMessage = "whatsapp_message"
    case instagramMessage = "instagram_message"
    case callNow = "call_now"
    case getDirections = "get_directions"
    case sendUpdates = "send_updates"
    case getOffer = "get_offer"
    case watchMore = "watch_more"
    case listenNow = "listen_now"
    case playGame = "play_game"
    case openLink = "open_link"
    case noButton = "no_button"
    case getOfferView = "get_offer_view"
    case getEventTickets = "get_event_tickets"
    case seeMenu = "see_menu"
    case requestTime = "request_time"
    case eventRsvp = "event_rsvp"
    case seeDetails = "see_details"
    case viewInstagramProfile = "view_instagram_profile"
}