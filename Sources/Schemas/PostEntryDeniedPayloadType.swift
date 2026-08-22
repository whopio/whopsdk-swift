import Foundation

/// The webhook event type
public enum PostEntryDeniedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case entryDenied = "entry.denied"
}