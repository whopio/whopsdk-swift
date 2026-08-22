import Foundation

/// Types of optimization results tracked from external ad platforms
public enum ResultLabelKeys: String, Codable, Hashable, CaseIterable, Sendable {
    case appInstalls = "app_installs"
    case messagingConversationsStarted = "messaging_conversations_started"
    case postEngagement = "post_engagement"
    case eventResponses = "event_responses"
    case impressions
    case websitePurchases = "website_purchases"
    case landingPageViews = "landing_page_views"
    case leads
    case linkClicks = "link_clicks"
    case qualityCalls = "quality_calls"
    case appointmentsBooked = "appointments_booked"
    case messagingPurchases = "messaging_purchases"
    case pageLikes = "page_likes"
    case instagramProfileVisits = "instagram_profile_visits"
    case reach
    case remindersSet = "reminders_set"
    case newSubscribers = "new_subscribers"
    case videoViews = "video_views"
    case registrations
    case contentViews = "content_views"
    case searches
    case addsToCart = "adds_to_cart"
    case addsToWishlist = "adds_to_wishlist"
    case addsOfPaymentInfo = "adds_of_payment_info"
    case checkoutsInitiated = "checkouts_initiated"
    case websiteSchedules = "website_schedules"
    case websiteSubmitApplications = "website_submit_applications"
    case websiteTrialsStarted = "website_trials_started"
    case websiteSubscriptions = "website_subscriptions"
    case websiteContacts = "website_contacts"
    case websiteDonations = "website_donations"
    case websiteFindLocations = "website_find_locations"
    case websiteProductCustomizations = "website_product_customizations"
    case custom
}