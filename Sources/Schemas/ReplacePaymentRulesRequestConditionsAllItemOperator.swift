import Foundation

/// How the payment attribute is compared to the value.
public enum ReplacePaymentRulesRequestConditionsAllItemOperator: String, Codable, Hashable, CaseIterable, Sendable {
    case eq
    case neq
    case gt
    case gte
    case lt
    case lte
    case `in`
    case notIn = "not_in"
    case startsWith = "starts_with"
    case contains
    case endsWith = "ends_with"
    case inCidr = "in_cidr"
}