import Foundation

/// The different system roles that can be assigned.
public enum PermissionSystemRoles: String, Codable, Hashable, CaseIterable, Sendable {
    case owner
    case admin
    case moderator
    case salesManager = "sales_manager"
    case advertiser
}