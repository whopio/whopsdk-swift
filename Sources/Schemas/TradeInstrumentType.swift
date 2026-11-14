import Foundation

/// `perpetual` or `spot` for an order, `perpetual` for a close. `null` for a deposit or withdraw.
public enum TradeInstrumentType: String, Codable, Hashable, CaseIterable, Sendable {
    case perpetual
    case spot
}