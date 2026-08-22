import Foundation

/// The social platform for this link
public enum AccountSocialLinkWebsite: String, Codable, Hashable, CaseIterable, Sendable {
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