import Foundation

/// Determines whether Whop or the account calculates and remits tax. The account must provide a supported-country business address when it self-remits.
public enum UpdateAccountsRequestTaxRemittedBy: String, Codable, Hashable, CaseIterable, Sendable {
    case whop
    case `self`
    case none
}