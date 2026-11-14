import Foundation

/// Whether the requirement accepts no file, one file, or multiple files.
public enum FinancingRequirementFileCollectionType: String, Codable, Hashable, CaseIterable, Sendable {
    case none
    case single
    case multi
}