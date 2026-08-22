import Foundation

/// The different websites you can have social links for
public enum SocialLinkWebsites: String, Codable, Hashable, CaseIterable, Sendable {
    case x
    case instagram
    case facebook
    case tiktok
    case youtube
    case linkedin
    case twitch
    case website
    case custom
}