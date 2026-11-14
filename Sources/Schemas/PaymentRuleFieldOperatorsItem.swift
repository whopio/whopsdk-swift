import Foundation

/// The operators this field accepts. Any other operator is rejected.
public enum PaymentRuleFieldOperatorsItem: String, Codable, Hashable, CaseIterable, Sendable {
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