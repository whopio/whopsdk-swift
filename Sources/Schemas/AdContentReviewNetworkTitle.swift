import Foundation

/// The network. `whop` is Whop's own content policy, which every other network also requires.
public enum AdContentReviewNetworkTitle: String, Codable, Hashable, CaseIterable, Sendable {
    case whop
    case meta
    case tiktok
    case google
}