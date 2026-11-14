import Foundation

/// Swap status. Crypto swaps start `queued`. Fiat conversions return `complete`, or `working` while the conversion settles.
public enum CreateSwapsResponseStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case queued
    case working
    case complete
    case failed
}