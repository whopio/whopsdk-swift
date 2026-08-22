import Foundation

/// On-chain deposits to the account's crypto wallet
public enum AccountCapabilitiesCryptoDeposit: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
    case pending
}