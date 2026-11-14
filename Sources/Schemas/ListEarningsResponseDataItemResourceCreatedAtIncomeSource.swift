import Foundation

/// Which income source that commission is on.
public enum ListEarningsResponseDataItemResourceCreatedAtIncomeSource: String, Codable, Hashable, CaseIterable, Sendable {
    case sales
    case adSpend = "ad_spend"
    case transfer
    case cardInterchange = "card_interchange"
    case withdrawal
    case businessReferral = "business_referral"
    case onboardingReward = "onboarding_reward"
    case partnerReward = "partner_reward"
    case verifiedPartnerReferralPayback = "verified_partner_referral_payback"
    case commissionAdvance = "commission_advance"
}