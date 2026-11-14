import Foundation

/// The webhook event type
public enum PostAdGroupUpdatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case adGroupUpdated = "ad_group.updated"
}