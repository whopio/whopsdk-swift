import Foundation

/// Layout used on the account store page.
public enum UpdateAccountsRequestStorePageConfigLayout: String, Codable, Hashable, CaseIterable, Sendable {
    case featured
    case compact
}