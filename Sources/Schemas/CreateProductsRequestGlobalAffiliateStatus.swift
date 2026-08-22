import Foundation

/// The enrollment status in the global affiliate program.
public enum CreateProductsRequestGlobalAffiliateStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case enabled
    case disabled
}