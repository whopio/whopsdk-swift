import Foundation

/// The party that performed the action.
public enum ResolutionEventReporterType: String, Codable, Hashable, CaseIterable, Sendable {
    case merchant
    case customer
    case platform
    case system
}