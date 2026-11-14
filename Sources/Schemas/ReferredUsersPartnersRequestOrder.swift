import Foundation

public enum ReferredUsersPartnersRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case earningsUsd = "earnings_usd"
}