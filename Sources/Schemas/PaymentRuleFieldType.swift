import Foundation

/// The type of value this field compares against.
public enum PaymentRuleFieldType: String, Codable, Hashable, CaseIterable, Sendable {
    case integer
    case number
    case string
}