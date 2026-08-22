import Foundation

/// The webhook event type
public enum PostSetupIntentRequiresActionPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case setupIntentRequiresAction = "setup_intent.requires_action"
}