import Foundation

public enum RetrieveStatsRequestEventType: String, Codable, Hashable, CaseIterable, Sendable {
    case pageView = "page_view"
    case checkoutStart = "checkout_start"
    case other
}