import Foundation

/// Destination wallet network.
public enum CreateDepositsRequestDestinationAccountIdNetwork: String, Codable, Hashable, CaseIterable, Sendable {
    case ethereum
    case polygon
    case base
    case solana
}