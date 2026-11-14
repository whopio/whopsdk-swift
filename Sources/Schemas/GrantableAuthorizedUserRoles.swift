import Foundation

/// System roles accepted by legacy authorized-user mutations
public enum GrantableAuthorizedUserRoles: String, Codable, Hashable, CaseIterable, Sendable {
    case owner
    case admin
    case partner
    case salesManager = "sales_manager"
    case moderator
    case advertiser
}