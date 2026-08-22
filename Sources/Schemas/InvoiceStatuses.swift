import Foundation

/// The different statuses an invoice can be in
public enum InvoiceStatuses: String, Codable, Hashable, CaseIterable, Sendable {
    case draft
    case open
    case paid
    case pastDue = "past_due"
    case uncollectible
    case void
}