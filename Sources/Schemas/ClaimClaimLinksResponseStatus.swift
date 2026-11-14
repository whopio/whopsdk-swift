import Foundation

/// The link's lifecycle status. A newly funded link is `pending`. Check `claimable` for current availability, including expiry and reserved claims.
public enum ClaimClaimLinksResponseStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case fullyClaimed = "fully_claimed"
    case canceled
    case expired
}