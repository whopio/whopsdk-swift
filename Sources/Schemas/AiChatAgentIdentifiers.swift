import Foundation

/// The AI agent that handles an AI chat.
public enum AiChatAgentIdentifiers: String, Codable, Hashable, CaseIterable, Sendable {
    case general
    case support
}