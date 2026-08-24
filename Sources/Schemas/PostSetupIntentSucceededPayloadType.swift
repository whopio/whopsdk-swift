import Foundation

/// The webhook event type
public enum PostSetupIntentSucceededPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case setupIntentSucceeded = "setup_intent.succeeded"
}