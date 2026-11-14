import Foundation

/// The `collection_method` a draft's scheduled send applies when it fires. `null` when the draft has no scheduled send or it was scheduled without one, and once the invoice is issued.
public enum InvoiceScheduledCollectionMethod: String, Codable, Hashable, CaseIterable, Sendable {
    case chargeAutomatically = "charge_automatically"
    case sendInvoice = "send_invoice"
}