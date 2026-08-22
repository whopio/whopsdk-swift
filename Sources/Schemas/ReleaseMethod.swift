import Foundation

/// The methods of how a plan can be released.
public enum ReleaseMethod: String, Codable, Hashable, CaseIterable, Sendable {
    case buyNow = "buy_now"
    case waitlist
}