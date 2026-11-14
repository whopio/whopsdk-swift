import Foundation

/// Billing model for this variant: `one_time` or `renewal`.
public enum WaitlistEntryVariantBillingType: String, Codable, Hashable, CaseIterable, Sendable {
    case renewal
    case oneTime = "one_time"
}