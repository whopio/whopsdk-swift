import Foundation

/// The webhook event type
public enum PostSwapCompletedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case swapCompleted = "swap.completed"
}