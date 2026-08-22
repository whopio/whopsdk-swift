import Foundation

/// The target platform for the build.
public enum CreateAppBuildsRequestPlatform: String, Codable, Hashable, CaseIterable, Sendable {
    case ios
    case android
    case web
}