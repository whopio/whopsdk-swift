import Foundation

public enum ListTopicsRequestChannel: String, Codable, Hashable, CaseIterable, Sendable {
    case inApp = "in_app"
    case mobile
}