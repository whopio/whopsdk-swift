import Foundation

public enum PostChatReactionCreatedPayloadDataChannelType: String, Codable, Hashable, CaseIterable, Sendable {
    case chat
    case directMessage = "direct_message"
    case support
}