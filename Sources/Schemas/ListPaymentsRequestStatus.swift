import Foundation

public enum ListPaymentsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case open
    case authorized
    case paid
    case pending
    case uncollectible
    case unresolved
    case void
}