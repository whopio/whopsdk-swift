import Foundation

/// Whether the requirement accepts no text, one value, or multiple values.
public enum FinancingRequirementTextCollectionType: String, Codable, Hashable, CaseIterable, Sendable {
    case none
    case single
    case multi
}