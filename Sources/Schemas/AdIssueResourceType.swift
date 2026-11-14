import Foundation

/// The type of object the issue is on.
public enum AdIssueResourceType: String, Codable, Hashable, CaseIterable, Sendable {
    case ad
    case adGroup = "ad_group"
}