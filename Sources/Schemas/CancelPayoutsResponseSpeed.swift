import Foundation

/// Payout delivery speed.
public enum CancelPayoutsResponseSpeed: String, Codable, Hashable, CaseIterable, Sendable {
    case standard
    case instant
}