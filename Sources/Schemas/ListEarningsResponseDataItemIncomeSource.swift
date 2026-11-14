import Foundation

/// Which income source the commission is on: product-sales gross profit, Whop Ads spend billed to the business, platform balance transfer fees, Whop Card interchange, withdrawal gross profit, or a fixed onboarding or referral link reward paid to the partner when a referred business qualifies.
public enum ListEarningsResponseDataItemIncomeSource: String, Codable, Hashable, CaseIterable, Sendable {
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