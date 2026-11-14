import Foundation

/// The system role to grant. Custom roles cannot be granted through the API. The Partner role provides view-only access.
public enum CreateTeamMembersRequestRole: String, Codable, Hashable, CaseIterable, Sendable {
    case owner
    case admin
    case partner
    case salesManager = "sales_manager"
    case moderator
    case advertiser
    case workforce
}