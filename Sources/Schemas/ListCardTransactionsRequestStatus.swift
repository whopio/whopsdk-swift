import Foundation

public enum ListCardTransactionsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case completed
    case reversed
    case declined
}