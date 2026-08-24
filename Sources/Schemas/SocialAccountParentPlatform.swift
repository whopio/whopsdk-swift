import Foundation

/// The platform the parent social account exists on.
public enum SocialAccountParentPlatform: String, Codable, Hashable, CaseIterable, Sendable {
    case x
    case instagram
    case youtube
    case tiktok
    case facebook
    case discord
    case telegram
}