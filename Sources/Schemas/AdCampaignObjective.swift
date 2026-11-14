import Foundation

/// The goal the campaign optimizes toward. `awareness` appears only on campaigns created before it was retired; those campaigns can't launch.
public enum AdCampaignObjective: String, Codable, Hashable, CaseIterable, Sendable {
    case awareness
    case traffic
    case engagement
    case leads
    case sales
}