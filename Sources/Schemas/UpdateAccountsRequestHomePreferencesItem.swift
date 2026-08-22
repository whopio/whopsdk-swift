import Foundation

public enum UpdateAccountsRequestHomePreferencesItem: String, Codable, Hashable, CaseIterable, Sendable {
    case hideMemberCount = "hide_member_count"
    case hideMembersCard = "hide_members_card"
}