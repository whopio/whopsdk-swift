import Foundation

/// The different platforms an app build can target.
public enum AppBuildPlatforms: String, Codable, Hashable, CaseIterable, Sendable {
    case ios
    case android
    case web
}