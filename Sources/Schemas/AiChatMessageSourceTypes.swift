import Foundation

/// The source of an AI chat message
public enum AiChatMessageSourceTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case manual
    case suggestion
    case link
}