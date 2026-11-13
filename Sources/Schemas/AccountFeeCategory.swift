import Foundation

/// Which group of the fee schedule this fee belongs to, for grouping in a UI.
public enum AccountFeeCategory: String, Codable, Hashable, CaseIterable, Sendable {
    case payments
    case disputes
    case optimization
    case payouts
    case other
}