import Foundation

/// How renewals are collected. `charge_automatically` charges the saved payment method each period; `send_invoice` emails the buyer an invoice each period. `null` when not set.
public enum MembershipCollectionMethod: String, Codable, Hashable, CaseIterable, Sendable {
    case chargeAutomatically = "charge_automatically"
    case sendInvoice = "send_invoice"
}