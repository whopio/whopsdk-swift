import Foundation

/// The webhook event type
public enum PostAccountUpdatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case accountUpdated = "account.updated"
}