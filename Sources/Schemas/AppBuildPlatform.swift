import Foundation

/// The target platform for this build.
public enum AppBuildPlatform: String, Codable, Hashable, CaseIterable, Sendable {
    case ios
    case android
    case web
}