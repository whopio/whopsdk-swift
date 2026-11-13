import Foundation

/// Expected text format. max_product_price uses money instead of values.
public enum FinancingRequirementTextFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case plain
    case url
    case email
    case phone
    case number
    case checkbox
    case dropdown
}