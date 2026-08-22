import Foundation

/// The platform to connect the social account on. Supported options are `meta_business` and `tiktok`.
public enum ConnectSocialAccountsRequestPlatform: String, Codable, Hashable, CaseIterable, Sendable {
    case metaBusiness = "meta_business"
    case tiktok
}