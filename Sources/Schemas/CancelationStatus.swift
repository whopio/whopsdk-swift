import Foundation

/// The state of a membership after a customer provides a cancelation reason.
public enum CancelationStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case wonBack = "won_back"
    case left
    case canceling
}