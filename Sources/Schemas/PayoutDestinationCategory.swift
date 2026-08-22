import Foundation

/// The category of a payout destination.
public enum PayoutDestinationCategory: String, Codable, Hashable, CaseIterable, Sendable {
    case crypto
    case rtp
    case nextDayBank = "next_day_bank"
    case bankWire = "bank_wire"
    case digitalWallet = "digital_wallet"
    case unknown
}