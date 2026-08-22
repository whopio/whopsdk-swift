import Foundation

/// The webhook event type
public enum PostInvoiceCreatedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case invoiceCreated = "invoice.created"
}