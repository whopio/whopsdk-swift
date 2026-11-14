import Foundation

/// How the subscription this invoice starts collects each renewal. `charge_automatically` charges the payment method that paid the invoice each period: the draft's `payment_method_id`, or the one the customer pays the invoice link with. `send_invoice` issues a numbered invoice each period, due on the renewal date and emailed with its payment link to the latest invoice's `recipient_emails`, so it needs at least one recipient and isn't available for invoices billed to a business. Defaults to `charge_automatically`. Only for a draft with a recurring item. A scheduled send applies it when it fires (see `scheduled_collection_method`).
public enum IssueInvoicesRequestCollectionMethod: String, Codable, Hashable, CaseIterable, Sendable {
    case chargeAutomatically = "charge_automatically"
    case sendInvoice = "send_invoice"
}