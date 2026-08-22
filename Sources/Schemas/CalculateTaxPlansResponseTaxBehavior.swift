import Foundation

/// Whether tax is added on top of the plan price or already included in it for this buyer's location.
public enum CalculateTaxPlansResponseTaxBehavior: String, Codable, Hashable, CaseIterable, Sendable {
    case exclusive
    case inclusive
}