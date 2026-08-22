import Foundation

/// The notification preference for an AI chat
public enum AiChatNotificationPreferences: String, Codable, Hashable, CaseIterable, Sendable {
    case all
    case none
}