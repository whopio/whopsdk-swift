import Foundation

/// The access level a given user (or company) has to a product or company.
public enum AccessLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case noAccess = "no_access"
    case admin
    case customer
}