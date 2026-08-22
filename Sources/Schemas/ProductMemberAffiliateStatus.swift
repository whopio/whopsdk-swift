import Foundation

/// Enrollment status in the member affiliate program.
public enum ProductMemberAffiliateStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case enabled
    case disabled
}