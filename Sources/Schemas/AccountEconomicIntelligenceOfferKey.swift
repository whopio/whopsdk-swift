import Foundation

/// The unique identifier for this offer. Pass this value as `economic_intelligence_duration_key` to turn it on. Only `3_days`, the auto-renew offer, is offered. The other keys identify periods bought before it became the only plan.
public enum AccountEconomicIntelligenceOfferKey: String, Codable, Hashable, CaseIterable, Sendable {
    case threeDays = "3_days"
    case weekly
    case sevenDays = "7_days"
    case oneDay = "1_day"
    case oneHour = "1_hour"
}