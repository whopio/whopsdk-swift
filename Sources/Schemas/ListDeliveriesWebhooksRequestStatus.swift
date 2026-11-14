import Foundation

public enum ListDeliveriesWebhooksRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case success
    case error
}