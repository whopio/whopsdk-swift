import Foundation

/// Identifies the network that owns `post_id`. The source is inferred from the ID shape when omitted.
public enum CreateAdsRequestPostSource: String, Codable, Hashable, CaseIterable, Sendable {
    case facebook
    case instagram
}