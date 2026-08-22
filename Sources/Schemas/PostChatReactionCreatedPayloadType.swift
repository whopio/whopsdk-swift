import Foundation

/// The webhook event type
public enum PostChatReactionCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case chatReactionCreated = "chat.reaction.created"
}