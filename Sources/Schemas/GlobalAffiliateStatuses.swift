import Foundation

/// The different statuses of the global affiliate program for a product.
public enum GlobalAffiliateStatuses: String, Codable, Hashable, CaseIterable, Sendable {
    case enabled
    case disabled
}