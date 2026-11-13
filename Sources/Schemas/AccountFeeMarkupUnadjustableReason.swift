import Foundation

/// Why the caller may not change this markup, or `null` when `adjustable`.
public enum AccountFeeMarkupUnadjustableReason: String, Codable, Hashable, CaseIterable, Sendable {
    case notPermitted = "not_permitted"
}