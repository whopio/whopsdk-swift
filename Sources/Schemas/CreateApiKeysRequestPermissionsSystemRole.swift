import Foundation

/// A system role to inherit permissions from. Only Account API keys can use a system role.
public enum CreateApiKeysRequestPermissionsSystemRole: String, Codable, Hashable, CaseIterable, Sendable {
    case owner
    case admin
    case moderator
    case salesManager = "sales_manager"
    case advertiser
}