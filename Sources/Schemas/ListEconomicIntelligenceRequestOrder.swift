import Foundation

public enum ListEconomicIntelligenceRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case runStartedAt = "run_started_at"
}