import Foundation

/// `calculated`: every line was priced and a payment may consume the quote. `not_applicable`: this seller collects no tax on this purchase, so the quote owes none and may still be consumed. `unavailable`: tax could not be priced — the provider did not answer, or this seller's tax setup cannot price a purchase here — so a payment refuses the quote; quote again, or charge without `quote_id` to have tax calculated at charge time.
public enum PaymentQuoteTaxStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case calculated
    case notApplicable = "not_applicable"
    case unavailable
}