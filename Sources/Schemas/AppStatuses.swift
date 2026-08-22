import Foundation

/// The status of an experience interface
public enum AppStatuses: String, Codable, Hashable, CaseIterable, Sendable {
    case live
    case unlisted
    case hidden
}