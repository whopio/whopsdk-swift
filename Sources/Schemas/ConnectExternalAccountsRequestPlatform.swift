import Foundation

/// The platform to connect the external account on. Use `tiktok` to connect the authenticated user’s TikTok profile, `linkedin` for their LinkedIn profile, `youtube` for their YouTube channel, or `x` for their X profile. Use `quickbooks` to connect the account’s QuickBooks Online company: pass `account_id`, and the user picks the company in QuickBooks.
public enum ConnectExternalAccountsRequestPlatform: String, Codable, Hashable, CaseIterable, Sendable {
    case tiktok
    case linkedin
    case youtube
    case x
    case quickbooks
}