import Foundation

/// The statuses a review can have
public enum ReviewStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case published
    case removed
}