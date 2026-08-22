import Foundation

/// Where the outcome being optimized for occurs, such as a website visit, social-profile visit, messaging conversation, ad interaction, or lead-form submission. The lead form itself is set on the ad.
public enum CreateAdGroupsRequestConversionLocation: String, Codable, Hashable, CaseIterable, Sendable {
    case website
    case profile
    case instagramAndFacebook = "instagram_and_facebook"
    case instagramProfile = "instagram_profile"
    case messaging
    case onAd = "on_ad"
    case instantForms = "instant_forms"
    case instantFormsAndMessenger = "instant_forms_and_messenger"
    case websiteAndInstantForms = "website_and_instant_forms"
}