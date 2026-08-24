import Foundation

/// The build's review status.
public enum AppBuildStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case draft
    case pending
    case approved
    case rejected
}