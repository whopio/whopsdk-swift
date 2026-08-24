import Foundation

/// Whether Whop calculated tax for this preview. `not_calculated` means no tax could be determined, so `tax_amount` is 0 and `total` equals `subtotal`.
public enum CalculateTaxPlansResponseStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case calculated
    case notCalculated = "not_calculated"
}