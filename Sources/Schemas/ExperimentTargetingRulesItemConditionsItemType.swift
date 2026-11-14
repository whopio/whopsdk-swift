import Foundation

/// What the condition matches on: the user ID, the account ID, or a named user property.
public enum ExperimentTargetingRulesItemConditionsItemType: String, Codable, Hashable, CaseIterable, Sendable {
    case userId = "user_id"
    case accountId = "account_id"
    case property
}