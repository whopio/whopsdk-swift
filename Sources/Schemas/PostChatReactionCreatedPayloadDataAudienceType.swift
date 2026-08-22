import Foundation

public enum PostChatReactionCreatedPayloadDataAudienceType: String, Codable, Hashable, CaseIterable, Sendable {
    case channel
    case users
}