import Foundation

/// Whether the commission is a percentage of each payment or a fixed amount per payment.
public enum AssignAffiliateMembershipsRequestCommissionType: String, Codable, Hashable, CaseIterable, Sendable {
    case flatFee = "flat_fee"
    case percentage
}