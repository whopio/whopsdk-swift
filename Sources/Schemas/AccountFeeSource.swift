import Foundation

/// Where the rate in effect comes from: `default` is the platform rate, `custom` a rate negotiated for this account, and `inherited` a rate negotiated by the platform this account is connected to. `null` when a subaccount's fees are read without access to its parent account.
public enum AccountFeeSource: String, Codable, Hashable, CaseIterable, Sendable {
    case `default`
    case custom
    case inherited
}