import Foundation

/// The webhook event type
public enum PostInvoiceVoidedPayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case invoiceVoided = "invoice.voided"
}