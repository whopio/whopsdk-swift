import Foundation

/// Public account home page preferences.
public enum AccountHomePreferencesItem: String, Codable, Hashable, CaseIterable, Sendable {
    case hideMemberCount = "hide_member_count"
    case hideMembersCard = "hide_members_card"
}