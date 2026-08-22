import Foundation

/// The webhook event type
public enum PostEntryDeletedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case entryDeleted = "entry.deleted"
}