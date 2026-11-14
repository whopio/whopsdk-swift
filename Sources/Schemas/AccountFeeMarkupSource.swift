import Foundation

/// `custom` when a row is set at this level, `default` when the rate falls through to the platform default or zero. `null` when a subaccount's fees are read without access to its parent account.
public enum AccountFeeMarkupSource: String, Codable, Hashable, CaseIterable, Sendable {
    case `default`
    case custom
}