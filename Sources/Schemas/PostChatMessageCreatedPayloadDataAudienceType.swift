import Foundation

public enum PostChatMessageCreatedPayloadDataAudienceType: String, Codable, Hashable, CaseIterable, Sendable {
    case channel
    case users
}