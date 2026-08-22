import Foundation

/// On-chain payouts to a crypto wallet
public enum AccountCapabilitiesCryptoPayout: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case pending
}