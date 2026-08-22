import Foundation

/// The ad platform that provided the match-rate estimate.
public enum AudienceMatchRatePlatform: String, Codable, Hashable, CaseIterable, Sendable {
    case meta
}