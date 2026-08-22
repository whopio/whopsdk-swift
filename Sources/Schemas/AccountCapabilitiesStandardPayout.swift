import Foundation

/// Standard payouts to an external payout destination
public enum AccountCapabilitiesStandardPayout: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case pending
}