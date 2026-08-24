import Foundation

/// The different access levels for experiences (PUBLIC IS NEVER USED ANYMORE).
public enum ExperienceAccessLevels: String, Codable, Hashable, CaseIterable, Sendable {
    case `public`
    case `private`
}