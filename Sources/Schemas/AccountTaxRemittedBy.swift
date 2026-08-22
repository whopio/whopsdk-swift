import Foundation

/// Who calculates and remits tax for the account: `whop` (Whop calculates and remits), `self` (Whop calculates; the account collects and remits), or `none` (neither; the account is responsible). `null` until the account enrolls in the Whop tax service.
public enum AccountTaxRemittedBy: String, Codable, Hashable, CaseIterable, Sendable {
    case whop
    case `self`
    case none
}