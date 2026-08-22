import Foundation

/// The funding types of a card
public enum CardFundingTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case credit
    case debit
    case prepaid
}