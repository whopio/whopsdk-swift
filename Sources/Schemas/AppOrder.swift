import Foundation

/// The order to fetch the apps in for discovery.
public enum AppOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case discoverableAt = "discoverable_at"
    case totalInstallsLast30Days = "total_installs_last_30_days"
    case totalInstallsLast7Days = "total_installs_last_7_days"
    case timeSpent = "time_spent"
    case timeSpentLast24Hours = "time_spent_last_24_hours"
    case dailyActiveUsers = "daily_active_users"
    case aiPromptCount = "ai_prompt_count"
    case totalAiCostUsd = "total_ai_cost_usd"
    case totalAiTokens = "total_ai_tokens"
    case lastAiPromptAt = "last_ai_prompt_at"
    case aiAverageRating = "ai_average_rating"
}