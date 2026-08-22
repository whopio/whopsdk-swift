import Foundation

/// What the poster wants the work to achieve, declared once at create. `null` for bounties created before the taxonomy rolled out.
public enum BountyBusinessGoalType: String, Codable, Hashable, CaseIterable, Sendable {
    case clipping
    case postEngagement = "post_engagement"
    case ownedAccountGrowth = "owned_account_growth"
    case ugcContent = "ugc_content"
    case localActivation = "local_activation"
    case dataCapture = "data_capture"
    case other
}