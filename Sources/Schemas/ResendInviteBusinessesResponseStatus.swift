import Foundation

/// Current referral status.
public enum ResendInviteBusinessesResponseStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case removed
}