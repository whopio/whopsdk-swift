import Foundation

/// Global affiliate program status.
public enum PaymentInputVariantProductGlobalAffiliateStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case enabled
    case disabled
}