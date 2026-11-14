import Foundation

public enum ListWaitlistEntriesRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case approved
    case denied
    case canceled
}