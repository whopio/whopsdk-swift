import Foundation

/// The different API versions
public enum ApiVersion: String, Codable, Hashable, CaseIterable, Sendable {
    case v1
    case v2
    case v5
}