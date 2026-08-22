import Foundation

/// What the member can reach on the account: `customer` for paying members, `admin` for team members, `no_access` once every grant has lapsed.
public enum MemberAccessLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case noAccess = "no_access"
    case admin
    case customer
}