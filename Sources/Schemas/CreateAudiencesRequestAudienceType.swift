import Foundation

/// What to create. Defaults to `custom` (CSV upload).
public enum CreateAudiencesRequestAudienceType: String, Codable, Hashable, CaseIterable, Sendable {
    case custom
    case lookalike
}