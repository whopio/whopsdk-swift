import Foundation

public enum ListApiLogsResponseDataItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case success
    case error
}