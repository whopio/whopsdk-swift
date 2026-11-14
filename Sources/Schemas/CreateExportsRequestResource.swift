import Foundation

/// The resource to export, e.g. `payouts`, `receipts`, or `members`.
public enum CreateExportsRequestResource: String, Codable, Hashable, CaseIterable, Sendable {
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
    case externalAccounts = "external_accounts"
    case financialActivity = "financial-activity"
    case payoutMethods = "payout_methods"
    case payouts
    case people
    case plans
    case products
    case receiptInvoices = "receipt_invoices"
    case resolutionCenterCases = "resolution_center_cases"
    case shipments
    case socialAccounts = "social_accounts"
    case teamMembers = "team_members"
    case transfers
    case webhooks
    case members
    case receipts
    case unclaimedMemberships = "unclaimed_memberships"
    case memberships
    case trackingLinks = "tracking_links"
    case promoCodes = "promo_codes"
    case resolutions
    case entries
    case leads
    case invoices
    case cancelationReasons = "cancelation_reasons"
    case childCompanies = "child_companies"
}