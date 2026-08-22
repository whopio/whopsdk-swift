import Foundation

/// The webhook event type
public enum PostChatMessageCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case chatMessageCreated = "chat.message.created"
}