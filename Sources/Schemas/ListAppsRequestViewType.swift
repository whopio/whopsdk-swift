import Foundation

public enum ListAppsRequestViewType: String, Codable, Hashable, CaseIterable, Sendable {
    case hub
    case discover
    case dash
    case dashboard
    case analytics
    case skills
    case openapi
}