import Foundation

public enum ListTradesRequestType: String, Codable, Hashable, CaseIterable, Sendable {
    case close
    case order
    case deposit
    case withdraw
}