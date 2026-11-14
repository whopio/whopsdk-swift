import Foundation

/// `pending` until the trade starts. `processing` while it runs, also while an order that did not fill sends the money it bridged in back to the wallet. `completed` when it did what was asked. `failed` when it did not; `funds_location` says where the money is. `in_review` when the outcome is unknown and a person checks it.
public enum TradeStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case processing
    case inReview = "in_review"
    case completed
    case failed
}