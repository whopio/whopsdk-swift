import Foundation

/// Payout delivery speed.
public enum ListPayoutsResponseDataItemSpeed: String, Codable, Hashable, CaseIterable, Sendable {
    case standard
    case instant
}