import Foundation

/// System roles that include the permission.
public enum PermissionGrantedToSystemRolesItem: String, Codable, Hashable, CaseIterable, Sendable {
    case owner
    case admin
    case moderator
    case salesManager = "sales_manager"
    case advertiser
    case partner
}