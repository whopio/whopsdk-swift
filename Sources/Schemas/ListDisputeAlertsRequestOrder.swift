import Foundation

public enum ListDisputeAlertsRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case reportedAt = "reported_at"
    case amount
}