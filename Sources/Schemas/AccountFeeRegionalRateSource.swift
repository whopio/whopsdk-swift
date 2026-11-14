import Foundation

/// Where the regional rate in effect comes from: `default` is the platform rate, `custom` a rate negotiated for this account, and `inherited` a rate negotiated by the platform this account is connected to.
public enum AccountFeeRegionalRateSource: String, Codable, Hashable, CaseIterable, Sendable {
    case `default`
    case custom
    case inherited
}