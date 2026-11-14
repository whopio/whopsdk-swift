import Foundation

/// Billing model for the variant.
public enum RetrieveCheckoutConfigurationsResponseVariantBillingType: String, Codable, Hashable, CaseIterable, Sendable {
    case renewal
    case oneTime = "one_time"
}