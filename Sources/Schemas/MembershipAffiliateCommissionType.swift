import Foundation

/// Whether the commission is a percentage or a flat fee.
public enum MembershipAffiliateCommissionType: String, Codable, Hashable, CaseIterable, Sendable {
    case flatFee = "flat_fee"
    case percentage
}