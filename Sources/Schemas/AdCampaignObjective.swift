import Foundation

/// The goal the campaign optimizes toward.
public enum AdCampaignObjective: String, Codable, Hashable, CaseIterable, Sendable {
    case awareness
    case traffic
    case engagement
    case leads
    case sales
}