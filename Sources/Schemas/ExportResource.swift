import Foundation

/// The resource that was exported, e.g. `receipts`, `members`, or `payouts`.
public enum ExportResource: String, Codable, Hashable, CaseIterable, Sendable {
    case adCampaigns = "ad_campaigns"
    case adGroups = "ad_groups"
    case ads
    case apps
    case audiences
    case bounties
    case bountySubmissions = "bounty_submissions"
    case cardTransactions = "card_transactions"
    case checkoutConfigurations = "checkout_configurations"
    case disputes
    case events
    case financialActivity = "financial-activity"
    case members
    case memberships
    case payoutMethods = "payout_methods"
    case payouts
    case people
    case plans
    case products
    case resolutionCenterCases = "resolution_center_cases"
    case shipments
    case socialAccounts = "social_accounts"
    case teamMembers = "team_members"
    case transfers
    case webhooks
    case receipts
    case unclaimedMemberships = "unclaimed_memberships"
    case trackingLinks = "tracking_links"
    case promoCodes = "promo_codes"
    case resolutions
    case entries
    case leads
    case contentRewardsSubmissions = "content_rewards_submissions"
    case invoices
    case cancelationReasons = "cancelation_reasons"
    case childCompanies = "child_companies"
    case ledgerLines = "ledger_lines"
    case withdrawalLines = "withdrawal_lines"
}