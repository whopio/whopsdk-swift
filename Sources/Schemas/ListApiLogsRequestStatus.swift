import Foundation

public enum ListApiLogsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case success
    case error
}