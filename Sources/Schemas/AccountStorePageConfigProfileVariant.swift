import Foundation

/// Profile presentation used on the account store page.
public enum AccountStorePageConfigProfileVariant: String, Codable, Hashable, CaseIterable, Sendable {
    case personal
    case business
}