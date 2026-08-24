import Foundation

public enum ListAppBuildsRequestPlatform: String, Codable, Hashable, CaseIterable, Sendable {
    case ios
    case android
    case web
}