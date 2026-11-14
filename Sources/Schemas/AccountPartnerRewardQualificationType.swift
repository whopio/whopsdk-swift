import Foundation

/// Activity that qualifies this account for the reward.
public enum AccountPartnerRewardQualificationType: String, Codable, Hashable, CaseIterable, Sendable {
    case sales
    case adSpend = "ad_spend"
}