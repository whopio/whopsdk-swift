import Foundation

/// The platform the external account exists on.
public enum ExternalAccountPlatform: String, Codable, Hashable, CaseIterable, Sendable {
    case x
    case instagram
    case youtube
    case tiktok
    case facebook
    case linkedin
    case snapchat
    case klaviyo
    case quickbooks
    case aimerce
}