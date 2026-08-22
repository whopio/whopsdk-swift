import Foundation

/// Email notification preference option for a forum feed
public enum ForumEmailNotificationPreferences: String, Codable, Hashable, CaseIterable, Sendable {
    case allAdminPosts = "all_admin_posts"
    case onlyWeeklySummary = "only_weekly_summary"
    case none
}