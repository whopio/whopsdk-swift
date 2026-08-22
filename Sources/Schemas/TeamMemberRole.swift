import Foundation

/// The member's role on the account. `custom` means a bespoke dashboard-managed role; the API can read but not grant it.
public enum TeamMemberRole: String, Codable, Hashable, CaseIterable, Sendable {
    case owner
    case admin
    case salesManager = "sales_manager"
    case moderator
    case advertiser
    case appManager = "app_manager"
    case support
    case manager
    case workforce
    case custom
}