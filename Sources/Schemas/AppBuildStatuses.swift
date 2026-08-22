import Foundation

/// The different statuses an AppBuild can be in.
public enum AppBuildStatuses: String, Codable, Hashable, CaseIterable, Sendable {
    case draft
    case pending
    case approved
    case rejected
}