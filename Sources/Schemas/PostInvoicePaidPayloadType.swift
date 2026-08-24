import Foundation

/// The webhook event type
public enum PostInvoicePaidPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case invoicePaid = "invoice.paid"
}