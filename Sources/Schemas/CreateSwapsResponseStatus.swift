import Foundation

/// Swap status. Crypto swaps start `queued`; fiat conversions return `complete`, or `working` while a stablecoin repayment settles.
public enum CreateSwapsResponseStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case queued
    case working
    case complete
    case failed
}