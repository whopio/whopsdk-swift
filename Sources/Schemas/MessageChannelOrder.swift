import Foundation

/// Sort options for message channels
public enum MessageChannelOrder: String, Codable, Hashable, CaseIterable, Sendable {
    case createdAt = "created_at"
    case lastPostSentAt = "last_post_sent_at"
}