import Foundation

/// Availability of the estimated match rate.
public enum AudienceMatchRateStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case calculating
    case available
    case unavailable
}