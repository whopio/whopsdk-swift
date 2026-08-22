import Foundation

/// The types of payouts an affiliate can have
public enum AffiliatePayoutTypes: String, Codable, Hashable, CaseIterable, Sendable {
    case percentage
    case flatFee = "flat_fee"
}