import Foundation

public enum ListChannelsRequestOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case lastMessageAt = "last_message_at"
    case lastViewedAt = "last_viewed_at"
}