import Foundation

/// `perpetual` or `spot`. Required for an order. A spot order is a market order that swaps in the wallet and does not use the trading balance.
public enum CreateTradesRequestInstrumentType: String, Codable, Hashable, CaseIterable, Sendable {
    case perpetual
    case spot
}