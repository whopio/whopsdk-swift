import Foundation

public enum ListSearchRequestTypesItem: String, Codable, Hashable, CaseIterable, Sendable {
    case account
    case member
    case membership
    case payment
    case affiliate
    case review
    case resolutionCenterCase = "resolution_center_case"
    case promoCode = "promo_code"
}