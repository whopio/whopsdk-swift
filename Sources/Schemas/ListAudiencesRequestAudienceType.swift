import Foundation

public enum ListAudiencesRequestAudienceType: String, Codable, Hashable, CaseIterable, Sendable {
    case custom
    case lookalike
}