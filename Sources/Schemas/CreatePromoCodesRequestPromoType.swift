import Foundation

public enum CreatePromoCodesRequestPromoType: String, Codable, Hashable, CaseIterable, Sendable {
    case percentage
    case flatAmount = "flat_amount"
}