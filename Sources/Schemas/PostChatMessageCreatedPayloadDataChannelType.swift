import Foundation

public enum PostChatMessageCreatedPayloadDataChannelType: String, Codable, Hashable, CaseIterable, Sendable {
    case chat
    case directMessage = "direct_message"
    case support
}