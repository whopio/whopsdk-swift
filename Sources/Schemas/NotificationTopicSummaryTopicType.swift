import Foundation

/// Scope of the topic: whether it applies to an account, a user, or an account's team.
public enum NotificationTopicSummaryTopicType: String, Codable, Hashable, CaseIterable, Sendable {
    case account
    case user
    case accountTeam = "account_team"
}