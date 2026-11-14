import Foundation

public enum ListExperimentsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case draft
    case active
    case paused
    case ended
}