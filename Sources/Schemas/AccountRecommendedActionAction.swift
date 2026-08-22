import Foundation

/// The recommendation; new values may be added, so handle unknown actions gracefully
public enum AccountRecommendedActionAction: String, Codable, Hashable, CaseIterable, Sendable {
    case themeBusiness = "theme_business"
    case createProduct = "create_product"
    case createPlan = "create_plan"
    case verifyIdentity = "verify_identity"
    case connectAffiliateProgram = "connect_affiliate_program"
    case createPromotion = "create_promotion"
    case migrateFromStripe = "migrate_from_stripe"
    case acceptFirstPayment = "accept_first_payment"
    case launchFirstAd = "launch_first_ad"
    case launchDraftCampaign = "launch_draft_campaign"
    case increaseAdBudget = "increase_ad_budget"
    case refreshAdCreatives = "refresh_ad_creatives"
    case fixAdBilling = "fix_ad_billing"
    case excludeCustomersFromAds = "exclude_customers_from_ads"
    case retargetAbandonedCheckouts = "retarget_abandoned_checkouts"
    case fixFunnelDropoff = "fix_funnel_dropoff"
    case inviteTeamMember = "invite_team_member"
    case enableTaxCollection = "enable_tax_collection"
    case createCard = "create_card"
    case applyForFinancing = "apply_for_financing"
}