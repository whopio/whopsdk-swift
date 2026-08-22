import Foundation

/// The webhook event type
public enum PostSetupIntentCanceledPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case setupIntentCanceled = "setup_intent.canceled"
}