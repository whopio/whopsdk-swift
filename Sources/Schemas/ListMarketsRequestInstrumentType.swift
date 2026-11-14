import Foundation

public enum ListMarketsRequestInstrumentType: String, Codable, Hashable, CaseIterable, Sendable {
    case perpetual
    case spot
}