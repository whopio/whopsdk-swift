import Foundation

public enum RetrieveTimeSeriesRequestEventType: String, Codable, Hashable, CaseIterable, Sendable {
    case pageView = "page_view"
    case checkoutStart = "checkout_start"
    case other
}