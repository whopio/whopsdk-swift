import Foundation

public enum ListChannelsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case unresolved
    case resolved
}