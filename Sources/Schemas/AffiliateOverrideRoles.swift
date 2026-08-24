import Foundation

/// The role of an affiliate override (standard or rev_share)
public enum AffiliateOverrideRoles: String, Codable, Hashable, CaseIterable, Sendable {
    case standard
    case revShare = "rev_share"
}