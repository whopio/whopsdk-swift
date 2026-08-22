import Foundation

public enum ListEarningsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case awaitingSettlement = "awaiting_settlement"
    case pending
    case completed
    case canceled
    case reversed
}