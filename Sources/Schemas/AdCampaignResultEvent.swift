import Foundation

/// The Whop pixel conversion event whose attributed count represents results — the optimization goal, or the highest-volume attributed event for campaigns that budget per ad group. Null when the goal isn't a Whop-attributed event.
public enum AdCampaignResultEvent: String, Codable, Hashable, CaseIterable, Sendable {
    case purchase
    case lead
    case schedule
    case submitApplication = "submit_application"
    case contact
    case completeRegistration = "complete_registration"
    case viewContent = "view_content"
    case addToCart = "add_to_cart"
    case custom
    case messagingConversation = "messaging_conversation"
}