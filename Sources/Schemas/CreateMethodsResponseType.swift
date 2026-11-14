import Foundation

/// The kind of payout method. `external` sends funds out of Whop. `whop_card` moves funds onto the account's own Whop Card. A `whop_card` method takes standard-speed payouts only, and cannot be updated, reconnected, or deleted.
public enum CreateMethodsResponseType: String, Codable, Hashable, CaseIterable, Sendable {
    case external
    case whopCard = "whop_card"
}