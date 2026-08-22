import Foundation

/// The different types of reporters for a resolution event
public enum ResolutionCenterCaseReporters: String, Codable, Hashable, CaseIterable, Sendable {
    case merchant
    case customer
    case platform
    case system
}