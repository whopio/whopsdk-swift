import Foundation

/// System role the key inherits its permissions from, or `null` when it uses an explicit permissions policy. Only account API keys can use a system role.
public enum ApiKeySystemRole: String, Codable, Hashable, CaseIterable, Sendable {
    case owner
    case admin
    case moderator
    case salesManager = "sales_manager"
    case advertiser
}