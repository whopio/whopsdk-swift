import Foundation

/// Audience type. Defaults to `custom`.
public enum CreateAudiencesRequestAudienceType: String, Codable, Hashable, CaseIterable, Sendable {
    case custom
    case lookalike
}