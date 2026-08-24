import Foundation

/// The blockchain network the wallet lives on
public enum AccountWalletNetwork: String, Codable, Hashable, CaseIterable, Sendable {
    case solana
    case ethereum
    case bitcoin
}