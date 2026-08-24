import Foundation

/// Payout delivery speed.
public enum RetrievePayoutsResponseSpeed: String, Codable, Hashable, CaseIterable, Sendable {
    case standard
    case instant
}