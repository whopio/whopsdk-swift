import Foundation

/// The webhook event type
public enum PostEntryApprovedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case entryApproved = "entry.approved"
}