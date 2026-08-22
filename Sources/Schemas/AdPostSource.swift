import Foundation

/// Identifies the network that owns `post_id`; `null` when the ad uses uploaded creatives.
public enum AdPostSource: String, Codable, Hashable, CaseIterable, Sendable {
    case facebook
    case instagram
}