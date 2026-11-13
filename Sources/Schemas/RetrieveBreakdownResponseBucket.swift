import Foundation

public enum RetrieveBreakdownResponseBucket: String, Codable, Hashable, CaseIterable, Sendable {
    case transfers
    case payments
    case refunds
    case ads
    case applicationFees = "application_fees"
    case cardSpend = "card_spend"
    case cardAuthorizationReleases = "card_authorization_releases"
    case withdrawals
    case withdrawalMarkup = "withdrawal_markup"
    case platformMarkup = "platform_markup"
    case clawbacks
    case disputes
    case affiliateEarnings = "affiliate_earnings"
    case affiliatePayouts = "affiliate_payouts"
    case revenueShare = "revenue_share"
    case swaps
    case cardLoads = "card_loads"
}