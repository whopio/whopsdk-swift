import Foundation

/// Launching ad campaigns through Whop Ads. `inactive` until the account's identity or business is verified, while a requested ads services agreement is awaiting the account's signature, and while the account is suspended from Whop Ads.
public enum AccountCapabilitiesRunAds: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case pending
}