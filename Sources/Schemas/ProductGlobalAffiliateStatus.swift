import Foundation

/// Enrollment status in the global affiliate program.
public enum ProductGlobalAffiliateStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case enabled
    case disabled
}