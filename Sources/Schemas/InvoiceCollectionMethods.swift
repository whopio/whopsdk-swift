import Foundation

/// The method of collection for an invoice.
public enum InvoiceCollectionMethods: String, Codable, Hashable, CaseIterable, Sendable {
    case sendInvoice = "send_invoice"
    case chargeAutomatically = "charge_automatically"
}