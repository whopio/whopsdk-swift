import Foundation

/// The signup's current state. Approval runs asynchronously, so a signup stays `pending` until processing completes. `approved` alone does not prove an active membership; check `membership_id`.
public enum WaitlistEntryStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case approved
    case denied
    case canceled
}