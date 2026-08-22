import Foundation

/// The webhook event type
public enum PostInvoiceMarkedUncollectiblePayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case invoiceMarkedUncollectible = "invoice.marked_uncollectible"
}