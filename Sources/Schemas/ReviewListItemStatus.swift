import Foundation

/// The moderation status of the review. Only published reviews are returned.
public enum ReviewListItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case published
}