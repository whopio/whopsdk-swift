import Foundation

/// The webhook event type
public enum PostMemberUpdatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case memberUpdated = "member.updated"
}