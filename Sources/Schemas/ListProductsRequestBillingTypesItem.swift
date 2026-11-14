import Foundation

public enum ListProductsRequestBillingTypesItem: String, Codable, Hashable, CaseIterable, Sendable {
    case renewal
    case oneTime = "one_time"
}