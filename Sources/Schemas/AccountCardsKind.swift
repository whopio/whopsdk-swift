import Foundation

/// Whether the card application verifies a business (`business`, KYB) or a person (`individual`, consumer identity). `null` when the application is not yet linked to a verification.
public enum AccountCardsKind: String, Codable, Hashable, CaseIterable, Sendable {
    case individual
    case business
}