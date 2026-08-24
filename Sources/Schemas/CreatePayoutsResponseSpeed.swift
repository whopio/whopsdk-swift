import Foundation

/// Payout delivery speed.
public enum CreatePayoutsResponseSpeed: String, Codable, Hashable, CaseIterable, Sendable {
    case standard
    case instant
}