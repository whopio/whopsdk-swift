import Foundation

public enum LogsAppsRequestLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case log
    case debug
    case info
    case warn
    case error
}