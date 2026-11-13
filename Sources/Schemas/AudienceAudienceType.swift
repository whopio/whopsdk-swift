import Foundation

/// Whether the audience targets a defined group of people or people similar to an existing audience.
public enum AudienceAudienceType: String, Codable, Hashable, CaseIterable, Sendable {
    case custom
    case lookalike
}