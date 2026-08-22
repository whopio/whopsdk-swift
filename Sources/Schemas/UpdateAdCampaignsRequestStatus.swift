import Foundation

/// Set to active to launch a draft campaign (moderates and pushes it live). Live-campaign pause and resume use the pause and unpause actions.
public enum UpdateAdCampaignsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
}