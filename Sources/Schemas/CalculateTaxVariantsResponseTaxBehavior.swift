import Foundation

/// Whether tax is added on top of the variant price or already included in it for this buyer's location.
public enum CalculateTaxVariantsResponseTaxBehavior: String, Codable, Hashable, CaseIterable, Sendable {
    case exclusive
    case inclusive
}