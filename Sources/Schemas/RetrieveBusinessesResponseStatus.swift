import Foundation

/// Current referral status.
public enum RetrieveBusinessesResponseStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case removed
}