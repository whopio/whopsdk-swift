import Foundation

public enum ListInvoicesRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case draft
    case open
    case authorized
    case paid
    case pending
    case uncollectible
    case unresolved
    case void
}