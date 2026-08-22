import Foundation

/// Launching ad campaigns through Whop Ads. `inactive` while a requested ads services agreement is awaiting the account's signature.
public enum AccountCapabilitiesRunAds: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case pending
}