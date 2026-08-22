import Foundation

/// The webhook event type
public enum PostIdentityProfileUpdatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case identityProfileUpdated = "identity_profile.updated"
}