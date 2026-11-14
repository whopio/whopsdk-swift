import Foundation

/// Whether the affiliate's enrollment is active or archived.
public enum ProductAffiliateStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case archived
}