import Foundation

/// The enrollment status in the member affiliate program.
public enum CreateProductsRequestMemberAffiliateStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case enabled
    case disabled
}