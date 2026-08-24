import Foundation

public enum ListPlansRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case id
    case activeMembersCount = "active_members_count"
    case createdAt = "created_at"
    case internalNotes = "internal_notes"
    case expirationDays = "expiration_days"
}