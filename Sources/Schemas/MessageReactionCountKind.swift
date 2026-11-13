import Foundation

public enum MessageReactionCountKind: String, Codable, Hashable, CaseIterable, Sendable {
    case like
    case view
    case emoji
}