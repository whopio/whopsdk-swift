import Foundation

/// `user_id` — match on subject user ID; `account_id` — match on account ID (prefixed `biz_`); `property` — match on a named user property (requires `field`).
public enum UpdateExperimentsRequestTargetingRulesItemConditionsItemType: String, Codable, Hashable, CaseIterable, Sendable {
    case userId = "user_id"
    case accountId = "account_id"
    case property
}