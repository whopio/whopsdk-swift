import Foundation

/// Destination network override. Defaults to the destination wallet's own network.
public enum CreateDepositsRequestNetwork: String, Codable, Hashable, CaseIterable, Sendable {
    case ethereum
    case polygon
    case base
    case solana
}