import Foundation

public enum RetrievePayoutsResponseTimelineItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case requested
    case awaitingPayment = "awaiting_payment"
    case inTransit = "in_transit"
    case completed
    case failed
    case canceled
    case denied
}