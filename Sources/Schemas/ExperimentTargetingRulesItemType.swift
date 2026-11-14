import Foundation

/// `include` — users matching this rule qualify; `exclude` — users matching this rule are always excluded, overriding any include rule.
public enum ExperimentTargetingRulesItemType: String, Codable, Hashable, CaseIterable, Sendable {
    case include
    case exclude
}