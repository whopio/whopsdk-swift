import Foundation

/// What moved: a purchase, an affiliate commission, Whop card spend, ad spend, app revenue, an off-platform sale, a wallet deposit, a card load, a claimed drop, a transfer between accounts, or a referral bonus.
public enum PulseEventsResponseDataItemType: String, Codable, Hashable, CaseIterable, Sendable {
    case purchase
    case affiliateCommission = "affiliate_commission"
    case cardSpend = "card_spend"
    case adSpend = "ad_spend"
    case appRevenue = "app_revenue"
    case offPlatformSale = "off_platform_sale"
    case deposit
    case cardLoad = "card_load"
    case airdropClaim = "airdrop_claim"
    case transfer
    case referralBonus = "referral_bonus"
}