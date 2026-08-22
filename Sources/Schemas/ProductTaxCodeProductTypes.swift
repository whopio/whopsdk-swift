import Foundation

/// The product_type of the ProductTaxCode
public enum ProductTaxCodeProductTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case physical
    case digital
    case services
}