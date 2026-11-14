import Foundation

/// The goal the campaign optimizes toward.
public enum CreateAdCampaignsRequestObjective: String, Codable, Hashable, CaseIterable, Sendable {
    case traffic
    case engagement
    case leads
    case sales
}