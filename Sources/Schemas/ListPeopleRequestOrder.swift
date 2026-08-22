import Foundation

public enum ListPeopleRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case firstSeenAt = "first_seen_at"
    case lastSeenAt = "last_seen_at"
    case firstPurchaseAt = "first_purchase_at"
    case lastPurchaseAt = "last_purchase_at"
    case purchaseCount = "purchase_count"
    case eventCount = "event_count"
    case ltv
    case aov
    case name
    case email
}