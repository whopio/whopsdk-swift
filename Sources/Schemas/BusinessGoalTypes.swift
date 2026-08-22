import Foundation

/// What the poster is trying to accomplish with a workforce bounty. Used for product taxonomy and analytics, separate from the bounty's implementation type.
public enum BusinessGoalTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case clipping
    case postEngagement = "post_engagement"
    case ownedAccountGrowth = "owned_account_growth"
    case ugcContent = "ugc_content"
    case localActivation = "local_activation"
    case dataCapture = "data_capture"
    case other
}