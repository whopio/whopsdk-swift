import Foundation

/// Turns on Economic Intelligence with the offer that has this `key` in `economic_intelligence_offers`, at that offer's fee. Only `3_days`, the auto-renew offer, is accepted. Any other key is rejected. Returns `403` for an account Economic Intelligence is not offered to. Requires the `company:update` scope on your API key.
public enum UpdatePreferencesRequestEconomicIntelligenceDurationKey: String, Codable, Hashable, CaseIterable, Sendable {
    case threeDays = "3_days"
    case weekly
    case sevenDays = "7_days"
    case oneDay = "1_day"
    case oneHour = "1_hour"
}