import Foundation

/// The platform the social account exists on.
public enum SocialAccountPlatform: String, Codable, Hashable, CaseIterable, Sendable {
    case x
    case instagram
    case youtube
    case tiktok
    case facebook
    case discord
    case telegram
    case linkedin
    case snapchat
    case klaviyo
    case quickbooks
    case aimerce
}