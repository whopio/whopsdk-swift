import Foundation

/// Current referral status.
public enum ListBusinessesResponseDataItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case removed
}