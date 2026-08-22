import Foundation

public enum LogsAppsResponseDataItemLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case log
    case debug
    case info
    case warn
    case error
}