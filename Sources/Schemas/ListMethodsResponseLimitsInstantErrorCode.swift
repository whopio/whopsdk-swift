import Foundation

/// Why instant payouts are unavailable for this account, or null when they are available.
public enum ListMethodsResponseLimitsInstantErrorCode: String, Codable, Hashable, CaseIterable, Sendable {
    case amountTooHigh = "amount_too_high"
    case accountDailyLimitReached = "account_daily_limit_reached"
    case restrictedAccount = "restricted_account"
    case featureDisabled = "feature_disabled"
}