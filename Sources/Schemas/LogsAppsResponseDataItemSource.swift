import Foundation

public enum LogsAppsResponseDataItemSource: String, Codable, Hashable, CaseIterable, Sendable {
    case console
    case exception
    case request
}