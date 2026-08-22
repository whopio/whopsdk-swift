import Foundation

/// How tax is applied to the account's prices: `inclusive` (tax included in the listed price) or `exclusive` (tax added on top). Defaults to `exclusive` when unset; `null` only when the account has no payment connection.
public enum AccountTaxType: String, Codable, Hashable, CaseIterable, Sendable {
    case inclusive
    case exclusive
}