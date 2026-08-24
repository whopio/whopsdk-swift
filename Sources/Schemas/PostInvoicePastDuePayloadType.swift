import Foundation

/// The webhook event type
public enum PostInvoicePastDuePayloadType: String, Codable, Hashable, CaseIterable, Sendable {
    case invoicePastDue = "invoice.past_due"
}