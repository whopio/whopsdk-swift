import Foundation

/// The view types this build supports, as declared by the developer.
public enum AppBuildSupportedAppViewTypesItem: String, Codable, Hashable, CaseIterable, Sendable {
    case hub
    case discover
    case dash
    case dashboard
    case analytics
    case skills
    case openapi
}