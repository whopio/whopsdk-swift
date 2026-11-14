import Foundation

/// Whether withdrawal fees are inclusive or exclusive. Requires payout:withdrawal:read.
public enum LedgerActivitySourceFeeType: String, Codable, Hashable, CaseIterable, Sendable {
    case exclusive
    case inclusive
}