import Foundation

/// The income stream these terms describe.
public enum FeeOptionsPartnersResponseStreamsItemIncomeStream: String, Codable, Hashable, CaseIterable, Sendable {
    case sales
    case transfer
    case cardInterchange = "card_interchange"
    case adSpend = "ad_spend"
    case withdrawal
    case onboardingReward = "onboarding_reward"
    case partnerReward = "partner_reward"
    case verifiedPartnerReferralPayback = "verified_partner_referral_payback"
}