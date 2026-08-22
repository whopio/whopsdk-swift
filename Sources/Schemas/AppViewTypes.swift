import Foundation

/// The different types of an app view
public enum AppViewTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case hub
    case discover
    case dash
    case dashboard
    case analytics
    case skills
    case openapi
}