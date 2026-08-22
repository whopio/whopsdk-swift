import Foundation

/// The webhook event type
public enum PostEntryCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case entryCreated = "entry.created"
}