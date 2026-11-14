import Foundation

public enum ListTeamMembersRequestRole: String, Codable, Hashable, CaseIterable, Sendable {
    case owner
    case admin
    case partner
    case salesManager = "sales_manager"
    case moderator
    case advertiser
    case appManager = "app_manager"
    case support
    case manager
    case workforce
    case custom
}