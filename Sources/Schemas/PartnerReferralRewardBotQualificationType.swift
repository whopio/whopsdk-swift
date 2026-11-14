import Foundation

/// Activity that qualifies for this reward, when specified.
public enum PartnerReferralRewardBotQualificationType: String, Codable, Hashable, CaseIterable, Sendable {
    case sales
    case adSpend = "ad_spend"
}