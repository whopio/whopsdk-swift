import Foundation

/// The status of a receipt
public enum ReceiptStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case draft
    case open
    case authorized
    case paid
    case pending
    case uncollectible
    case unresolved
    case void
}