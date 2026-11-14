import Foundation

/// The kind of payout method the payout used. `external` sent funds out of Whop. `whop_card` moved funds onto the account's own Whop Card.
public enum PostPayoutCreatedPayloadDataPayoutMethodType: String, Codable, Hashable, CaseIterable, Sendable {
    case external
    case whopCard = "whop_card"
}