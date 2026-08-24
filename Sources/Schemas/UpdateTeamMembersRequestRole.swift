import Foundation

/// The system role to grant.
public enum UpdateTeamMembersRequestRole: String, Codable, Hashable, CaseIterable, Sendable {
    case owner
    case admin
    case salesManager = "sales_manager"
    case moderator
    case advertiser
    case workforce
}