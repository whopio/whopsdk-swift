import Foundation

/// Whether this is a perpetual or a spot market. With `id`, it identifies the market.
public enum MarketInstrumentType: String, Codable, Hashable, CaseIterable, Sendable {
    case perpetual
    case spot
}