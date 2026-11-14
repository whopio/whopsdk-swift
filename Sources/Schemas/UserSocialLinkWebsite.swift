import Foundation

/// The platform the link points to. `website` is a personal site rather than a social platform.
public enum UserSocialLinkWebsite: String, Codable, Hashable, CaseIterable, Sendable {
    case x
    case instagram
    case facebook
    case tiktok
    case youtube
    case linkedin
    case twitch
    case website
}