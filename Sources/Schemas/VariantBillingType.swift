import Foundation

/// Billing model for this variant.
public enum VariantBillingType: String, Codable, Hashable, CaseIterable, Sendable {
    case renewal
    case oneTime = "one_time"
}