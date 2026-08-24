import Foundation

/// Determines whether tax is included in the listed price or added at checkout.
public enum UpdateAccountsRequestTaxType: String, Codable, Hashable, CaseIterable, Sendable {
    case inclusive
    case exclusive
}