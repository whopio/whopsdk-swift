import Foundation

/// Current status of the earning.
public enum ListEarningsResponseDataItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case awaitingSettlement = "awaiting_settlement"
    case pending
    case completed
    case canceled
    case reversed
}