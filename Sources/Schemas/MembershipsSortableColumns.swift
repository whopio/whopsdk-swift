import Foundation

/// Which columns can be used to sort.
public enum MembershipsSortableColumns: String, Codable, Hashable, CaseIterable, Sendable {
    case id
    case createdAt = "created_at"
    case status
    case canceledAt = "canceled_at"
    case dateJoined = "date_joined"
    case totalSpend = "total_spend"
}