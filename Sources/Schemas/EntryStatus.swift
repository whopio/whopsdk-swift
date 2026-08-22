import Foundation

/// The status of an entry to a waitlist.
public enum EntryStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case drafted
    case pending
    case approved
    case denied
    case any
}