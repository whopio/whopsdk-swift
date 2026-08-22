import Foundation

/// The system role to grant.
public enum CreateTeamMembersRequestRole: String, Codable, Hashable, CaseIterable, Sendable {
    case owner
    case admin
    case salesManager = "sales_manager"
    case moderator
    case advertiser
    case workforce
}