import Foundation

/// Why this part of the day's unlock is held, matching `type` on the reserve's `by_type`.
public enum AccountReserveUnlockTypeType: String, Codable, Hashable, CaseIterable, Sendable {
    case regular
    case bnpl
    case sequra
    case fraudHold = "fraud_hold"
    case preshipmentHold = "preshipment_hold"
}