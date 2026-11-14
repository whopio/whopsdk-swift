import Foundation

public enum CalculateTaxPlansResponseTaxBehavior: String, Codable, Hashable, CaseIterable, Sendable {
    case exclusive
    case inclusive
}