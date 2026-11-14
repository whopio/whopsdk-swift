import Foundation

/// Why the caller may not change this fee, or `null` when `adjustable`. `not_permitted` when the caller has no say over it.
public enum AccountFeeUnadjustableReason: String, Codable, Hashable, CaseIterable, Sendable {
    case notPermitted = "not_permitted"
}