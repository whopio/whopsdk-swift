import Foundation

/// How fast the funds should arrive. `instant` is only accepted when the account and payout method are eligible; otherwise the payout is rejected.
public enum CreatePayoutsRequestBodySpeed: String, Codable, Hashable, CaseIterable, Sendable {
    case standard
    case instant
}