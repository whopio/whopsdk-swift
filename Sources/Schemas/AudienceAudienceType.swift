import Foundation

/// `custom` = a customer list (uploaded, or built from saved People filters); `lookalike` = Meta lookalike built from a custom audience.
public enum AudienceAudienceType: String, Codable, Hashable, CaseIterable, Sendable {
    case custom
    case lookalike
}