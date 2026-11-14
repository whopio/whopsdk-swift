import Foundation

/// `include` — users matching this rule qualify; `exclude` — users matching this rule are always excluded, overriding any include rule. Defaults to `include`.
public enum UpdateExperimentsRequestTargetingRulesItemType: String, Codable, Hashable, CaseIterable, Sendable {
    case include
    case exclude
}