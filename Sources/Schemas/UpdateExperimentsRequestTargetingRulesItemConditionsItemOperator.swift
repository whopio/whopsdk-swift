import Foundation

/// Comparison to apply: `any`/`none` — inclusion/exclusion list; `eq`/`neq` — equality; `gt`/`gte`/`lt`/`lte` — numeric range.
public enum UpdateExperimentsRequestTargetingRulesItemConditionsItemOperator: String, Codable, Hashable, CaseIterable, Sendable {
    case any
    case none
    case eq
    case neq
    case gt
    case gte
    case lt
    case lte
}