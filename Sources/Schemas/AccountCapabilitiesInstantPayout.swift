import Foundation

/// Instant payouts to an eligible payout destination
public enum AccountCapabilitiesInstantPayout: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case pending
}