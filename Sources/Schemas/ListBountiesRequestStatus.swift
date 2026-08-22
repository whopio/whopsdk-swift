import Foundation

public enum ListBountiesRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case scheduled
    case open
    case closed
    case completed
    case canceled
}