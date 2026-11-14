import Foundation

/// The webhook event type
public enum PostAdUpdatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case adUpdated = "ad.updated"
}