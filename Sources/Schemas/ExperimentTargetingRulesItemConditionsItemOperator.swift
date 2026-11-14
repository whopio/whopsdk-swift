import Foundation

/// Comparison to apply.
public enum ExperimentTargetingRulesItemConditionsItemOperator: String, Codable, Hashable, CaseIterable, Sendable {
    case any
    case none
    case eq
    case neq
    case gt
    case gte
    case lt
    case lte
}