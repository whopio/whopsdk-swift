import Foundation

/// The webhook event type
public enum PostMemberCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case memberCreated = "member.created"
}